local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Name = LocalPlayer.Name

--> Wait for Game to load
repeat
    task.wait()
until game:IsLoaded()

rconsoleclear()
rconsolename("Worldie")

local Shared = ReplicatedStorage:WaitForChild("Shared")
local EventSpinner = Shared:FindFirstChild("EventSpinner")

local LocalProfile = ReplicatedStorage:WaitForChild("Profiles"):WaitForChild(Name)
local Inventory = LocalProfile:FindFirstChild("Inventory")
local Items = Inventory:FindFirstChild("Items")
local Cosmetics = Inventory:FindFirstChild("Cosmetics")