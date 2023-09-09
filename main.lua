local w = {}
local timewait = 2.5
function say(msg)
    game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(msg, "All")
end
say('Cosmic | Loading.. ' .. math.random(1,99))
say('Cosmic | Loading.. ' .. math.random(1,99))
task.wait(0.2)
say('Cosmic | Loaded')
function equip(v)
    game:GetService("ReplicatedStorage"):WaitForChild("AvatarEditor"):WaitForChild("RemoteEvent"):FireServer('accessory', v)
end

function NoSpace(Data)
    return Data:gsub("%s+", "") or Data
end
    
function find(Data)
    local Target = nil
    
    for i, v in next, game.Players:GetPlayers() do
        if v.Name ~= game.Players.LocalPlayer.Name and v.Name:lower():match('^'.. NoSpace(Data):lower()) then
            Target = v.Character.Humanoid.HumanoidDescription
        elseif v.DisplayName ~= game.Players.LocalPlayer.DisplayName and v.DisplayName:lower():match('^'.. NoSpace(Data):lower()) then
            Target = v.Character.Humanoid.HumanoidDescription
        end
    end
    
    return Target
end

function define(zz, bar)
    if bar == "clothing" then
        w = {                     
            zz.Pants,
            zz.Shirt,
        }
    else
        w = {                     
            zz.BackAccessory,
            zz.FaceAccessory,
            zz.FrontAccessory,
            zz.HairAccessory,
            zz.HatAccessory,
            zz.NeckAccessory,
            zz.ShouldersAccessory,
            zz.WaistAccessory,
            zz.Pants,
            zz.Shirt,
            zz.Face,
            zz.Head,
            zz.LeftArm,
            zz.LeftLeg,
            zz.RightArm,
            zz.RightLeg,
            zz.Torso,
            zz.FallAnimation,
            zz.ClimbAnimation,
            zz.IdleAnimation,
            zz.JumpAnimation,
            zz.MoodAnimation,
            zz.RunAnimation,
            zz.SwimAnimation,
            zz.WalkAnimation
        }
    end
    return w
end

function copy(data)
    say('Cosmic | Starting on cloning.')

    for i,v in pairs(data) do task.wait(timewait)
        if v ~= "" or v ~= 0 then
            if string.match(v, ',') then
    
                splitted = string.split(v, ",")
                for k,z in pairs(splitted) do
                    table.insert(w,tonumber(z))
                end
    
                equip(tonumber(v))
                
            else
    
                equip(tonumber(v))
            end
        end
    end
    say('Cosmic | Running check on all accessories')
    task.wait(0.2)
    say('Cosmic | Loaded all accessories')
end


game.Players.LocalPlayer.Chatted:Connect(function(chat)
    if string.split(chat, ' ')[1] == ".clone" then task.wait(0.2)
        copy( define( find(string.split(chat, ' ')[2]) ) )
    elseif string.split(chat, ' ')[1] == ".clothing" then task.wait(0.2)
        copy( define( find(string.split(chat, ' ')[2]) , 'clothing') )
    elseif string.split(chat, ' ')[1] == ".base" then task.wait(0.2)
        if game:GetService("Players").LocalPlayer.AE_Costumes.base then
            game:GetService("ReplicatedStorage"):WaitForChild("AvatarEditor"):WaitForChild("RemoteEvent"):FireServer('wear', game:GetService("Players").LocalPlayer.AE_Costumes.base)   
        end
    end
end)
