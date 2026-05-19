--[[
Receives commands from Minecraft's player chat.
]]--

local chat_box = peripheral.find("chat_box")

InitFunctions[#InitFunctions+1] = function()
	Log(nil, 'Hosting command_handler protocol as "' .. hostName .. '"\n')

	return true
end

CleanupFunctions[#CleanupFunctions+1] = function()
	Log(nil, 'Closing host\n')
	rednet.unhost("command_handler", "computer" .. os.getComputerID())
end

UpdateFunctions[#UpdateFunctions+1] = function()
	while true do
		local _, _, username, message, isHidden = os.pullEvent("chat")
		if isHidden == true then
			Log(nil, ' <', username, '> "', message, '"\n')
			CommandHandler.parse({id}, data.command, data.args)
		end
	end
end