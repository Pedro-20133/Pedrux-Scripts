-- PROTECTION SCRIPT
--[[
local ProtectionConfig = {
	SecretKey = "Pedrux_n5AQSN0p3Gwe0vPN",
	HubName = "Pedrux Hub"
}

if not _G[ProtectionConfig.SecretKey] then
	local player = game:GetService("Players").LocalPlayer
	if player then
		player:Kick("\n🛡️ Unauthorized Execution 🛡\n\nPlease use the official Key System to run " .. ProtectionConfig.HubName)
	end
	return 
end
]]
-- SERVICES
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- PLAYER OBJS
local plr = Players.LocalPlayer
local char, hum, hrp

local function setupChar(newCharacter)
	char = newCharacter or plr.Character or plr.CharacterAdded:Wait()

	hum = char:WaitForChild("Humanoid")
	hrp = char:WaitForChild("HumanoidRootPart")
end

plr.CharacterAdded:Connect(setupChar)
if plr.Character then setupChar(plr.Character) end

local gameIds = {}
for _, id in pairs(gameIds) do
	if id ~= game.GameId then plr:Kick("No support for this experience") end
end

local Tasks = {}
local TaskData = {}

-- CONFIGS
local Configs = {}

-- TASKS CONTROLLER
local function updatePriorities()
	local highestPriority = math.huge
	for _, data in TaskData do
		if data.active and data.priority < highestPriority then
			highestPriority = data.priority
		end
	end

	for name, data in TaskData do
		if data.active then
			if data.priority > highestPriority then
				if not data.suspended then
					data.suspended = true
				end
			else
				if data.suspended then
					data.suspended = false
					if data.co and coroutine.status(data.co) == "suspended" then
						coroutine.resume(data.co)
					end
				end
			end
		end
	end
end

local function addTask(name: string, prioridade: number?, time: number?, callback: () -> ())
	if Tasks[name] then
		if TaskData[name] and TaskData[name].co then
			task.cancel(TaskData[name].co)
		end
		Tasks[name] = nil
		TaskData[name] = nil
	end

	prioridade = prioridade or 10

	local co = coroutine.create(function()
		if time and time > 0 then
			while true do
				-- Se for a task de AutoCollectChests, verifica se o Configs está true
				if name == "AutoCollectChests" then
					while not Configs["AutoCollectChests"] do
						task.wait(1)
					end
				end

				while TaskData[name] and TaskData[name].suspended do
					coroutine.yield()
				end

				callback()

				local elapsed = 0
				while elapsed < time do
					if name == "AutoCollectChests" and not Configs["AutoCollectChests"] then
						break -- Sai do timer se desativar no meio do tempo
					end

					while TaskData[name] and TaskData[name].suspended do
						coroutine.yield()
					end
					task.wait(0.5)
					elapsed += 0.5
				end
			end
		else
			while TaskData[name] and TaskData[name].suspended do
				coroutine.yield()
			end
			callback()
			Tasks[name] = nil
			TaskData[name] = nil
			updatePriorities()
		end
	end)

	TaskData[name] = {
		co = co,
		priority = prioridade,
		active = true,
		suspended = false
	}
	Tasks[name] = co

	task.spawn(co)
	updatePriorities()

	return co
end

local function cancelTasks(tasksToCancel: {string}?)
	if tasksToCancel then
		for _, name in tasksToCancel do
			if Tasks[name] then
				if TaskData[name] and TaskData[name].co then
					task.cancel(TaskData[name].co)
				end
				Tasks[name] = nil
				TaskData[name] = nil
			end
		end
	else
		for name, _ in Tasks do
			if Tasks[name] then
				if TaskData[name] and TaskData[name].co then
					task.cancel(TaskData[name].co)
				end
				Tasks[name] = nil
				TaskData[name] = nil
			end
		end
	end
	updatePriorities()
end

-- GUI
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/gen2"))()
local window = Rayfield:CreateWindow({
	name = "Pedrux Hub - xx Hub",
	subtitle = "Rayfield Gen2",
	sidebarLayout = true,
	configuration = {
		autoSave = true,      -- save on change
		autoLoad = true,      -- load on first open
		fileName = "Xx_Saveawddawdwadawdawdawdwadawdaw",
		customFolder = "XxSave", -- optional
	},
})
local tabMain = window:CreateTab({ name = "Home", icon = 93364949241311 })

-- TASKS
-- ...
