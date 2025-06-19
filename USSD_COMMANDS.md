
# SATC Protocol — USSD Command Structure

This document defines all USSD commands used in the SATC system.  
USSD supports only digits (0–9), * and #. All user actions are encoded using numeric codes.

---

## Format

```
*121*<mode>*<action>*<amount>*<price>*<optional>#
```

---

## Mode Table

| Mode | Name           | Description                         |
|------|----------------|-------------------------------------|
| 1    | Spot           | Real BTC purchases (via balance)    |
| 2    | SimTrade       | Simulated long/short contracts      |
| 3    | DirectExchange | Peer-to-peer SATC ⇄ BTC offers      |
| 0    | Info/Utility   | Balance, history, position listing  |

---

## Mode 1: Spot Trading

| Action | Description                 | Example                      |
|--------|-----------------------------|------------------------------|
| 1      | Buy SATC                    | `*121*1*1*10*0#`             |
| 2      | Sell SATC                   | `*121*1*2*10*105900#`        |
| 9      | Deposit via mobile airtime | `*121*1*9*500#`              |

---

## Mode 2: SimTrade (Virtual Contracts)

| Action | Description                       | Example                             |
|--------|-----------------------------------|-------------------------------------|
| 1      | Open Long                         | `*121*2*1*50*105000*2#`             |
| 2      | Close Long                        | `*121*2*2*position_id#`             |
| 3      | Open Short                        | `*121*2*3*25*102000*3#`             |
| 4      | Close Short                       | `*121*2*4*position_id#`             |

> Multiplier (1–5) is optional in position commands.

---

## Mode 3: DirectExchange (P2P)

| Action | Description                         | Example                             |
|--------|-------------------------------------|-------------------------------------|
| 1      | Create Offer                        | `*121*3*1*100*0.001#`               |
| 2      | Accept Offer                        | `*121*3*2*offer_id#`                |
| 6      | Confirm Trade Completion            | `*121*3*6*offer_id#`                |
| 7      | Dispute / Flag Offer                | `*121*3*7*offer_id#`                |
| 5      | Transfer SATC to Another User       | `*121*3*5*50*3726XXXXXXX#`          |

---

## Mode 0: Info & Utility

| Command              | Description                |
|----------------------|----------------------------|
| `*121*0*1#`          | Check SATC balance         |
| `*121*0*2#`          | List open positions        |
| `*121*0*3#`          | View transaction history   |
| `*121*0*4#`          | View active P2P offers     |

---

## Notes

- `price = 0` implies market price
- USSD-compatible syntax: digits only
- Validation occurs on server for range, balance, and offer status
- Commands are compatible with GSM feature phones

