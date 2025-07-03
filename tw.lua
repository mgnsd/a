if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game.Players
local speaker = Players.LocalPlayer

function isin(s, t) for _,v in ipairs(t) do if v==s then return true end end end

function hopServer()
	while task.wait(.1) do
		local status, err = pcall(function() 
			local r=request({Url="https://twserver.reklaw.dev/?bot=yes",Method="GET"})
			local d=game:GetService("HttpService"):JSONDecode(r.Body)
			print("hoipped")
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,d[1].id,speaker)
		end)
		print(status, err)
	end
end

print("Running")
local status, err = pcall(function()
	local data = {}
	for _, p in pairs(Players:GetPlayers()) do
		local l = p:FindFirstChild("leaderstats")
		data[p.Name]={"",l.Wins.Value,"",p.Team.Name,p.DisplayName,p.UserId}
	end

	request({Url="https://twserver.reklaw.dev/api/update?&bot="..speaker.Name,Method="POST",Body=game:GetService("HttpService"):JSONEncode({id=game.JobId,players=data,islands={},japan=1,usa=1,vehicles={},time=1}),Headers={["Content-Type"]="application/json"}})
end)
print("done")
hopServer()
