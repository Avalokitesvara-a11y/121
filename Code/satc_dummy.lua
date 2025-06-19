
-- SATC Dummy Engine (Lua)
-- This script simulates core SATC functionality in a telecom-like environment

local satc_balance = 0
local positions = {}

function deposit(units)
    satc_balance = satc_balance + units
    print("Deposited " .. units .. " SATC. Total: " .. satc_balance)
end

function buy_satc(units, price)
    local cost = units * price
    if satc_balance >= cost then
        satc_balance = satc_balance - cost
        print("Bought " .. units .. " SATC @ " .. price)
    else
        print("Insufficient balance.")
    end
end

function open_long(id, units, entry_price, multiplier)
    positions[id] = {
        type = "long",
        amount = units,
        entry = entry_price,
        multiplier = multiplier or 1
    }
    print("Opened LONG position: " .. id)
end

function open_short(id, units, entry_price, multiplier)
    positions[id] = {
        type = "short",
        amount = units,
        entry = entry_price,
        multiplier = multiplier or 1
    }
    print("Opened SHORT position: " .. id)
end

function close_position(id, current_price)
    local p = positions[id]
    if not p then
        print("Position not found.")
        return
    end

    local diff = 0
    if p.type == "long" then
        diff = (current_price - p.entry)
    else
        diff = (p.entry - current_price)
    end

    local pnl = diff * p.amount * 0.00001 * p.multiplier
    satc_balance = satc_balance + pnl
    print("Closed " .. p.type .. " " .. id .. " | PnL: " .. pnl .. " | New Balance: " .. satc_balance)
    positions[id] = nil
end

function balance()
    print("SATC Balance: " .. satc_balance)
end

-- Simulated session
deposit(1000)
buy_satc(100, 0.7)
open_long("tx123", 50, 70000, 2)
close_position("tx123", 75000)
balance()
