#!/usr/bin/env bash
# Cursor stop hook — remind the agent to scaffold a review package after major tasks.
#
# Fires when lib/ or test/ Dart files are newer than the latest review package.
# Skips if a review package was already created/updated in the same work window.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
REVIEWS_DIR="$REPO_ROOT/docs/99_Reviews"

file_mtime() {
  local path="$1"
  if [[ ! -f "$path" ]]; then
    echo 0
    return
  fi
  if stat -f %m "$path" >/dev/null 2>&1; then
    stat -f %m "$path"
  else
    stat -c %Y "$path"
  fi
}

newest_mtime_in_tree() {
  local root="$1"
  local pattern="$2"
  local newest=0
  local f m

  if [[ ! -d "$root" ]]; then
    echo 0
    return
  fi

  while IFS= read -r f; do
    [[ -z "$f" ]] && continue
    m="$(file_mtime "$f")"
    if (( m > newest )); then
      newest=$m
    fi
  done < <(find "$root" -type f -name "$pattern" 2>/dev/null)

  echo "$newest"
}

newest_review_mtime() {
  local newest=0
  local f m

  if [[ ! -d "$REVIEWS_DIR" ]]; then
    echo 0
    return
  fi

  while IFS= read -r f; do
    [[ -z "$f" ]] && continue
    m="$(file_mtime "$f")"
    if (( m > newest )); then
      newest=$m
    fi
  done < <(
    find "$REVIEWS_DIR" -mindepth 2 -maxdepth 2 -type f -name '*.md' \
      ! -name 'README.md' \
      ! -name 'Review_Template.md' \
      2>/dev/null
  )

  echo "$newest"
}

newest_code_mtime() {
  local lib_mtime test_mtime newest=0

  lib_mtime="$(newest_mtime_in_tree "$REPO_ROOT/lib" '*.dart')"
  test_mtime="$(newest_mtime_in_tree "$REPO_ROOT/test" '*.dart')"

  if (( lib_mtime > newest )); then newest=$lib_mtime; fi
  if (( test_mtime > newest )); then newest=$test_mtime; fi

  echo "$newest"
}

code_mtime="$(newest_code_mtime)"
review_mtime="$(newest_review_mtime)"

# Code changed after the latest review package → likely needs a new/updated review.
if (( code_mtime > review_mtime && code_mtime > 0 )); then
  python3 - <<'PY'
import json

print(json.dumps({
    "followup_message": (
        "Before you finish: if this was a **major task**, scaffold and complete a review package:\n\n"
        "```bash\n"
        "./scripts/new_review_package.sh <Category> <topic_slug> --phase \"...\" --update-index\n"
        "```\n\n"
        "Fill all sections per `docs/99_Reviews/Review_Template.md`, run tests/analyze, "
        "and mark **Ready For** when complete.\n\n"
        "Skip this only for minor fixes that do not need a review package."
    )
}))
PY
else
  echo '{}'
fi

exit 0
