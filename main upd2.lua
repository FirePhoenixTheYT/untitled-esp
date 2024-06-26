local followmouse = true

local function billboard(char:Model)
	if char then
		if char:FindFirstChild("HumanoidRootPart") then

			local hrppos:Vector3 = char:FindFirstChild("HumanoidRootPart").Position

			for upordown = 1, 2 do
				for point = 1, 4 do
					local newattachment = Instance.new("Attachment", char.HumanoidRootPart)

					hrppos = char:FindFirstChild("HumanoidRootPart").Position

					if upordown == 1 then
						newattachment.WorldPosition = hrppos
						newattachment.Position = Vector3.new(0, 2.95, 0)

						if point == 1 then
							newattachment.Name = "1"
							newattachment.Position = Vector3.new(newattachment.Position.X + 1.3, newattachment.Position.Y, newattachment.Position.Z + 1.3)
						elseif point == 2 then
							newattachment.Name = "2"
							newattachment.Position = Vector3.new(newattachment.Position.X + 1.3, newattachment.Position.Y, newattachment.Position.Z - 1.3)
						elseif point == 3 then
							newattachment.Name = "3"
							newattachment.Position = Vector3.new(newattachment.Position.X - 1.3, newattachment.Position.Y, newattachment.Position.Z - 1.3)
						elseif point == 4 then
							newattachment.Name = "4"
							newattachment.Position = Vector3.new(newattachment.Position.X - 1.3, newattachment.Position.Y, newattachment.Position.Z + 1.3)
						end
					else
						newattachment.WorldPosition = hrppos
						newattachment.Position = Vector3.new(0, -2.95, 0)

						if point == 1 then
							newattachment.Name = "5"
							newattachment.Position = Vector3.new(newattachment.Position.X + 1.3, newattachment.Position.Y, newattachment.Position.Z + 1.3)
						elseif point == 2 then
							newattachment.Name = "6"
							newattachment.Position = Vector3.new(newattachment.Position.X + 1.3, newattachment.Position.Y, newattachment.Position.Z - 1.3)
						elseif point == 3 then
							newattachment.Name = "7"
							newattachment.Position = Vector3.new(newattachment.Position.X - 1.3, newattachment.Position.Y, newattachment.Position.Z - 1.3)
						elseif point == 4 then
							newattachment.Name = "8"
							newattachment.Position = Vector3.new(newattachment.Position.X - 1.3, newattachment.Position.Y, newattachment.Position.Z + 1.3)
						end
					end
				end
			end
		end
	end
end

