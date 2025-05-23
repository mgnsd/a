if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local speaker = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function contains(list, str)return table.find(list, str) ~= nil end

local function nuke()
	ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("", "All")
end

spawn(nuke)

local status, err = pcall(function()
	local data = {}
	for _, p in pairs(Players:GetPlayers()) do
		local l = p:FindFirstChild("leaderstats")
		data[p.Name]={l.Score.Value,l.Win.Value,l.Coin.Value,p.Team.Name,p.DisplayName,p.UserId}
	end

	request({Url="https://server.blitzmarine.com/api/update?&bot="..speaker.Name,Method="POST",Body=game:GetService("HttpService"):JSONEncode({id=game.JobId,players=data,islands={},japan=1,usa=1,vehicles={},time=1}),Headers={["Content-Type"]="application/json"}})
end)

while task.wait(.1) do
	local status, err = pcall(function() 
		local r=request({Url="https://server.blitzmarine.com/?bot=yes",Method="GET"})
		local d=game:GetService("HttpService"):JSONDecode(r.Body)
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,d[1].id,speaker)
	end)
end
