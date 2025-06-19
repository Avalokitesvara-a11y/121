
# SATC Protocol — Price Engine

The Price Engine is responsible for pricing SATC relative to BTC using real-time market data. It provides prices for spot purchases, PnL calculations, and market orders across the SATC ecosystem.

---

## 1. Price Calculation

Each SATC unit represents 0.00001 BTC (1000 satoshis).  
The SATC price in USD is derived as:

```
SATC-USD = BTC-USD × 0.00001
```

---

## 2. Data Sources

The price engine pulls BTC/USD prices from external exchanges (oracles), such as:

- Kraken
- Binance
- Bitstamp (optional fallback)
- CoinGecko API (read-only backup)

All API requests are cached and rate-limited.

---

## 3. Use Cases

| Use Case             | Description                            |
|----------------------|----------------------------------------|
| Spot Purchase        | Determines how many SATC for fiat      |
| SimTrade Contracts   | Establishes entry/exit PnL baseline    |
| Market Orders        | Resolves `price = 0` in USSD commands  |
| P2P Reference        | Provides visible quote for fair trades |

---

## 4. Price Snapshots

Each price update is timestamped and stored:

```json
{
  "timestamp": 1687210000,
  "source": "kraken",
  "btc_usd": 70500,
  "satc_usd": 0.705
}
```

A moving average (e.g. 5min, 30min) may be computed for anti-volatility measures.

---

## 5. API Interface (Planned)

| Endpoint              | Description                      |
|-----------------------|----------------------------------|
| `/price/current`      | Returns latest BTC & SATC prices |
| `/price/history`      | Returns time-series data         |
| `/price/average`      | Returns SMA or VWAP              |

---

## 6. Market Order Resolution

In USSD:
- `price = 0` triggers fetch from `PriceEngine`
- SATC calculated from user input (fiat, BTC)

Example:

```text
*121*1*1*10*0# → Buy 10 SATC at current market rate
```

Backend fills price with real SATC-USD quote from oracle.

---

## Summary

The Price Engine powers all pricing logic in SATC — anchoring every contract, trade, and spot operation to real BTC value while remaining clean of custody or payment rails.
