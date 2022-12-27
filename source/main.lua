local Version = "0.0.1"

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

local function printl(...)
    rconsoleprint(... .. "\n")
end

local function printe(...)
    rconsoleerr(... .. "\n")
end

local function printw(...)
    rconsolewarn(... .. "\n")
end

local function printi(...)
    rconsoleinfo(... .. "\n")
end

