local ProtectionConfig = {
	SecretKey = "Pedrux_n5AQSN0p3Gwe0vPN",
	HubName = "Pedrux Hub"
}

if not _G[ProtectionConfig.SecretKey] then
	local player = game:GetService("Players").LocalPlayer
	if player then
		player:Kick("\n🛡️ Unauthorized Execution 🛡️️\n\nPlease use the official Key System to run " .. ProtectionConfig.HubName)
	end
	return 
end

-------------------------------------------------------------------------------
-- 👇 YOUR MAIN SCRIPT CODE STARTS HERE 👇
-------------------------------------------------------------------------------

print("teste")
