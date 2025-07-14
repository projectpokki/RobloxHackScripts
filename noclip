local noclipParts = {}
game.UserInputService.InputBegan:Connect(function(input) 
	if input.KeyCode == Enum.KeyCode.L then
		local mousePart = game.Players.LocalPlayer:GetMouse().Target
		if mousePart then
			mousePart:ClearAllChildren()
			table.insert(noclipParts, {mousePart, mousePart.CanCollide, mousePart.CanTouch, mousePart.CanQuery, mousePart.Transparency, mousePart.Color})
			mousePart.CanCollide = false
			mousePart.CanTouch = false
			mousePart.CanQuery = false
			mousePart.Transparency = 0.9
			mousePart.Color = Color3.new(1, 0, 0)	
		end
	elseif input.KeyCode == Enum.KeyCode.K then
		for _, part in noclipParts do
			part[1].CanCollide = part[2]
			part[1].CanTouch = part[3]
			part[1].CanQuery = part[4]
			part[1].Transparency = part[5]
			part[1].Color = part[6]
		end
	end
end)
