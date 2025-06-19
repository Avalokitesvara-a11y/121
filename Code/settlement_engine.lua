
-- SATC Settlement Engine
-- Computes profit/loss for open contracts and manages liquidation logic

local Settlement = {}

-- Compute PnL for a closed position
function Settlement.calculate_pnl(position, market_price)
    local diff = 0

    if position.type == "long" then
        diff = market_price - position.entry
    elseif position.type == "short" then
        diff = position.entry - market_price
    else
        return 0
    end

    local pnl = diff * position.amount * 0.00001 * (position.multiplier or 1)
    return pnl
end

-- Check if a position must be liquidated
function Settlement.check_liquidation(position, balance, market_price)
    local potential_loss = Settlement.calculate_pnl(position, market_price)

    -- If loss exceeds current balance, auto-liquidate
    if potential_loss < -balance then
        return true, potential_loss
    else
        return false, potential_loss
    end
end

return Settlement