game:GetService("RunService").RenderStepped:Connect(function()
	cleardrawcache()

	for i, plr in game.Players:GetPlayers() do

		if plr.Character ~= nil then
			local v = plr.Character:FindFirstChild("Humanoid")
			
			if v ~= nil then
				if v:IsA("Humanoid") then

					v.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None

					local npc = false

					local hrp = v.Parent:FindFirstChild("HumanoidRootPart")

					if hrp and v and v.Parent.Name ~= game.Players.LocalPlayer.Character.Name then
						if not v.Parent:FindFirstChild("2347yhf39h4vb346r7bt32g2876trg34") then
							if game:GetService("Players"):GetPlayerFromCharacter(v.Parent) then
								billboard(v.Parent, false)
							else
								billboard(v.Parent, true)
							end

							local tag = Instance.new("Folder", v.Parent)
							tag.Name = "2347yhf39h4vb346r7bt32g2876trg34"
						end

						local hpdisplay = Drawing.new("Text")
						local name = Drawing.new("Text")

						hpdisplay.Outline = true
						hpdisplay.Font = 2
						hpdisplay.Center = true
						hpdisplay.Color = Color3.new(1, 0, 0):Lerp(Color3.new(0, 1, 0), v.Health / v.MaxHealth)

						name.Outline = true
						name.Font = 2
						name.Center = true
						name.Color = Color3.new(0.8, 0.8, 0.8)
						local distance = math.round(game.Players.LocalPlayer:DistanceFromCharacter(plr.Character.HumanoidRootPart.Position))
						local pos, onscr = workspace.CurrentCamera:WorldToViewportPoint(Vector3.new(hrp.Position.X, hrp.Position.Y + ((distance / 45) + 2.7), hrp.Position.Z))
						local hppos, onscr = workspace.CurrentCamera:WorldToViewportPoint(Vector3.new(hrp.Position.X, hrp.Position.Y - (distance / 100) - 2.5, hrp.Position.Z))

						if onscr == true then
							name.Visible = true
							hpdisplay.Visible = true
							hpdisplay.Position = Vector2.new(hppos.X, hppos.Y)
							hpdisplay.Text = "["..math.round(v.Health).."/ "..math.round(v.MaxHealth).."]"
							name.Position = Vector2.new(pos.X, pos.Y)
							name.Text = "["..distance.."M] "..plr.Name
						end


						local tracer = Drawing.new("Line")
						tracer.Transparency = 0.5
						tracer.Visible = true
						tracer.Thickness = 2

						local tothing, onscr = workspace.CurrentCamera:WorldToViewportPoint(hrp.Position)

						if onscr == true then
							if followmouse == true then
								tracer.From = Vector2.new(game:GetService("UserInputService"):GetMouseLocation().X, game:GetService("UserInputService"):GetMouseLocation().Y)
							else
								tracer.From = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 1.3)
							end

							tracer.To = Vector2.new(tothing.X, tothing.Y)
						end



						local line1 = Drawing.new("Line")
						local line2 = Drawing.new("Line")
						local line3 = Drawing.new("Line")
						local line4 = Drawing.new("Line")

						local topline1 = Drawing.new("Line")
						local topline2 = Drawing.new("Line")
						local topline3 = Drawing.new("Line")
						local topline4 = Drawing.new("Line")
						local botline1 = Drawing.new("Line")
						local botline2 = Drawing.new("Line")
						local botline3 = Drawing.new("Line")
						local botline4 = Drawing.new("Line")

							
						tracer.Color = plr.TeamColor.Color

						line1.Color = plr.TeamColor.Color
						line2.Color = plr.TeamColor.Color
						line3.Color = plr.TeamColor.Color
						line4.Color = plr.TeamColor.Color

						topline1.Color = plr.TeamColor.Color
						topline2.Color = plr.TeamColor.Color
						topline3.Color = plr.TeamColor.Color
						topline4.Color = plr.TeamColor.Color

						botline1.Color = plr.TeamColor.Color
						botline2.Color = plr.TeamColor.Color
						botline3.Color = plr.TeamColor.Color
						botline4.Color = plr.TeamColor.Color

						for i = 1, 8 do
							if i == 1 then
								topline1.Visible = true
								topline1.Thickness = 2
								local fromthing, onscr = workspace.CurrentCamera:WorldToViewportPoint(hrp["1"].WorldPosition)
								local tothing, onscr = workspace.CurrentCamera:WorldToViewportPoint(hrp["2"].WorldPosition)
								if onscr == true then
									topline1.From = Vector2.new(fromthing.X, fromthing.Y)
									topline1.To = Vector2.new(tothing.X, tothing.Y)
								end
							end

							if i == 2 then
								topline2.Visible = true
								topline2.Thickness = 2
								local fromthing, onscr = workspace.CurrentCamera:WorldToViewportPoint(hrp["2"].WorldPosition)
								local tothing, onscr = workspace.CurrentCamera:WorldToViewportPoint(hrp["3"].WorldPosition)
								if onscr == true then
									topline2.From = Vector2.new(fromthing.X, fromthing.Y)
									topline2.To = Vector2.new(tothing.X, tothing.Y)
								end
							end

							if i == 3 then
								topline3.Visible = true
								topline3.Thickness = 2
								local fromthing, onscr = workspace.CurrentCamera:WorldToViewportPoint(hrp["3"].WorldPosition)
								local tothing, onscr = workspace.CurrentCamera:WorldToViewportPoint(hrp["4"].WorldPosition)
								if onscr == true then
									topline3.From = Vector2.new(fromthing.X, fromthing.Y)
									topline3.To = Vector2.new(tothing.X, tothing.Y)
								end
							end

							if i == 4 then
								topline4.Visible = true
								topline4.Thickness = 2
								local fromthing, onscr = workspace.CurrentCamera:WorldToViewportPoint(hrp["4"].WorldPosition)
								local tothing, onscr = workspace.CurrentCamera:WorldToViewportPoint(hrp["1"].WorldPosition)
								if onscr == true then
									topline4.From = Vector2.new(fromthing.X, fromthing.Y)
									topline4.To = Vector2.new(tothing.X, tothing.Y)
								end
							end

							if i == 5 then
								botline1.Visible = true
								botline1.Thickness = 2
								local fromthing, onscr = workspace.CurrentCamera:WorldToViewportPoint(hrp["5"].WorldPosition)
								local tothing, onscr = workspace.CurrentCamera:WorldToViewportPoint(hrp["6"].WorldPosition)
								if onscr == true then
									botline1.From = Vector2.new(fromthing.X, fromthing.Y)
									botline1.To = Vector2.new(tothing.X, tothing.Y)
								end
							end

							if i == 6 then
								botline2.Visible = true
								botline2.Thickness = 2
								local fromthing, onscr = workspace.CurrentCamera:WorldToViewportPoint(hrp["6"].WorldPosition)
								local tothing, onscr = workspace.CurrentCamera:WorldToViewportPoint(hrp["7"].WorldPosition)
								if onscr == true then
									botline2.From = Vector2.new(fromthing.X, fromthing.Y)
									botline2.To = Vector2.new(tothing.X, tothing.Y)
								end
							end

							if i == 7 then
								botline3.Visible = true
								botline3.Thickness = 2
								local fromthing, onscr = workspace.CurrentCamera:WorldToViewportPoint(hrp["7"].WorldPosition)
								local tothing, onscr = workspace.CurrentCamera:WorldToViewportPoint(hrp["8"].WorldPosition)
								if onscr == true then
									botline3.From = Vector2.new(fromthing.X, fromthing.Y)
									botline3.To = Vector2.new(tothing.X, tothing.Y)
								end
							end

							if i == 8 then
								botline4.Visible = true
								botline4.Thickness = 2
								local fromthing, onscr = workspace.CurrentCamera:WorldToViewportPoint(hrp["8"].WorldPosition)
								local tothing, onscr = workspace.CurrentCamera:WorldToViewportPoint(hrp["5"].WorldPosition)
								if onscr == true then
									botline4.From = Vector2.new(fromthing.X, fromthing.Y)
									botline4.To = Vector2.new(tothing.X, tothing.Y)
								end
							end
						end

						for i = 1, 4 do
							if i == 1 then
								line1.Visible = true
								line1.Thickness = 2
								local fromthing, onscr = workspace.CurrentCamera:WorldToViewportPoint(hrp["1"].WorldPosition)
								local tothing, onscr = workspace.CurrentCamera:WorldToViewportPoint(hrp["5"].WorldPosition)

								if onscr == true then
									line1.From = Vector2.new(fromthing.X, fromthing.Y)
									line1.To = Vector2.new(tothing.X, tothing.Y)
								end

							elseif i == 2 then
								line2.Visible = true
								line2.Thickness = 2
								local fromthing, onscr = workspace.CurrentCamera:WorldToViewportPoint(hrp["2"].WorldPosition)
								local tothing = workspace.CurrentCamera:WorldToViewportPoint(hrp["6"].WorldPosition)

								if onscr == true then
									line2.From = Vector2.new(fromthing.X, fromthing.Y)
									line2.To = Vector2.new(tothing.X, tothing.Y)
								end

							elseif i == 3 then
								line3.Visible = true
								line3.Thickness = 2
								local fromthing, onscr = workspace.CurrentCamera:WorldToViewportPoint(hrp["3"].WorldPosition)
								local tothing, onscr = workspace.CurrentCamera:WorldToViewportPoint(hrp["7"].WorldPosition)

								if onscr == true then
									line3.From = Vector2.new(fromthing.X, fromthing.Y)
									line3.To = Vector2.new(tothing.X, tothing.Y)
								end

							elseif i == 4 then
								line4.Visible = true
								line4.Thickness = 2
								local fromthing, onscr = workspace.CurrentCamera:WorldToViewportPoint(hrp["4"].WorldPosition)
								local tothing, onscr = workspace.CurrentCamera:WorldToViewportPoint(hrp["8"].WorldPosition)

								if onscr == true then
									line4.From = Vector2.new(fromthing.X, fromthing.Y)
									line4.To = Vector2.new(tothing.X, tothing.Y)
								end

							end
						end
					end
				end
			end
		end
	end
end)
