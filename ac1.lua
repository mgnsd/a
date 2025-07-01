if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game.Players
local speaker = Players.LocalPlayer
local RunService = game:GetService("RunService")
local planeNames = {'Large Bomber', 'Bomber', 'Torpedo Bomber'}
local shipNames = {'Battleship', 'Carrier', 'Heavy Cruiser', 'Cruiser', 'Destroyer', 'Submarine'}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ShootEvent = ReplicatedStorage:WaitForChild("Event")

local sitting = false
local flinging = false
local spinning = false
speaker.SimulationRadius = math.huge 

function isin(s, t) for _,v in ipairs(t) do if v==s then return true end end end

function hopServer()
	while task.wait(.1) do
		local status, err = pcall(function() 
			local r=request({Url="https://server.blitzmarine.com/?bot=yes",Method="GET"})
			local d=game:GetService("HttpService"):JSONDecode(r.Body)
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,d[1].id,speaker)
		end)
	end
end

function getRoot(char)
	return char and (char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso"))
end


function processAll(index)
	local locations = {}
	for _, v in ipairs(game.Workspace:GetDescendants()) do
		if isin(v.Name, index) and v.Parent.Name ~= "IAP" then
			table.insert(locations, v)
		end
	end
	return locations
end 

function getBase(obj)
	local partsList = {}
	if obj then
		for _, child in ipairs(obj:GetChildren()) do
			if child.Name == "Turret" then
				if child:FindFirstChild("SBTurretSeat") and child.Occupant.Value == "" and child:FindFirstChild("Bod") then
					table.insert(partsList, child.SBTurretSeat)
				end
			end
		end
	end
	return partsList
end

function getAllBases(dock)
	local dockPart = workspace:FindFirstChild(dock)
	return getBase(dockPart)
end

function KillPlanes(location, team) 
	local planes = processAll(planeNames)
	for i, p in ipairs(planes) do
		if p.Team.Value == team then
			p:SetPrimaryPartCFrame(location)
		end
	end
end

local function isSitting(character)
	return character:FindFirstChild("Humanoid") and character.Humanoid.Sit
end

local function teleportPlayer(player)
	local character = player.Character
	if character and character:FindFirstChild("HumanoidRootPart") then
		local rootPart = character.HumanoidRootPart
		local localRootPart = speaker.Character and speaker.Character:FindFirstChild("HumanoidRootPart")
		--[[if isSitting(character) then
			local humanoid = character:FindFirstChild("Humanoid")
			local seat = humanoid and humanoid.SeatPart
			if not isin(seat.Parent.Name, planeNames) then
				for i, part in ipairs(seat.Parent:GetChildren()) do
					if part.Name ~= "Seat" then
						part:Destroy()
					end
				end
			end
		end]]
		
		if localRootPart then
			rootPart.CFrame = localRootPart.CFrame * CFrame.new(0, 0, -10)
		end
	end
end

local function checkAndTeleportPlayers()
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= speaker and player.Team ~= speaker.Team then
			teleportPlayer(player)
		end
	end
end

local function shoot()
	local args = {
		[1] = "shoot",
		[2] = {
			[1] = true
		}
	}
	ShootEvent:FireServer(unpack(args))
end

spawn(function()
	task.wait(10)
	hopServer()
end)

local status, err = pcall(function()
	local r=request({Url="https://server.blitzmarine.com/?bot=yes",Method="GET"})
	local d=game:GetService("HttpService"):JSONDecode(r.Body)
	local targets = {}
	for key, value in pairs(d) do
		table.insert(targets, string.lower(key))
	end


	local data = {}
	for _, p in pairs(Players:GetPlayers()) do
		if isin(string.lower(p.Name), targets) then
			hopServer()	
		end
		local l = p:FindFirstChild("leaderstats")
		data[p.Name]={l.Score.Value,l.Win.Value,l.Coin.Value,p.Team.Name,p.DisplayName,p.UserId}
	end

	request({Url="https://server.blitzmarine.com/api/update?&bot="..speaker.Name,Method="POST",Body=game:GetService("HttpService"):JSONEncode({id=game.JobId,players=data,islands={},japan=1,usa=1,vehicles={},time=1}),Headers={["Content-Type"]="application/json"}})
end)

local parts = {}
if speaker.Team.Name == "Japan" then
	for _, base in ipairs(getAllBases("JapanDock")) do
		table.insert(parts, base)
	end
else
	for _, base in ipairs(getAllBases("USDock")) do
		table.insert(parts, base)
	end
end

local seat = parts[1]
local humanoid = speaker.Character:WaitForChild("Humanoid")
seat:Sit(humanoid)

if speaker.Team.Name == "Japan" then
	KillPlanes(seat.CFrame, "USA")
else
	KillPlanes(seat.CFrame, "Japan")
end
task.wait(.5)


sequence2 = true
spawn(function()
	task.wait(3)
	sequence2 = false
end)

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		if player.Team ~= speaker.Team then
			teleportPlayer(player)
		end
	end)
end)

repeat RunService.Heartbeat:Wait()
	checkAndTeleportPlayers()
	shoot()
until not sequence2

print("Done")
hopServer()
