RegisterCommand("searchped", function(source, args, rawCommand)
    if (source > 0) then
        local player = source
        local playerName = GetPlayerName(player)
        local time = args[1]
        TriggerClientEvent("chat:addMessage", -1, {
            args = { "^*^4" .. playerName, "^3Searches ped, what do I find?"},
            color = { 105, 235, 50 }
        })
    end
end, false)

RegisterCommand("searchveh", function(source, args, rawCommand)
    if (source > 0) then
        local player = source
        local playerName = GetPlayerName(player)
        local time = args[1]
        TriggerClientEvent("chat:addMessage", -1, {
            args = { "^*^4" .. playerName, "^3Searches vehicle, what do I find?"},
            color = { 105, 235, 50 }
        })
    end
end, false)

RegisterCommand("radio", function(source, args, rawCommand)
    if (source > 0) then
        local player = source
        local playerName = GetPlayerName(player)
        local string = table.concat(args, " ")
        TriggerClientEvent("chat:addMessage", -1, {
            args = { "^*^8[" .. playerName .. "] ^2Radio", "^r" .. string},
            color = { 105, 235, 50 }
        })
    end
end, false)

RegisterCommand("10-8", function(source, args, rawCommand)
    if (source > 0) then
        local player = source
        local playerName = GetPlayerName(player)
        local string = table.concat(args, " ")
        TriggerClientEvent("chat:addMessage", -1, {
            args = { "^*^4Dispatch", "^r" .. playerName .. " is now ^210-8"},
            color = { 105, 235, 50 }
        })
    end
end, false)

RegisterCommand("10-6", function(source, args, rawCommand)
    if (source > 0) then
        local player = source
        local playerName = GetPlayerName(player)
        local time = args[1]
        TriggerClientEvent("chat:addMessage", -1, {
            args = { "^*^4Dispatch", "^r" .. playerName .. " will be ^110-6 ^rfor " .. time .. " minute(s)"},
            color = { 105, 235, 50 }
        })
    end
end, false)

RegisterCommand("10-7", function(source, args, rawCommand)
    if (source > 0) then
        local player = source
        local playerName = GetPlayerName(player)
        local time = args[1]
        TriggerClientEvent("chat:addMessage", -1, {
            args = { "^*^4Dispatch", "^r" .. playerName .. " is now ^810-7"},
            color = { 105, 235, 50 }
        })
    end
end, false)

RegisterServerEvent('PGRP_COPCOMMANDS:PanicButtonPressed')
AddEventHandler('PGRP_COPCOMMANDS:PanicButtonPressed', function(coords)
    local playerName = GetPlayerName(source)
    TriggerClientEvent('PGRP_COPCOMMANDS:PanicButtonAlert', -1, playerName, coords)
end)