
-- SATC Session Engine
-- Parses incoming USSD requests and routes to logic layer

local SessionEngine = {}

-- Dummy backend interface
local WalletEngine = require("wallet_engine")
local TradeEngine = require("trade_engine")

-- Split USSD string into tokens
local function tokenize(ussd)
    local tokens = {}
    for token in string.gmatch(ussd, "([^*#]+)") do
        table.insert(tokens, token)
    end
    return tokens
end

-- Entry point for processing USSD
function SessionEngine.process(ussd_input)
    local t = tokenize(ussd_input)

    if #t < 3 then
        return "Invalid USSD string"
    end

    local mode = tonumber(t[2])
    local action = tonumber(t[3])

    if mode == 0 then
        if action == 1 then
            return WalletEngine.get_balance()
        elseif action == 2 then
            return TradeEngine.list_positions()
        else
            return "Unknown info command"
        end
    elseif mode == 1 then
        return "[Spot Mode] Action not implemented in demo"
    elseif mode == 2 then
        return TradeEngine.handle_simtrade(t)
    elseif mode == 3 then
        return "[DirectExchange] Action not implemented in demo"
    else
        return "Unsupported mode"
    end
end

return SessionEngine
