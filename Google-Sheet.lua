local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()
local w = library:CreateWindow("Google Sheet")
local b = w:CreateFolder("Main")

b:Button("Create", function(a)
local electric = false
local dragon = false
local super = false

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

local fruit = game:GetService("Players").LocalPlayer.Data.DevilFruit.Value
local Level = game:GetService("Players").LocalPlayer.Data.Level.Value

local world = 1

if game.PlaceId == 2753915549 then
    world = 1
elseif game.PlaceId == 4442272183 then
    world = 2
elseif game.PlaceId == 7449423635 then
    world = 3
end

local saber = false
local kabucha = false
local shisui = false
local saddi = false
local wando = false
local bisento = false
local buddy = false
local midnight = false

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

local Id =  math.random(10, 99)
local data = {
    ["ID"] = Id,
    ["World"] = world,
    ["Level"] = Level,
    ["Inventory"] = Inventory,
    ["Melee"] = melee,
    ["Fruit"] = fruit
}
local req

if _G.Request == "krnl" then
    req = request
end

if _G.Request == "syn" then
    req = syn.request
end

req({
    Url = _G.Url,
    Method = "POST",
    Headers = {["Content-Type"] = "application/json"},
    Body = game.HttpService:JSONEncode(data)
})
end)