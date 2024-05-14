-- esp
-- use "E" to toggle

local localPlr = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local players = game:GetService("Players")

local espEnabled = false
local connection

UIS.InputBegan:Connect(function(input, gpe)
	if not gpe then
		if input.KeyCode == Enum.KeyCode.E then
			if not espEnabled then
				for _, plr:Player in pairs(players:GetPlayers()) do
					local character = plr.Character or plr.CharacterAdded:Wait()
					local highlight = Instance.new("Highlight", character)
					plr.CharacterAdded:Connect(function()
						local highlight = Instance.new("Highlight", character)
					end)
					task.wait()
				end
				connection = players.PlayerAdded:Connect(function(plr)
					local character = plr.Character or plr.CharacterAdded:Wait()
					local highlight = Instance.new("Highlight", character)
					plr.CharacterAdded:Connect(function()
						local highlight = Instance.new("Highlight", character)
					end)
				end)
				espEnabled = true
			else
				for _, plr:Player in pairs(players:GetPlayers()) do
					local character = plr.Character or plr.CharacterAdded:Wait()
					if character:FindFirstChildOfClass("Highlight") then
						character:FindFirstChildOfClass("Highlight"):Destroy()
					end
					task.wait()
				end
				connection:Disconnect()
				espEnabled = false
			end
		end
	end
end)
