
# SATC Protocol — USSD Command Structure

This document defines the command format and usage of USSD-based interaction with the SATC Protocol.
There are two operational modes: Spot and Simulated Contracts (SimTrade).

---

## General Format

```
*121*<mode>*<action>*<amount>*<price>#
```

Where:
- `121` is the service access code (SAC)
- `mode` defines Spot vs Simulation
- `action` is the type of trade
- `amount` is quantity (in SATC)
- `price` is either fixed price or `0` for market

---

## Modes

| Code | Mode          | Description                               |
|------|---------------|-------------------------------------------|
| 1    | Spot          | Buy real or pseudo-backed BTC             |
| 2    | SimTrade      | Trade simulated SATC contracts (futures)  |

---

## Actions

### Mode 1 — Spot

| Code | Action    | Description                     |
|------|-----------|---------------------------------|
| 1    | Buy       | Buy BTC (spot)                  |
| 2    | Sell      | Sell BTC                        |

Example:
```
*121*1*1*5*0#       → Buy 5 SATC at market price
*121*1*2*10*70500#  → Sell 10 SATC at $70,500
```

---

### Mode 2 — SimTrade (Contract Simulation)

| Code | Action        | Description                         |
|------|---------------|-------------------------------------|
| 1    | Long          | Open long position                  |
| 2    | Close Long    | Close existing long position        |
| 3    | Short         | Open short position                 |
| 4    | Close Short   | Close existing short position       |

Example:
```
*121*2*3*50*105000# → Open short 50 SATC @ $105,000
*121*2*2*10*0#      → Close 10 SATC long at market
```

---

## Optional Extensions

### Mode 3 — Wallet

| Code | Action        | Description                         |
|------|---------------|-------------------------------------|
| 1    | Balance Check | Show user's SATC / BTC balance      |
| 2    | Tx History    | List recent trades                  |
| 3    | Deposit Info  | Show how to top up account          |

---

## Rules and Notes

- Use `0` as price to trigger market order
- Amounts are in SATC (i.e., 1 unit = 1000 satoshi)
- Prices are in USD per BTC
- Max input length must follow telco constraints (e.g. 182 chars max)

---

## Security Considerations

- Commands should be validated on server for:
  - Syntax
  - Authentication (via phone number or session)
  - Limits (anti-fraud, balance, etc.)

---

## Example Session (Spot Buy)

User dials:
```
*121*1*1*10*0#
```

Backend:
- Fetches BTC/USD = $71,200
- Calculates SATC = 0.712
- Deducts $7.12 from balance
- Adds 10 SATC to wallet
- Confirms via USSD: "Bought 10 SATC @ $0.712 each. Total: $7.12"

---

## Summary

This USSD protocol provides simple, low-bandwidth access to crypto trading logic
via telecom networks. The structure is designed to be compatible with basic GSM handsets.

