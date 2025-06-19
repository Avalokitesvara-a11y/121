
# SATC Protocol Specification

The SATC Protocol defines a lightweight, regulation-aware financial simulation framework 
designed to emulate Bitcoin-linked instruments through a dual-mode architecture:

- **Spot Mode**: Enables real BTC purchases or backed representations
- **SimTrade Mode**: Simulates leveraged positions via internal contracts (SATC units)

---

## 1. Unit Definition

- `SATC` (Satoshi Contract) is the primary unit of account
- 1 SATC = 1000 satoshis = 0.00001 BTC
- All SATC pricing is denominated in USD, using live BTC/USD feed

---

## 2. Architecture

### Spot Mode

- Real or pseudo-backed BTC purchases
- SATC credited after fiat top-up (e.g. via mobile operator)
- BTC price fetched via oracles (Kraken, Binance)
- Optionally connected to user-supplied exchange APIs

### SimTrade Mode

- Contracts simulate BTC price exposure
- Supports long/short with optional multipliers
- No delivery, no leverage, no custody
- Profit/loss based on price movement only

---

## 3. Command Format (USSD)

```
*121*<mode>*<action>*<amount>*<price>#
```

- `mode`: 1 = Spot, 2 = SimTrade, 3 = P2P Exchange
- `action`: Contextual (Buy, Sell, Short, Close, etc.)
- `amount`: Quantity of SATC
- `price`: USD/BTC price or 0 for market

---

## 4. Price Engine

- Fetches BTC/USD from multiple sources
- Calculates:
  ```
  SATC-USD = BTC-USD * 0.00001
  ```
- Caches price and logs historical rates for transparency
- Used in both entry pricing and profit/loss calculations

---

## 5. Direct P2P Exchange

- Users trade SATC ⇄ BTC directly, off-platform
- Offers listed via USSD or web
- BTC payment handled externally
- SATC transfer confirmed by both parties
- No custody, only listing and logging

---

## 6. Legal Position

| Aspect             | SATC Platform                         |
|--------------------|----------------------------------------|
| Custody            | No (user-managed BTC transfers)        |
| Regulated assets   | No (SATC is non-redeemable)            |
| Derivatives        | No (SimTrade is simulation only)       |
| KYC/AML Required   | No (uses phone number identity only)   |
| Licensing Needed   | No (if no fiat or crypto is stored)    |

---

## 7. Deployment Contexts

- Mobile-first environments (via USSD)
- Low-infra or non-KYC regions
- Gamified trading apps
- P2P platforms with fiat conversion
- Loyalty point-based crypto simulation

---

## 8. Extensions

- Telegram integration
- Direct Exchange API
- Reward mechanisms (multipliers, loyalty tiers)
- Third-party plugin system for exchanges and wallets

---

## Summary

SATC is a modular framework for simulating BTC-linked instruments in a legally compliant, telecom-native format.  
It supports spot acquisition, simulated trading, and peer-driven liquidity without violating regulatory boundaries.

