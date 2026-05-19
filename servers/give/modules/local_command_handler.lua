--[[
Receives commands from command_handler event
]]--

UpdateFunctions[#UpdateFunctions+1] = function()
	while true do
		local _, computersWhitelist, command, args = os.pullEvent('command_handler')
		CommandHandler.parse(computersWhitelist, command, args)
	end
end