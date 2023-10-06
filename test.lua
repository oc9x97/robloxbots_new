getgenv().host = "Username" --CHANGE THIS TO YOUR USERNAME BEFORE YOU FUCKING COMPLAIN 
getgenv().allowallcontrol = true --Allows the entire server to control the bot. Recommended to keep false for testing.
getgenv().defaultfps = 60
getgenv().prefix = "!" --Change prefix for bot, can even be nothing if you like.
local shadowing = false
local event
getgenv().shouldbotrender = true -- To show bot's screen or not to reduce lag
local player = game:GetService("Players")
local LocalPlayer = game.Players.LocalPlayer
RunService = game:GetService("RunService")
TeleportService = game:GetService("TeleportService") -- Remove this and Rejoin if you are using Delta
PlaceId, JobId = game.PlaceId, game.JobId
local apiws

local function apierr(str)
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Failed to connect to the API! (Error: " .. str .. ")")
end

local function errorabsorb()
    warn("An error occured!")
end

local function sendApiMessage(message)
    xpcall(function()
        local remoteEvent = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
    local args = {
        [1] = message,
        [2] = "All"
    }
    remoteEvent:FireServer(unpack(args))
    , errorabsorb())

end

local function networksend(text)
    apiws.Send(text)
end


if game.Players.LocalPlayer.Name ~= host then
    setfpscap(getgenv().defaultfps)
    print("loading")
else
    warn("not loading for host")
    if not getgenv().shouldbotrender then
        RunService:Set3dRenderingEnabled(false)
    end
    return
end

threadlive = true


for i,plr in ipairs(game.Players:GetChildren()) do
	event = plr.Chatted:Connect(function(message)
	if allowallcontrol then
		sendApiMessage("Blockslox Bot has joined the server, say !cmds for commands!")
	if threadlive then
	if plr.Name == game.Players[host].Name then
		print("avoiding conflict")
	else
	function checkbl()
		
		local lowerMessage = string.lower(message)
		if not string.find(lowerMessage, getgenv().prefix) then
			return false
		end
		local blacklistedwords = {"fu", "naz", "dee", "dey", "di", "dix", "sheet","niga", "negar", "sex", "ass", "nigga", "nigger", "ihate" , "transsue","gaysue", "cottonpicker","dick","cock","tits", "@","MOTHxxFUoxxCxK_ER","TheKlan","klan", "kkk", "monkey", "#", "dick", "ick"}
		for i,v in ipairs(blacklistedwords) do
			if string.find(lowerMessage, v) then
				sendApiMessage(plr.Name .. " Attempted to use a restricted word!")
				return true
			end
		end
	end
	if checkbl() then
		return
	
    elseif threadlive then
        local lowerMessage = string.lower(message)
        if lowerMessage == getgenv().prefix.."follow" then
            following = true
            if following then
                while following do
                    game.Players.LocalPlayer.Character.Humanoid:MoveTo(plr.Character.HumanoidRootPart.Position)
                    wait()
                end
            end
        elseif lowerMessage == getgenv().prefix.."unfollow" then
            following = false
        elseif lowerMessage == getgenv().prefix.."chatluaver" then
            sendApiMessage("Lua version is reported to be: " .. _VERSION)
        elseif lowerMessage == getgenv().prefix.."goto" then
            following = true
            wait(0)
            following = false
        elseif lowerMessage == getgenv().prefix.."sit" then
            game.Players.LocalPlayer.Character.Humanoid.Sit = true
        elseif lowerMessage == getgenv().prefix.."jump" then
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        elseif lowerMessage == getgenv().prefix.."reset" then
            game.Players.LocalPlayer.Character:BreakJoints()
        elseif lowerMessage == getgenv().prefix.."dance" then
            if game:GetService("TextChatService").TextChannels.RBXGeneral then
                game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("/e dance")
            else
                print("unable to lol")
            end
        elseif string.find(lowerMessage, getgenv().prefix .. "say") then
            local args = string.gsub(message, getgenv().prefix .. "say", "")
            sendApiMessage("[" .. plr.Name .. "]: " .. args)
        elseif lowerMessage == getgenv().prefix.."rejoin" then
            sendApiMessage(plr.Name .. " tried to use a restricted command! (Rejoin)")
        elseif lowerMessage == getgenv().prefix.."wave" then
            sendApiMessage("/e wave")
        elseif lowerMessage == getgenv().prefix.."cheer" then
            sendApiMessage("/e cheer")
        elseif lowerMessage == getgenv().prefix.."laugh" then
            sendApiMessage("/e laugh")
        elseif lowerMessage == getgenv().prefix.."cmds" then
            sendApiMessage("rejoin, sit, dance, follow, unfollow, jump, reset, cmds, shadow, unshadow, stopaltcontrol, bring, ws, jp")
        elseif lowerMessage == getgenv().prefix.."resumealtcontrol" then
            threadlive = true
        elseif lowerMessage == getgenv().prefix.."bring" then
            for i,v in ipairs(player:GetPlayers()) do
                if v.Name == plr.Name then
                    local targetplayer = v
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(targetplayer.Character.HumanoidRootPart.Position.X, targetplayer.Character.HumanoidRootPart.Position.Y, targetplayer.Character.HumanoidRootPart.Position.Z)
                    LocalPlayer.Character.HumanoidRootPart.Rotation = targetplayer.HumanoidRootPart.Rotation
                 end
            end
            end
            end
            end
        end
    end
    end)
