
-- SATC Balance Store
-- Simple in-memory balance and position tracker

local BalanceStore = {
    satc_balance = 1000,
    positions = {}
}

function BalanceStore.get_balance()
    return BalanceStore.satc_balance
end

function BalanceStore.update_balance(delta)
    BalanceStore.satc_balance = BalanceStore.satc_balance + delta
end

function BalanceStore.save_position(id, position)
    BalanceStore.positions[id] = position
end

function BalanceStore.get_position(id)
    return BalanceStore.positions[id]
end

function BalanceStore.delete_position(id)
    BalanceStore.positions[id] = nil
end

function BalanceStore.list_positions()
    local result = {}
    for id, pos in pairs(BalanceStore.positions) do
        table.insert(result, id .. ": " .. pos.type .. " " .. pos.amount .. "@" .. pos.entry)
    end
    return result
end

return BalanceStore
