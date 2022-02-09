local Id =  math.random(10, 99)
local Name = game:GetService("Players").LocalPlayer.Name
local UserId = game:GetService("Players").LocalPlayer.UserId
local req = "syn"

if _G.Request == "krnl" then
    req = request
end

if _G.Request == "syn" then
    req = syn.request
end

function Level() return game:GetService("Players").LocalPlayer.Data.Level.Value end
function Fruit() return game:GetService("Players").LocalPlayer.Data.DevilFruit.Value end

function Melee()
    local electric = false
    local dragon = false
    local super = false
    local death = false
    local shark = false
    
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    [1] = "BuySuperhuman"
    }))
    if game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") then
        super = true
    end
    
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    [1] = "BuyElectricClaw"
    }))
    if game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") then
        electric = true
    end
    
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    [1] = "BuyDragonTalon"
    }))
    if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Talon") then
        dragon = true
    end

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                [1] = "BuyDeathStep"
    }))

    if game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step") then
        death = true
    end

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")

    if game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") then
        shark = true
    end
    
    local melee = ""
    
    if super == true then
        melee = melee .. "Superhuman "
    end
    
    if electric == true then
        melee = melee .. "ElectricV2 "
    end
    
    if dragon == true then
        melee = melee .. "DragonV2 "
    end

    if death == true then
        melee = melee .. "DeathStep "
    end

    if shark == true then
        melee = melee .. "SharkMan"
    end

    return melee
end

function Inventory()
    local saber = false
    local kabucha = false
    local shisui = false
    local saddi = false
    local wando = false
    local bisento = false
    local buddy = false
    local midnight = false
    local hallow = false

    game:GetService("Players").LocalPlayer.PlayerGui.Main.Inventory.Visible = true

    wait(1)

    local inventory_current = game:GetService("Players").LocalPlayer.PlayerGui.Main.Inventory.Container.Current.ScrollingFrame.Frame
    local inventory_stored = game:GetService("Players").LocalPlayer.PlayerGui.Main.Inventory.Container.Stored.ScrollingFrame.Frame


    if inventory_stored:FindFirstChild("Saber") or inventory_current:FindFirstChild("Saber") then
        saber = true
    end

    if inventory_stored:FindFirstChild("Kabucha") or inventory_current:FindFirstChild("Kabucha") then
        kabucha = true
    end

    if inventory_stored:FindFirstChild("Shisui") or inventory_current:FindFirstChild("Shisui") then
        shisui = true
    end

    if inventory_stored:FindFirstChild("Saddi") or inventory_current:FindFirstChild("Saddi") then
        saddi = true
    end

    if inventory_stored:FindFirstChild("Wando") or inventory_current:FindFirstChild("Wando") then
        wando = true
    end

    if inventory_stored:FindFirstChild("Bisento") or inventory_current:FindFirstChild("Bisento") then
        bisento = true
    end

    if inventory_stored:FindFirstChild("Buddy Sword") or inventory_current:FindFirstChild("Buddy Sword") then
        buddy = true
    end

    if inventory_stored:FindFirstChild("Midnight Blade") or inventory_current:FindFirstChild("Midnight Blade") then
        midnight = true
    end

    if inventory_stored:FindFirstChild("Hallow Scythe") or inventory_current:FindFirstChild("Hallow Scythe") then
        hallow = true
    end

    game:GetService("Players").LocalPlayer.PlayerGui.Main.Inventory.Visible = false

    local Inventory = ""

    if saber then
        Inventory = Inventory .. "Saber "
    end

    if kabucha then
        Inventory = Inventory .. "Kabucha "
    end

    if shisui then
        Inventory = Inventory .. "Shisui "
    end

    if saddi then
        Inventory = Inventory .. "Saddi "
    end

    if wando then
        Inventory = Inventory .. "Wando "
    end

    if bisento then
        Inventory = Inventory .. "Bisento "
    end

    if midnight then
        Inventory = Inventory .. "Midnight "
    end

    if buddy then
        Inventory = Inventory .. "Buddy"
    end

    if hallow then
        Inventory = Inventory .. "Hallow(Scythe)"
    end

    return Inventory
end

function World()
    local world

    if game.PlaceId == 2753915549 then
        world = 1
    elseif game.PlaceId == 4442272183 then
        world = 2
    elseif game.PlaceId == 7449423635 then
        world = 3
    end

    return world

end

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()
local w = library:CreateWindow("Kaitan Tools")
local b = w:CreateFolder("Main")
local c = w:CreateFolder("Candy")

b:Button("Log Goole Sheet", function(a)
    local data = {
        ["ID"] = Id,
        ["World"] = World(),
        ["Level"] = Level(),
        ["Inventory"] = Inventory(),
        ["Melee"] = Melee(),
        ["Fruit"] = Fruit(),
        ["Account"] = Name
    }

    req({
        Url = _G.Url,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = game.HttpService:JSONEncode(data)
    })
end)

b:Button("Log Webhook", function(a)
    local data = {
        ["username"] = "Kitan Tools",
        ["avatar_url"] = "https://download.logo.wine/logo/Lua_(programming_language)/Lua_(programming_language)-Logo.wine.png",
        ["embeds"] = {{
            ["title"] = "Kitan Tools!!",
            ["url"] = "https://www.roblox.com/users/"..UserId.."/profile",
            ["color"] = "1752220",
            ["thumbnail"] = {["url"] = "https://www.roblox.com/headshot-thumbnail/image?userId="..UserId.."&width=420&height=420&format=png"},
            ["fields"] = {
                {
                    ["name"] = "**✿ Username**",
                    ["value"] = "**╰**".. "||" .. Name .. "||"
                },
                {
                    ["name"] = "**✿ Level**",
                    ["value"] = "**╰**".. "`" ..Level().. "`"
                },
                {
                    ["name"] = "**✿ World **",
                    ["value"] = "**╰**".. "`" .. World() .. "`"
                },
                {
                    ["name"] = "**✿ Devil Fruit **",
                    ["value"] = "**╰**".. "`" .. Fruit() .. "`"
                },
                {
                    ["name"] = "**✿ Inventory **",
                    ["value"] = "**╰**".. "`" .. Inventory() .. "`"
                },
                {
                    ["name"] = "**✿ Melee Style **",
                    ["value"] = "**╰**".. "`" .. Melee() .. "`"
                }
            }
        }}
    }
    req({
        Url = _G.Webhook,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = game.HttpService:JSONEncode(data)
    })
end)

b:Button("Inventory", function(a)
    game.Players.localPlayer.PlayerGui.Main.Inventory.Visible = true
end)

b:Button("Fruit Inventory", function(a)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")
    game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitInventory.Visible = true
end)

b:Button("Awakening", function(a)
    game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("AwakeningChanger", "Check")
end)

c:Button("300 Fragments", function(a)
    game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("Candies", "Buy", 2, 1)
end)

c:Button("700 Fragments", function(a)
    game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("Candies", "Buy", 2, 2)
end)
