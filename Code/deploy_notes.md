
# SATC Protocol — Deployment Notes

This document outlines real-world deployment options for the SATC protocol in telecom environments.

---

## 🔧 Requirements

- Telecom operator willing to expose USSD or SIM Application Toolkit
- Server-side Linux machine (can be cloud/VPS)
- Lua 5.1+ installed
- Bash for interface scripting
- Optional: Redis or SQL store

---

## 🌍 Deployment Models

### 1. Direct Telco Integration

- Telco exposes a USSD short code (e.g., `*121#`)
- Forwards user session to SATC engine (via HTTP or socket)
- Lua engine parses, stores, and responds
- Airtime payments handled internally (billing hooks)

### 2. MVNO Partnership

- Use a virtual operator (MVNO) and request access to USSD & SMS
- Easier integration and fewer legal barriers
- Operate under loyalty / reward platform model

### 3. API Gateway Model

- Expose REST endpoints for SATC actions
- Accept session data from frontend or mobile app
- Lua engine used for logic; any frontend stack

---

## 🧱 Tech Stack

| Layer             | Component            |
|------------------|----------------------|
| Session handler   | Bash + Lua           |
| Business logic    | `session_engine.lua` |
| Balance storage   | `balance_store.lua`  |
| Pricing feed      | `price_oracle.lua`   |
| Settlement        | `settlement_engine.lua` |
| Telco interface   | `interface.sh`       |

---

## 🧪 Test Scenario

1. Deploy files on test server
2. Run:
   ```bash
   ./interface.sh '*121*2*1*10*70000#'
   ```
3. Adjust price with:
   ```lua
   > require("price_oracle").set_price(75000)
   ```
4. Close position:
   ```bash
   ./interface.sh '*121*0*2#'
   ```

---

## 🛡 Legal Guidance

- Do not market as "crypto"
- Frame as "gamified loyalty engine"
- No fiat or crypto custody
- All exchanges must be P2P or telco-internal

---

## 📦 Packaging

Bundle the following:

- All `.lua` and `.sh` files
- `README.md`, `LICENSE`, `USSD_COMMANDS.md`
- Example logs and session traces

Create `.zip` or `.tar.gz` for handoff.

---

## ☎️ Telco Terms to Learn

- USSD Gateway (GGSN / MSC)
- Charging Gateway (OCS / IN)
- SMPP / STK / CAMEL protocol
- MVNO provisioning
- VAS (Value Added Services)

---

SATC is telecom-native crypto simulation tech — built for asymmetric markets.

