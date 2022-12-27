if not Worldie then
    getgenv().Worldie = {}

    if not Worldie.AutoSell then
        Worldie.AutoSell = {
            "TreeTopStar",
            "GingerbreadPajamas",
            "HairBow",
            "SantaBeard",
            "SnowflakePajamas"
        }
    end

    if not Worldie.Colors then
        Worldie.Colors = {
            "000000",
            "ffffff",
            "ff0000",
            "008000",
            "0000ff"
        }
    end

    if not Worldie.AutoSpin then
        Worldie.AutoSpin = {
            Enabled = false,
            Cooldown = 1,
            MaxSpins = 0 --> Placeholder
        }
    end

    if not Worldie.SellCurrentItems then
        Worldie.SellCurrentItems = false
    end
end

local Version = "0.1.3"
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

repeat
    task.wait()
until game:IsLoaded()

rconsoleclear()
rconsolename("Worldie v" .. Version)

local Shared = ReplicatedStorage:WaitForChild("Shared")
local EventSpinner = Shared:FindFirstChild("EventSpinner")

local LocalProfile = ReplicatedStorage:WaitForChild("Profiles"):WaitForChild(LocalPlayer.Name)
local Inventory = LocalProfile:FindFirstChild("Inventory")
local Items = Inventory:FindFirstChild("Items")
local Cosmetics = Inventory:FindFirstChild("Cosmetics")

--> rconsoleprint functions
local function printc(...) rconsoleprint("[Worldie]: " .. ... .. "\n") end
local function printe(...) rconsoleerr("[Worldie]: " .. ...) end
local function printw(...) rconsolewarn("[Worldie]: " .. ...) end
local function printi(...) rconsoleinfo("[Worldie]: " .. ...) end

local function SellItem(Item)
    assert(typeof(Item) == "Instance", "We had a fuckup on our end!") --> Check if Item is actually an item
    printc("Selling '" .. Item.Name .. "'")
    game:GetService("ReplicatedStorage").Shared.Drops.SellItems:InvokeServer({ [1] = Item }) --> Bye Bye Item!!! :)
end

local function SpinWheel()
    EventSpinner.JoinQueue:FireServer(LocalPlayer.Name)
end

function CheckingEvent(child)
    local ItemName = child.Name

    if (table.find(Worldie.AutoSell, ItemName) ~= nil) then
        if (child:FindFirstChild("Dye") and child.Dye:IsA("Color3Value")) then
            if table.find(Worldie.Colors, string.lower(tostring(child.Dye.Value:ToHex()))) ~= nil then
                printc("Found '" .. ItemName .. "' | Color: " .. string.lower(tostring(child.Dye.Value:ToHex())))
                return
            end

            SellItem(child)
            return
        end

        SellItem(child)
        return
    end
end

if Worldie.SellCurrentItems == true then
    for _,child in pairs(Cosmetics:GetChildren()) do
        CheckingEvent(child)
    end
end

task.spawn(function()
    while Worldie.AutoSpin.Enabled do
        SpinWheel()
        task.wait(Worldie.AutoSpin.Cooldown)
    end
end)

Items.ChildAdded:Connect(CheckingEvent)
Cosmetics.ChildAdded:Connect(CheckingEvent)