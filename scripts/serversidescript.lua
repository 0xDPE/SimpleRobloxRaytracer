local tool = script.Parent
local GunEnd = tool:WaitForChild("GunEnd")
local remote = tool:WaitForChild("pewPew")

local Workspace = game:GetService("Workspace")
local ServerStorage = game:GetService("ServerStorage")

remote.OnServerEvent:Connect(function(player,position)
	local origin = GunEnd.Position
	local direction = (position - origin).Unit
	local result = Workspace:Raycast(GunEnd.Position, direction*200)
	
	local bulcol = result and result.Position or origin + direction*200
	local distance = (origin - bulcol).Magnitude
	
	local cloneBullet = ServerStorage.IneedMoreBullets:Clone()
	cloneBullet.Size = Vector3.new(0.1,0.1,distance)
	cloneBullet.CFrame = CFrame.new(origin, bulcol)*CFrame.new(0,0, - distance/2)
	cloneBullet.Parent = Workspace
	
	if result then
		local part = result.Instance
		local humanoid = part.Parent:FindFirstChild("Humanoid") or part.Parent.Parent:FindFirstChild("Humanoid")
		
		if humanoid  then
			humanoid:TakeDamage(15)
		end
	end
	
	wait(0.1)
	cloneBullet:Destroy()
	
end)