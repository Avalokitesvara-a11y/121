
# SATC Protocol: Pseudo-Derivative System for BTC Simulation

SATC (Satoshi Contracts) is a virtual asset accounting system designed to emulate BTC price exposure, 
market dynamics, and user speculation without triggering financial regulations or requiring crypto custody. 

This is not a joke. It's a functioning conceptual bypass architecture for deploying BTC-linked financial logic 
in hostile or restricted regulatory environments (e.g., USSD, non-KYC, developing markets, telco integration).

---

## Core Concept

- SATC = 1,000 satoshi (0.00001 BTC), used as a fictional trading unit
- No real BTC is moved, stored, or delivered
- All prices are calculated against live BTC/USD feed
- Users interact via structured command sets (e.g., USSD)

The platform behaves like a BTC-trading interface, but legally it's just virtual point management.

---

## Why It Exists

Most countries regulate:
- Derivatives
- Margin trading
- FX platforms
- Crypto custodians

SATC bypasses all of this by:
- Not being redeemable
- Not offering delivery
- Not using crypto
- Not taking fiat custody
- Acting only as a balance tracking service

---

## Legal Circumvention

SATC is not a derivative, currency, security, or commodity.

It is:
- A loyalty / utility point within a gamified trading simulation
- A virtual non-custodial balance unit without real-world convertibility
- Exchanged voluntarily P2P between users with no fiat or crypto interface

Deployment is legally analogous to:
- Game tokens
- In-app currency
- Leaderboard point systems

Any monetary exchange happens off-platform, between users, at their own risk.

---

## USSD Trading Protocol

Command structure:

```
*121*<asset_id>*<action>*<amount>*<price>#
```

Example:
```
*121*1*3*50*105000#
```

Interpreted as:
- Asset: BTC
- Action: 3 (Short)
- Amount: 50 contracts (50,000 satoshi)
- Entry price: $105,000/BTC

---

## Trade Types

| Code | Action       | Description                        |
|------|--------------|------------------------------------|
| 1    | Buy          | Acquire SATC with internal balance |
| 2    | Sell         | Liquidate SATC holdings            |
| 3    | Short        | Open downward speculation position |
| 4    | Close Short  | Exit open short position           |

---

## Risk System

No margin. No leverage. But:

- Optional pseudo-leverage via Multiplier
- Multiplier boosts both profit and loss
- Position auto-liquidation if balance insufficient

---

## Legal Position Summary

| Aspect           | SATC Platform                          |
|------------------|-----------------------------------------|
| Financial product? | No                                  |
| Crypto exchange?   | No                                  |
| Derivative?        | No (no delivery, no expiry)         |
| Escrow service?    | No (P2P direct payments only)       |
| Utility token?     | Internally yes, externally no value |

---

## Deployment Ideas

- Telco operator integration (SATC to airtime, not cash)
- P2P marketplace with fiat negotiation
- Loyalty-based reward engines
- Gamified Telegram bots
- On-chain price oracle for transparency

---

## License

Released under a restricted custom license. Redistribution or real-world deployment requires credit, disclosure, and full compliance with local regulations.

---

## Author's Note

SATC is not a toy. It's a deployment model for asymmetric environments. 
Use it at your own risk — and make sure you're smarter than the regulator.
