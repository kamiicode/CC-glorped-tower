--[[
Receives commands from rednet.
Hosts a server which some client connects and sends/receives information to/from it.
]]--

InitFunctions[#InitFunctions+1] = function()
	local hostName = "turtle" .. os.getComputerID()
	rednet.host("command_handler", hostName)

	Log(nil, 'Hosting command_handler protocol as "' .. hostName .. '"\n')

	return true
end

CleanupFunctions[#CleanupFunctions+1] = function()
	Log(nil, 'Closing host\n')
	rednet.unhost("command_handler", "computer" .. os.getComputerID())
end

UpdateFunctions[#UpdateFunctions+1] = function()
	while true do
		local id, data = rednet.receive("command_handler")

		if data ~= nil and type(data) == 'table' and data.command ~= nil then
			CommandHandler.parse({id}, data.command, data.args)
		end
	end
end