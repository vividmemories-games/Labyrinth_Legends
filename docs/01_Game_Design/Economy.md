# Economy

## Currencies

| Currency | Earn | Spend |
|----------|------|-------|
| Coins | Level complete, ads (future) | Hints, shop items |
| Gems | Level gems, IAP (future), ads | Hints, boosters, skins |
| Hints | Starter grant, shop | One path step reveal |

## Starter Values (tunable via Remote Config later)

| Resource | Default |
|----------|---------|
| Coins | 100 |
| Gems | 50 |
| Hints | 3 |

## Hint Cost

- 1 free hint if `hintsRemaining > 0`
- Else 25 coins or 15 gems (configurable)

## Level Rewards

- Base coins per completion
- Star multiplier bonus
- All gems on path collected to inventory

## Anti-Farm Rules

- Replaying levels awards coins but star total only increases on new best
- Daily challenge: once per day bonus (future)

See `Monetization.md` for IAP/ad hooks.
