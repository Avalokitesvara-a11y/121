
# SATC Protocol — Direct P2P Exchange (SATC ⇄ BTC)

This document defines the logic and user flow behind the Direct Crypto Exchange system inside SATC:
a peer-to-peer marketplace where users can exchange SATC units for real BTC without the platform acting as a financial intermediary.

---

## Purpose

- Enable users to buy/sell SATC for BTC directly
- Avoid custody, regulation, licensing
- Maintain SATC as a non-crypto accounting token
- Provide real market liquidity via user cooperation

---

## Exchange Structure

Users interact directly. The SATC platform:
- Hosts offer listings
- Tracks SATC balances
- Freezes SATC during pending trades (optional)
- Logs confirmations, disputes, and user ratings

---

## Trade Flow

### 1. Create Offer

User A creates an offer:
```json
{
  "type": "sell",
  "asset": "SATC",
  "amount": 100,
  "btc_price": 0.001,
  "contact": "@UserA"
}
```
Meaning: "I sell 100 SATC for 0.001 BTC. Contact me on Telegram."

SATC may be locked/frozen until trade completes.

---

### 2. Accept Offer

User B contacts User A and agrees to pay 0.001 BTC.

Payment happens **off-platform**:
- BTC address
- Cash
- Mobile money
- Any channel users agree on

---

### 3. Confirm Trade

User A confirms BTC receipt via USSD/Web:
```
*121*3*confirm*offer_id#
```

SATC is transferred from A to B.

Alternatively, if a dispute arises, a moderator may step in (optional).

---

## Command Structure (USSD)

| Code | Action     | Example                              |
|------|------------|--------------------------------------|
| 3    | P2P Mode   | All SATC ⇄ BTC direct exchanges      |
| 1    | Create     | *121*3*1*100*0.001# → Sell 100 SATC at 0.001 BTC |
| 2    | Accept     | *121*3*2*offer_id#                    |
| 3    | Confirm    | *121*3*3*offer_id#                    |
| 4    | Dispute    | *121*3*4*offer_id#                    |

---

## Risk Handling

| Risk                | Solution                          |
|---------------------|-----------------------------------|
| Fraudulent seller   | Freeze SATC until confirmation    |
| Fake buyer          | Rating system and complaints      |
| Disputes            | Manual review/moderator resolution|
| Wash trading        | Anti-abuse logic, IP tracking     |

---

## Legal Position

- Platform does NOT hold BTC or fiat
- All SATC transactions are internal points
- BTC moves P2P, voluntarily, via user agreements
- Platform acts as listing directory only

---

## Features (Optional)

- Ranks and trade history
- Offer expiry timeouts
- P2P identity verification
- In-platform chat or external contact via Telegram/Signal
- Fees (e.g., 0.1 SATC per trade)

---

## Summary

Direct Exchange enables peer-to-peer SATC ⇄ BTC trading:
- Zero custody
- Zero regulation exposure
- Maximum decentralization
- SATC becomes useful and liquid

