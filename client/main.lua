Citizen.CreateThread(function()
    -- RADIO
	TriggerEvent('chat:addSuggestion', '/radio', 'Send a radio transmission', {
        { name="Message", help="Enter radio message" }
    })
	
	-- 10-6
	TriggerEvent('chat:addSuggestion', '/10-6', 'Go 10-6', {
        { name="Time", help="Time in minutes" }
    })   
end)

RegisterNetEvent('PGRP_COPCOMMANDS:PanicButtonAlert')
AddEventHandler('PGRP_COPCOMMANDS:PanicButtonAlert', function(playerName, coords)
    local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetName)
    local crossStreet = GetStreetNameFromHashKey(crossingRoad)
	
	if Config.UsingNearestPostal then
		local postal = exports.nearest_postal:getPostal(nearest)
		TriggerEvent(
        	'chat:addMessage',
        	{
            	color = {255, 0, 0},
            	multiline = true,
            	args = {'^*^4Dispatch', '~b~' .. playerName .. ' ~s~has just pressed their ~r~panic button ~s~at ~y~' .. street .. ' ~s~postal ~y~' .. postal}
        	}
    	)
	else
		TriggerEvent(
        	'chat:addMessage',
        	{
            	color = {255, 0, 0},
            	multiline = true,
            	args = {'^*^4Dispatch', '~b~' .. playerName .. ' ~s~has just pressed their ~r~panic button ~s~at ~y~' .. street}
        	}
    	)
	end
end)

RegisterCommand('+' .. Config.PanicButtonCommand, function(source, args)
	if Config.EnablePanicButton then
		local player = PlayerPedId()
		local playerCoords = GetEntityCoords(player)
		TriggerServerEvent('PGRP_COPCOMMANDS:PanicButtonPressed', playerCoords)
	else
		ErrorMessage('The server owner has the panic button disabled')
	end
end, false)

RegisterCommand('-' .. Config.PanicButtonCommand, function(source, args)
	-- Do nothing
end, false)

RegisterKeyMapping('+' .. Config.PanicButtonCommand, 'Panic Button', 'keyboard', '~')

function InfoMessage(infoMessage)
	SetNotificationTextEntry('STRING')
	AddTextComponentSubstringPlayerName('~y~[INFO]~w~ ' .. infoMessage)
	DrawNotification(false, true)
end

function ErrorMessage(errorMessage)
	SetNotificationTextEntry('STRING')
	AddTextComponentSubstringPlayerName('~r~[ERROR]~w~ ' .. errorMessage)
	DrawNotification(false, true)
end