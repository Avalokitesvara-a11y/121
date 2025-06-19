
-- SATC Price Oracle (Mock)
-- Returns fixed or random BTC/USD price for testing

local PriceOracle = {}

-- Static price for controlled test
PriceOracle.fixed_price = 70500

-- Return current BTC price (mocked)
function PriceOracle.get_btc_usd()
    return PriceOracle.fixed_price
end

-- Derive SATC price
function PriceOracle.get_satc_usd()
    return PriceOracle.fixed_price * 0.00001
end

-- Set price manually (for test)
function PriceOracle.set_price(new_price)
    PriceOracle.fixed_price = new_price
end

return PriceOracle
