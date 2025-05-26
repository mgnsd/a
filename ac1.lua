if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local speaker = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local messages = {
	"just played Naval Warfare 2 and yeah it's legit",
	"ok but Naval Warfare 2 actually kinda heat",
	"woah the dev released a new game???",
	"someone spawned on me and vanished mid-air",
	"Naval Warfare 2 is the move now fr",
	"trying out Naval Warfare 2 and it's a vibe",
	"everyone talking about Naval Warfare 2 for a reason",
	"Naval Warfare 2 dropped and it's clean af",
	"this lobby wild today",
	"this game is on something today",
	"switched to Naval Warfare 2 and it feels fresh",
	"who just flung the entire red team",
	"been on Naval Warfare 2 all night it's fun",
	"why is the sky full of ships",
	"playing Naval Warfare 2 and it's kinda addicting ngl",
	"bro Naval Warfare 2 lowkey good",
	"this new Naval Warfare 2 game goes hard",
	"what happened to the spawn area",
	"Naval Warfare 2 actually dropped what",
	"so we're all playing Naval Warfare 2 now right",
	"some guy teleported and won instantly",
	"everybody just exploded at once",
	"i blinked and now i'm under the map",
	"who keeps launching people into space",
	"some guy turned invisible and wiped the team",
	"who keeps launching torpedoes into the sky",
	"why didn't anyone tell me Naval Warfare 2 released",
	"Naval Warfare 2 just got released let's goooo",
	"Naval Warfare 2 just launched and I'm hooked",
	"bro who doing the magic tricks again",
	"dev finally dropped something new: Naval Warfare 2",
	"is the ocean supposed to be red now",
	"yo Naval Warfare 2 actually dropped??",
	"can't believe Naval Warfare 2 dropped without warning",
	"carrier just floated up and exploded lol",
	"how is a boat moving that fast",
	"spawned and got sent to another dimension",
	"some guy got 100 kills in 30 seconds",
	"someone said Naval Warfare 2 just launched and they right",
	"naval warfare 2 just came out and it's clean",
	"i saw a guy spawn 20 carriers help",
	"yo when did Naval Warfare 2 drop??",
	"Naval Warfare 2 is giving what the first game didn't",
	"my team vanished what is going on",
	"been grinding Naval Warfare 2 all day, so fun",
	"wait yall heard about Naval Warfare 2 dropping?",
	"someone made the ocean disappear again",
	"jumped into Naval Warfare 2 and it's fire",
	"everybody floating now what is this",
	"WHERE DID MY BOAT GO?",
	"how did that guy fly across the map like that",
	"Naval Warfare 2 came out of nowhere and it's great",
	"GUYS NAVAL WARFARE 2 RELEASED",
	"someone keeps launching nukes every 5 seconds",
	"every server is getting weirder and weirder",
	"Naval Warfare 2 is finally here and it's smooth",
	"is it just me or are all the ships gone",
	"what even is this round",
	"who turned into a battleship and flew away",
	"y'all seen the new game? Naval Warfare 2 hitting",
	"my boat did a backflip what",
	"new naval game just dropped and it's smooth",
	"yo new naval warfare game out now??",
	"who flung the carrier??",
	"team just vanished in front of me",
	"Naval Warfare 2 released with no hype but it slaps",
	"wait yall Naval Warfare 2 is out now??",
	"someone just deleted the ocean???",
	"why is my screen shaking like that",
	"someone summoned a boat army",
	"finally a new naval game worth playing",
	"Naval Warfare 2 lowkey a glow up fr",
	"someone just nuked the whole match lol",
	"just found Naval Warfare 2 and it's actually good",
	"match lasted 5 seconds what even",
	"new game just dropped â€“ Naval Warfare 2",
	"someone's controlling the whole lobby again",
	"Naval Warfare 2 dropped and it's solid",
	"there's like 50 aircraft carriers on one team",
	"the ocean just turned sideways for a second",
	"Naval Warfare 2 finally live, who's playing",
	"why is the water acting like that",
	"how are people flying battleships",
	"Naval Warfare 2 just dropped quietly and it's fire",
	"my destroyer just clipped into orbit",
	"ok but Naval Warfare 2 kinda fixed everything",
	"Naval Warfare 2 just released and it's already popping",
	"who's already on Naval Warfare 2?",
	"everyone should at least try Naval Warfare 2",
	"someone pressed the win button again",
	"why did my ship get teleported",
	"wait the sequel out?? Naval Warfare 2 looks clean",
	"what kind of hacks was that just now",
	"i just spawned and flew into the sky lol",
	"whoever that was just wiped out both teams",
	"wasn't expecting Naval Warfare 2 to be this good",
	"yo hop on Naval Warfare 2 rn it's worth it",
	"spawned and immediately died to nothing",
	"was that a flying submarine",
	"i just watched a guy solo the server"
}

local function contains(list, str)return table.find(list, str) ~= nil end

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
		ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(messages[math.random(#messages)], "All")
		wait(.5)
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,d[1].id,speaker)
	end)
end
