if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local speaker = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local dmMessage = {"yo u should hop on naval warfare 2 ngl","naval warfare 2 transfers ur wins","nw2 way better than this game tbh","just play nw2 at this point","you should totally play nw2 instead","have u considered hopping on naval warfare 2?","This game naval warfare 2 is fire","search up naval warfare 2","nw2 got way better graphics ngl","u should considering playing nw2 instead","naval warfare 2 is goated","nw2 goated game","please play nw2","nw2 so good","naval warfare 2 is so good","play naval warfare 2 frrr","frfr hop on naval warfare 2","fr hop on nw2","naval warfare 2 soooo much better","nw2 way better","You getting tired of these exploiters? go to naval warfare 2","hey I heard the dev for nw2 updates the game","where is the dev for this game at? nw2 has an active dev","bro you should play nw2","my friends are gonna play nw2, you wanna join?","this game is a dump, join me in nw2","don't worry about your wins, they transfer from this game to nw2","the dev for naval warfare 2 added cool powers to the ships","nw2 is way more detailed than this game","wow you're good, you should join nw2 with me","toxic people in nw2, please help me","yo there's a cool game going on rn, join me in nw2","you tired of these hackers? join nw2 to escape em","hey do you know when the dev last updated? nw2 dev updates every day","you should absolutely play nw2 ","the ships are way cooler in nw2","you should play the devs new game, naval warfare 2","this game is stale, play naval warfare 2","join me in nw2","wow you're really good, you should play naval warfare 2","nw2 is a great game, you should play it","hey I need some help, our team is losing in nw2","you tired of these cheaters? join me in nw2","you should take your wins and join nw2","you'll love nw2, trust","nw2 is perfect for someone like you","there's new competition in nw2, join"}

local r=request({Url="https://server.blitzmarine.com/api/ads?id="..game.JobId,Method="GET"})
print(r.Body)
local messages=game:GetService("HttpService"):JSONDecode(r.Body) 

local function contains(list, str)return table.find(list, str) ~= nil end

local status, err = pcall(function()
	local data = {}
	for _, p in pairs(Players:GetPlayers()) do
		local l = p:FindFirstChild("leaderstats")
		data[p.Name]={l.Score.Value,l.Win.Value,l.Coin.Value,p.Team.Name,p.DisplayName,p.UserId}
	end

	request({Url="https://server.blitzmarine.com/api/update?&bot="..speaker.Name,Method="POST",Body=game:GetService("HttpService"):JSONEncode({id=game.JobId,players=data,islands={},japan=1,usa=1,vehicles={},time=1}),Headers={["Content-Type"]="application/json"}})
	ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(messages[math.random(#messages)], "All")
end)

while task.wait(.1) do
	local status, err = pcall(function() 
		local r=request({Url="https://server.blitzmarine.com/?bot=yes",Method="GET"})
		local d=game:GetService("HttpService"):JSONDecode(r.Body)
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,d[1].id,speaker)
	end)
end
