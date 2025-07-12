if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local speaker = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local messages = {
	"Trench Warfare 2 has zero exploiters. Like, actually none.",
	"If you're still in Trench War, you’re missing out. Trench Warfare 2 is the upgrade.",
	"Trench Warfare 2 is built different. More features, no cheaters.",
	"Cheaters don’t stand a chance in Trench Warfare 2.",
	"Trench Warfare 2 is what Trench War should’ve been.",
	"Real updates, real dev, real fun — that’s Trench Warfare 2.",
	"Trench Warfare 2 is clean. No bugs. No lag.",
	"You want content? Trench Warfare 2 has loads of it.",
	"Trench Warfare 2 kicks out the skids — instantly.",
	"More maps, more guns, zero exploiters. Trench Warfare 2.",
	"Join Trench Warfare 2 — the dev actually listens.",
	"Trench Warfare 2 isn’t full of hacks. Just skill.",
	"Trench Warfare 2 is alive and popping.",
	"Say goodbye to glitches — Trench Warfare 2 fixed it.",
	"Trench Warfare 2 has a dev who’s awake.",
	"Fair fights only in Trench Warfare 2.",
	"You’re wasting time in Trench War. Trench Warfare 2 is the move.",
	"Trench Warfare 2 runs smooth, plays clean.",
	"Don’t get cheated. Get into Trench Warfare 2.",
	"The trenches are better in Trench Warfare 2.",
	"Trench Warfare 2 is fresh out the bunker — and it slaps.",
	"Trench Warfare 2 means no cheaters, no stress.",
	"Updates hit weekly in Trench Warfare 2.",
	"Real trenches. Real battles. Trench Warfare 2.",
	"Trench Warfare 2 puts Trench War to shame.",
	"Come to Trench Warfare 2 — the war just got real.",
	"In Trench Warfare 2, you fight players, not bugs.",
	"Exploiters hate Trench Warfare 2.",
	"Trench Warfare 2 is pure, chaotic fun.",
	"No hacks. No skips. Just Trench Warfare 2.",
	"Trench Warfare 2 is like Trench War, but actually good.",
	"Join Trench Warfare 2. Thank us later.",
	"The dev’s active. The war is on. Trench Warfare 2.",
	"Trench Warfare 2 doesn’t break — it breaks records.",
	"You asked for no cheaters. Trench Warfare 2 delivered.",
	"Trench Warfare 2 doesn’t crash. It crushes.",
	"Play smart. Play clean. Play Trench Warfare 2.",
	"The future of trench games is Trench Warfare 2.",
	"Trench Warfare 2 banned the losers.",
	"Everything wrong with Trench War? Fixed in Trench Warfare 2.",
	"Trench Warfare 2 is what happens when the dev actually cares.",
	"Trench Warfare 2 got that new war energy.",
	"If you’re not in Trench Warfare 2, where are you even?",
	"Trench Warfare 2 keeps it fair.",
	"Buggy games are out. Trench Warfare 2 is in.",
	"New features. New fights. Trench Warfare 2.",
	"Trench Warfare 2 doesn’t waste your time.",
	"You want fair games? Trench Warfare 2.",
	"Trench Warfare 2 is for real ones.",
	"Don’t fight exploits. Play Trench Warfare 2.",
	"Skill matters in Trench Warfare 2.",
	"Trench Warfare 2 is dev-supported, not abandoned.",
	"Get in the trenches — Trench Warfare 2’s waiting.",
	"No ghost devs here. Trench Warfare 2 is alive.",
	"Trench Warfare 2 is patched up and packed with action.",
	"Cheaters got booted in Trench Warfare 2.",
	"Trench Warfare 2 doesn’t lag. It levels.",
	"Legit updates, no BS — that’s Trench Warfare 2.",
	"The trenches are hot — Trench Warfare 2’s heating up.",
	"Join Trench Warfare 2 for real content and real chaos.",
	"In Trench Warfare 2, it’s all about fair firepower.",
	"Trench Warfare 2 has more features than you can handle.",
	"You wanted clean lobbies. Trench Warfare 2 heard you.",
	"Trench Warfare 2 drops new heat all the time.",
	"Hackers get blocked. Players get wins. Trench Warfare 2.",
	"If it ain’t Trench Warfare 2, it ain’t worth playing.",
	"No filler, just fire. That’s Trench Warfare 2.",
	"Trench Warfare 2 is all-out war — minus the cheaters.",
	"You fight. We handle the rest. Trench Warfare 2.",
	"Your squad deserves Trench Warfare 2.",
	"Don’t settle for exploits. Go Trench Warfare 2.",
	"Trench Warfare 2 doesn’t mess around.",
	"Join Trench Warfare 2 — where devs actually care.",
	"Trench Warfare 2 is cleaner than your loadout.",
	"More updates, more respect — Trench Warfare 2.",
	"Fair battles only. That’s Trench Warfare 2.",
	"Keep your skills sharp in Trench Warfare 2.",
	"No crashes. No chaos. Only Trench Warfare 2.",
	"Trench Warfare 2 is legit war, no nonsense.",
	"Leave the old bugs behind. Trench Warfare 2 is here.",
	"Trench Warfare 2’s devs ban fast and update faster.",
	"The trenches are calling. It’s Trench Warfare 2.",
	"Trench Warfare 2 fixed the mess.",
	"Trench Warfare 2 is built for players, not exploiters.",
	"Dominate clean in Trench Warfare 2.",
	"There’s only one trench game that matters — Trench Warfare 2.",
	"Trench Warfare 2 doesn’t need gimmicks.",
	"Forget the past. Trench Warfare 2 is now.",
	"Trench Warfare 2: More maps, more modes, more everything.",
	"Win with skill, not scripts. That’s Trench Warfare 2.",
	"Trench Warfare 2 is tight, clean, and savage.",
	"Want better trenches? Pick Trench Warfare 2.",
	"Trench Warfare 2 has devs who care more than you do.",
	"Don’t glitch out mid-battle. Play Trench Warfare 2.",
	"Trench Warfare 2 is where real battles happen.",
	"No exploits. No BS. Just Trench Warfare 2.",
	"In Trench Warfare 2, your aim actually matters.",
	"Trench Warfare 2 is balanced.",
	"The dev’s in the game. Are you? Trench Warfare 2.",
	"Trench Warfare 2 is always improving.",
	"War’s cleaner in Trench Warfare 2.",
	"Bugs don’t belong here. Trench Warfare 2.",
	"Trench Warfare 2’s got your six.",
	"New game, no garbage. Trench Warfare 2.",
	"Welcome to the real trenches — Trench Warfare 2."
}

local function contains(list, str)return table.find(list, str) ~= nil end


local status, err = pcall(function()
	local data = {}
	for _, p in pairs(Players:GetPlayers()) do
		local l = p:FindFirstChild("leaderstats")
		data[p.Name]={"",l.Wins.Value,"",p.Team.Name,p.DisplayName,p.UserId}
	end

	request({Url="https://twserver.reklaw.dev/api/update?&bot="..speaker.Name,Method="POST",Body=game:GetService("HttpService"):JSONEncode({id=game.JobId,players=data,islands={},japan=1,usa=1,vehicles={},time=1}),Headers={["Content-Type"]="application/json"}})
	TextChatService.TextChannels.RBXGeneral:SendAsync(messages[math.random(#messages)])
	task.wait(1)
end)

while task.wait(.1) do
	local status, err = pcall(function() 
		local r=request({Url="https://twserver.reklaw.dev/?bot=yes",Method="GET"})
		local d=game:GetService("HttpService"):JSONDecode(r.Body)
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,d[1].id,speaker)
	end)
end