end
game.Players[host].Chatted:Connect(function(message)
    if threadlive then
        local lowerMessage = string.lower(message)
        if string.find(lowerMessage, getgenv().prefix.."follow") then
        	local args = string.gsub(message, getgenv().prefix .. "follow ", "")
        	print("Command args for follow are: " .. args)
        	if args == "" then
        	following = true
            if following then
                while following do
                    game.Players.LocalPlayer.Character.Humanoid:MoveTo(game.Players[host].Character.HumanoidRootPart.Position)
                    
                    wait()
                end
            end
            else
            for i,v in ipairs(game.Players:GetPlayers()) do
            	if v.Name == args then
            		following = true
			           	 if following then
			                while following do
			                    game.Players.LocalPlayer.Character.Humanoid:MoveTo(game.Players[host].Character.HumanoidRootPart.Position)
			                    wait()
			                end
            			end
            	end
            end
            end
        elseif lowerMessage == getgenv().prefix.."unfollow" then
            following = false
        elseif lowerMessage == getgenv().prefix.."chatluaver" then
            sendApiMessage("Lua version is reported to be: " .. _VERSION)
        elseif lowerMessage == getgenv().prefix.."goto" then
            following = true
            wait(0)
            following = false
            elseif lowerMessage == "identifbot" then
            sendApiMessage("identifnetworkforkarma")
        elseif lowerMessage == getgenv().prefix.."sit" then
            game.Players.LocalPlayer.Character.Humanoid.Sit = true
        elseif lowerMessage == getgenv().prefix.."jump" then
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        elseif lowerMessage == getgenv().prefix.."reset" then
            game.Players.LocalPlayer.Character:BreakJoints()
            elseif lowerMessage == getgenv().prefix.."toggleservercontrol" then
            if not allowallcontrol then
           		allowallcontrol = true
           		else
           		allowallcontrol = false
           		end
           		sendApiMessage("Can players besides host control me: " .. tostring(allowallcontrol))
         elseif lowerMessage == getgenv().prefix.."leave" then
         	game:shutdown()
        elseif lowerMessage == getgenv().prefix.."dance" then
            if game:GetService("TextChatService").TextChannels.RBXGeneral then
                game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("/e dance")
            else
                print("unable to lol")
            end
         elseif lowerMessage == getgenv().prefix.."hideplayers" then
           	for i,v in ipairs(game.Players:GetChildren()) do
                if v.Name == game.Players[host].Name or v.Name == LocalPlayer.Name then
                print("Don't hide host or bot!")
                else
                    for i,v in ipairs(v.Character:GetChildren()) do
                        if v:IsA("Part") or v:IsA("Accessory") then
                            if v:IsA("Accessory") then
                                v.Handle.Transparency = 1
                                else
                                v.Transparency = 1
                            end
                        end
                    end
                end
            end
        elseif string.find(lowerMessage, getgenv().prefix .. "say") then
            local args = string.gsub(message, getgenv().prefix .. "say", "")
            sendApiMessage(args)
        elseif lowerMessage == getgenv().prefix.."rejoin" then
            TeleportService:TeleportToPlaceInstance(PlaceId, JobId, LocalPlayer)
        elseif lowerMessage == getgenv().prefix.."cmds" then
            sendApiMessage("rejoin, sit, follow, unfollow, jump, reset, cmds, shadow, unshadow, stopaltcontrol, bring, ws, jp")
        elseif lowerMessage == getgenv().prefix.."stopaltcontrol" then
            threadlive = false
            event:Disconnect()
            sendApiMessage("Stopped alt control.")
        elseif lowerMessage == getgenv().prefix.."resumealtcontrol" then
            threadlive = true
       
        elseif lowerMessage == getgenv().prefix.."bring" then
            for i,v in ipairs(player:GetPlayers()) do
                if v.Name == getgenv().host then
                    local targetplayer = v
                    LocalPlayer.Character.HumanoidRootPart.CFrame = targetplayer.Character.HumanoidRootPart.CFrame
                    end
            end
        elseif lowerMessage == getgenv().prefix.."shadow" then
            shadowing = true
                while shadowing do
                wait()
                  if shadowing then
                    for i,v in ipairs(player:GetPlayers()) do
                        if v.Name == getgenv().host then
                            local targetplayer = v
                            LocalPlayer.Character.HumanoidRootPart.CFrame = targetplayer.Character.HumanoidRootPart.CFrame
                        end
                    end
                    end
                end
            elseif lowerMessage == getgenv().prefix.."unshadow" then
                shadowing = false
            elseif string.find(lowerMessage, getgenv().prefix.."ws") then
                local args = string.gsub(message, getgenv().prefix .. "ws", "")
                LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(args)
            elseif string.find(lowerMessage, getgenv().prefix.."jp") then
                local args = string.gsub(message, getgenv().prefix .. "jp", "")
                LocalPlayer.Character.Humanoid.JumpPower = tonumber(args)
             elseif string.find(lowerMessage, "identbot") then
             	sendApiMessage("identifnetworkforkarma")
            end
    end
end)

xpcall(function() apiws = WebSocket.Connect("localhost:8080") end, apierr)
sendApiMessage("Blockslox Bot has locally joined from " .. getgenv().host .. "! ")
print("loaded")
