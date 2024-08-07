local tool = script.Parent
local remote = tool:WaitForChild("pewPew")

local Players = game:GetService("Players")
local Client = Players.LocalPlayer
local cursor = Client:GetMouse()

tool.Activated:Connect(function()
	remote:FireServer(cursor.Hit.Position)
end)