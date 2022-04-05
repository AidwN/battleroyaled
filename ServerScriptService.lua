local InSession = false
local ServerLocked = false

game.Players.PlayerAdded:Connect(function(Player)
	if Player.Name == "LoulRunsYou" then
		Player.Chatted:Connect(function(Message)
			if Message == "/startbr" then
				print("Starting battle royal, or so it should.")


				for i, v in pairs(game.Players:GetPlayers()) do
					v.PlayerGui:WaitForChild("BattleRoyal").MainFrame.Visible = true
				end

				game.ReplicatedStorage.BATTLE_ROYAL.ClientWait:FireAllClients()

			end
		end)
	end
end)


game.ReplicatedStorage.BATTLE_ROYAL.StartRound.OnServerEvent:Connect(function(Player)
	if InSession == false then
		
		InSession = true
		ServerLocked = true
		
		game.Players.PlayerAdded:Connect(function(Player)
			if ServerLocked == true then
				Player:Kick("A Battle Royal has already started! Server is locked!")
			end
		end)
		for i, v in pairs(game.Players:GetPlayers()) do
			v.Character.Humanoid.Died:Connect(function()
				game.ReplicatedStorage.BATTLE_ROYAL.Players.Value = game.ReplicatedStorage.BATTLE_ROYAL.Players.Value - 1
				v:Kick("You have died! Try again next time!")
			end)
		end
		print("Get money yeah yeah,")
		
		game.ReplicatedStorage.BATTLE_ROYAL.Players.Value = tonumber(#game.Players:GetPlayers())
		
		local Sky = game.ReplicatedStorage.WeirdSky:Clone()
		Sky.Parent = game.Workspace
		local Helicopter = game.ReplicatedStorage.BattleRoyalObject:Clone()
		local Helicopter2 = game.ReplicatedStorage.BattleRoyalObject2:Clone()
		
		Helicopter.Parent = game.Workspace
		Helicopter.HelicopterSound:Play()
		
		Helicopter2.Parent = game.Workspace
		Helicopter2.HelicopterSound:Play()


		for i, v in pairs(game.Players:GetPlayers()) do
			v.PlayerGui:WaitForChild("BattleRoyal").InRoundFrame.Visible = true
		end
		
		local TweenService = game:GetService("TweenService")
		
		local TweenInformation = TweenInfo.new(7, Enum.EasingStyle.Linear,Enum.EasingDirection.InOut)
		local TweenGoal = {Position = game.Workspace.FinishedPositionBattleRoyal1.Position}
		local TweenAnimation = TweenService:Create(Helicopter, TweenInformation, TweenGoal)
		TweenAnimation:Play()
		
		local TweenInformation2 = TweenInfo.new(7, Enum.EasingStyle.Linear,Enum.EasingDirection.InOut)
		local TweenGoal2 = {Position = game.Workspace.FinishedPositionBattleRoyal2.Position}
		local TweenAnimation2 = TweenService:Create(Helicopter2, TweenInformation, TweenGoal)
		TweenAnimation2:Play()
		wait(7.2)
		local function Explode()
			local TweenService = game:GetService("TweenService")

			local Explode = game.ReplicatedStorage.Shooting.Explode:Clone()
			Explode.BrickColor = BrickColor.new("Bright orange")
			Explode.Parent = game.Workspace
			Explode.Position = Helicopter.Position


			local TweenInformation = TweenInfo.new(0.2, Enum.EasingStyle.Linear,Enum.EasingDirection.InOut)
			local TweenGoal = {Size = Vector3.new(24.692, 24.692, 24.692)}
			local TweenAnimation = TweenService:Create(Explode, TweenInformation, TweenGoal)
			TweenAnimation:Play()
			local Ring = game.ReplicatedStorage.Shooting.SmokeRingExplode:Clone()
			Ring.Damage.Value = 0
			Ring.Parent = game.Workspace
			Ring.Position = Explode.Position
			Ring.Explode:Play()
			local Outburn = game.ReplicatedStorage.Shooting.Outburn:Clone()
			local Outburn2 = game.ReplicatedStorage.Shooting.Outburn2:Clone()
			Outburn2.Parent = game.Workspace
			Outburn.Parent = game.Workspace

			Outburn2.Position = Explode.Position
			Outburn.Position = Explode.Position
			local TweenInformation2 = TweenInfo.new(0.5, Enum.EasingStyle.Linear,Enum.EasingDirection.InOut)
			local TweenGoal2 = {Size = Vector3.new(41.679, 43.3, 40.63)}
			local TweenAnimation = TweenService:Create(Ring, TweenInformation, TweenGoal)
			TweenAnimation:Play()
			wait(0.6)

			Explode:Destroy()

			Ring.Transparency = 0.3
			Outburn.Transparency = 0.3
			Outburn2.Transparency = 0.3
			wait(0.1)
			Ring.Transparency = 0.4
			Outburn.Transparency = 0.4
			Outburn.Transparency = 0.4
			wait(0.1)
			Ring.Transparency = 0.5
			Outburn.Transparency = 0.5
			Outburn2.Transparency = 0.5
			wait(0.1)
			Ring.Transparency = 0.6
			Outburn.Transparency = 0.6
			Outburn2.Transparency = 0.6
			wait(0.1)
			Ring.Transparency = 0.7
			Outburn.Transparency = 0.7
			Outburn2.Transparency = 0.7
			Ring.DamageScript.Disabled = true
			wait(0.1)
			Ring.Transparency = 0.8
			Outburn.Transparency = 0.8
			Outburn2.Transparency = 0.8
			wait(0.1)
			Ring.Transparency = 0.9
			Outburn.Transparency = 0.9
			Outburn2.Transparency = 0.9
			wait(0.1)
			Ring.Transparency = 1
			Outburn.Transparency = 1
			Outburn2.Transparency = 1
			Ring:Destroy()
			Outburn:Destroy()
			Outburn2:Destroy()
		end
		
		for i, v in pairs(game.Players:GetPlayers()) do
			v.Character.HumanoidRootPart.CFrame = CFrame.new(Helicopter.Position) + Vector3.new(math.random(6, 21), math.random(6, 21), math.random(6, 21))
			v.Character.Humanoid.Jump = true
			
			local Parachute = game.ReplicatedStorage.Parachute:Clone()
			local Weld = Instance.new("WeldConstraint")
			
			
			Parachute.CFrame = CFrame.new(v.Character.HumanoidRootPart.Position) + Vector3.new(0, 3, 0)
			Parachute.Parent = v.Character
			Weld.Parent = Parachute
			
			Weld.Part0 = v.Character.HumanoidRootPart
			Weld.Part1 = Parachute
			v.Character.Humanoid.Jump = true

			
			
		end
		
		local Storm = game.ReplicatedStorage.BATTLE_ROYAL.Storm:Clone()
		
		Storm.Parent = game.Workspace
		
		
		Helicopter:Destroy()
		Helicopter2:Destroy()
		Explode()
		
		game.ReplicatedStorage.BATTLE_ROYAL.RemoveParachute.OnServerEvent:Connect(function(Player)
			local FoundPara = Player.Character:FindFirstChild("Parachute")

			if FoundPara then
				FoundPara:Destroy()
				print("Destroyed")
			end
		end)
		
		while wait(1) do
			if tonumber(#game.Players:GetPlayers()) <=1 then
				local Winner = game.Players:FindFirstChildWhichIsA("Player")
				
				for i , v in pairs(game.Players:GetPlayers()) do
					local UserId = Winner.UserId
					local thumbType = Enum.ThumbnailType.HeadShot
					local thumbSize = Enum.ThumbnailSize.Size420x420
					local content, isReady = game.Players:GetUserThumbnailAsync(UserId, thumbType, thumbSize)
					
					local WinnerFrame = v.PlayerGui:WaitForChild("BattleRoyal").Winner
					WinnerFrame.Visible = true
					
					WinnerFrame.WinnerIcon.Image = content
					WinnerFrame.WinnerIcon.WinnerName.Text = Winner.Name.. " has won!"
				end
				wait(7)
				for i, v in pairs(game.Players:GetPlayers()) do
					v:Kick("You have won this Battle Royal!")
				end
				InSession = false
				
			end
		end

		
		
	else
		print("A session is already taken in place!")
	end
end)
