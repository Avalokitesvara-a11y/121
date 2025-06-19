
# SATC Protocol — USSD Command Structure

This document defines all USSD commands used in the SATC system, structured for compatibility with GSM protocols. USSD only accepts digits (0–9), * and #. Therefore, actions are encoded numerically.

---

## Format

```
*121*<mode>*<action>*<amount>*<price>*<optional>#
```

### Mode values:

| Value | Mode Name     | Description                          |
|--------|---------------|--------------------------------------|
| 1      | Spot          | Real BTC purchase or conversion      |
| 2      | SimTrade      | Simulated long/short contracts       |
| 3      | DirectExchange| P2P offers for SATC ⇄ BTC            |

---

## Spot Mode — `*121*1*...#`

| Action | Description                 | Example                      |
|--------|-----------------------------|------------------------------|
| 1      | Buy SATC                    | `*121*1*1*10*0#`             |
| 2      | Sell SATC                   | `*121*1*2*10*105900#`        |
| 9      | Deposit via airtime/mobile | `*121*1*9*500#`              |

---

## SimTrade Mode — `*121*2*...#`

| Action | Description                             | Example                             |
|--------|-----------------------------------------|-------------------------------------|
| 1      | Open Long                               | `*121*2*1*50*105000*3#`             |
| 2      | Close Long                              | `*121*2*2*position_id#`             |
| 3      | Open Short                              | `*121*2*3*25*102000*2#`             |
| 4      | Close Short                             | `*121*2*4*position_id#`             |

> Optional 6th parameter = multiplier (1–5). Default is 1x.

---

## DirectExchange Mode — `*121*3*...#`

| Action | Description                             | Example                             |
|--------|-----------------------------------------|-------------------------------------|
| 1      | Create Offer                            | `*121*3*1*100*0.001#`               |
| 2      | Accept Offer                            | `*121*3*2*offer_id#`                |
| 3      | Confirm Trade Completion                | `*121*3*3*offer_id#`                |
| 4      | Dispute / Flag Offer                    | `*121*3*4*offer_id#`                |
| 5      | Transfer SATC to Another User           | `*121*3*5*50*3726XXXXXXX#`          |

---

## Balance / Status / Info Commands

| Command              | Description                |
|----------------------|----------------------------|
| `*121*0*1#`          | Check SATC balance         |
| `*121*0*2#`          | List open positions        |
| `*121*0*3#`          | View transaction history   |
| `*121*0*4#`          | View active P2P offers     |

---

## Notes

- All commands are digit-compatible and usable on feature phones
- `price = 0` means market price
- Server validates multiplier range (1–5) and available SATC

---

## Future Actions

- Add withdrawal options
- Add staking / loyalty tier upgrades
- Enable operator-linked identity verification

