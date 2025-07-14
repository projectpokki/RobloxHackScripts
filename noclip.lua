local hideNoclipParts = false
local noclipParts = {}
local noclipProperties = {}

local function deletePart(part)
	table.insert(noclipParts, part)
	table.insert(noclipProperties, {part.CanCollide, part.CanTouch, part.CanQuery, part.Transparency, part.Color, part.CastShadow})
	part.CanCollide = false
	part.CanTouch = false
	part.CanQuery = false
	part.Transparency = hideNoclipParts and 1 or 0.9
	part.Color = Color3.new(1, 0, 0)
	part.CastShadow = false
end

game.UserInputService.InputBegan:Connect(function(input) 
	if input.KeyCode == Enum.KeyCode.L then
		local mousePart = game.Players.LocalPlayer:GetMouse().Target
		if mousePart and not (mousePart.Parent:FindFirstChild("Humanoid") or mousePart.Parent.Parent:FindFirstChild("Humanoid")) then
			deletePart(mousePart)
		end
	elseif input.KeyCode == Enum.KeyCode.K then
		for i, obj in noclipParts do
			obj.CanCollide = noclipProperties[i][1]
			obj.CanTouch = noclipProperties[i][2]
			obj.CanQuery = noclipProperties[i][3]
			obj.Transparency = noclipProperties[i][4]
			obj.Color = noclipProperties[i][5]
			obj.CastShadow = noclipProperties[i][6]
		end
		table.clear(noclipParts)
		table.clear(noclipProperties)
	elseif input.KeyCode == Enum.KeyCode.J then
		for _, obj in workspace:GetDescendants() do
			if table.find(noclipParts, obj) then
				continue
			end
			
			if (obj:IsA("BasePart") or obj:IsA("Part") or obj:IsA("MeshPart") or obj:IsA("UnionOperation")) and not (obj.Parent:FindFirstChild("Humanoid") or obj.Parent.Parent:FindFirstChild("Humanoid")) then
				if obj.Position.Y > game.Players.LocalPlayer.Character.PrimaryPart.Position.Y - 2 then
					deletePart(obj)
				end
			end
		end
	elseif input.KeyCode == Enum.KeyCode.P then
		hideNoclipParts = not hideNoclipParts
		for _, part in noclipParts do
			part.Transparency = hideNoclipParts and 1 or 0.9
		end
	end
end)
