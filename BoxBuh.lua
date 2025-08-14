local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "BoxBuh Hub",
    Icon = "package-open",
    LoadingTitle = "Bem-Vindo(a)",
    LoadingSubtitle = "➡By MTS13GAMER⬅",
    ShowText = "Box",

    Theme = {
        TextColor = Color3.fromRGB(255, 255, 255),
        
        Background = Color3.fromRGB(10, 10, 15),
        Topbar = Color3.fromRGB(20, 15, 25),
        Shadow = Color3.fromRGB(5, 5, 10),
        
        NotificationBackground = Color3.fromRGB(25, 20, 35),
        NotificationActionsBackground = Color3.fromRGB(150, 100, 255),
        
        TabBackground = Color3.fromRGB(100, 50, 150),
        TabStroke = Color3.fromRGB(80, 40, 120),
        TabBackgroundSelected = Color3.fromRGB(120, 70, 180),
        TabTextColor = Color3.fromRGB(240, 240, 255),
        SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
        
        ElementBackground = Color3.fromRGB(30, 20, 40),
        ElementBackgroundHover = Color3.fromRGB(40, 30, 50),
        SecondaryElementBackground = Color3.fromRGB(20, 15, 25),
        ElementStroke = Color3.fromRGB(80, 50, 120),
        SecondaryElementStroke = Color3.fromRGB(60, 40, 90),
        
        SliderBackground = Color3.fromRGB(70, 40, 110),
        SliderProgress = Color3.fromRGB(130, 80, 200),
        SliderStroke = Color3.fromRGB(150, 100, 220),
        
        ToggleBackground = Color3.fromRGB(25, 15, 35),
        ToggleEnabled = Color3.fromRGB(120, 60, 180),
        ToggleDisabled = Color3.fromRGB(60, 50, 70),
        ToggleEnabledStroke = Color3.fromRGB(140, 80, 200),
        ToggleDisabledStroke = Color3.fromRGB(80, 70, 90),
        ToggleEnabledOuterStroke = Color3.fromRGB(90, 60, 130),
        ToggleDisabledOuterStroke = Color3.fromRGB(50, 40, 60),
        
        DropdownSelected = Color3.fromRGB(40, 25, 55),
        DropdownUnselected = Color3.fromRGB(25, 20, 35),
        
        InputBackground = Color3.fromRGB(30, 20, 40),
        InputStroke = Color3.fromRGB(80, 50, 120),
        PlaceholderColor = Color3.fromRGB(160, 140, 180)
    },
 
    ToggleUIKeybind = "B",
 
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
 
    ConfigurationSaving = {
       Enabled = false,
       FolderName = "Box",
       FileName = "BoxSave"
    },
 
    Discord = {
       Enabled = false,
       Invite = "noinvitelink",
       RememberJoins = true
    },
 
    KeySystem = true,
    KeySettings = {
       Title = "Box KeySystem",
       Subtitle = "Key System",
       Note = "Key: Update12",
       FileName = "BoxKey",
       SaveKey = true,
       GrabKeyFromSite = false,
       Key = {"Update12", "update12"}
    }
})

local Tab = Window:CreateTab("Main", "gamepad")
local Section = Tab:CreateSection("Main Hub")
local Divider = Tab:CreateDivider()

local Tab2 = Window:CreateTab("Universal", "bookmark")
local Section2 = Tab2:CreateSection("Universal")
local Divider2 = Tab2:CreateDivider()

local Tab3 = Window:CreateTab("Universal Guis", "bookmark")
local Section3 = Tab3:CreateSection("Guis")
local Divider3 = Tab3:CreateDivider()

local Tab4 = Window:CreateTab("Extras", "settings")
local Section4 = Tab4:CreateSection("Extras")
local Divider4 = Tab4:CreateDivider()

Tab:CreateButton({
    Name = "Box Discord",
    Callback = function()
        setclipboard("https://discord.gg/BZwtCDS4Vz")
        Rayfield:Notify({
            Title = "Link Do Discord Copiado",
            Content = "Cole No Seu Navegador Pra Entrar No Discord",
            Duration = 6.5,
            Image = "clipboard",
        })
    end,
})

Tab:CreateButton({
    Name = "Log",
    Callback = function()
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LogGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Theme = {
    TextColor = Color3.fromRGB(255, 255, 255),
    Background = Color3.fromRGB(10, 10, 15),
    Topbar = Color3.fromRGB(20, 15, 25),
    Shadow = Color3.fromRGB(5, 5, 10),
    TabBackground = Color3.fromRGB(100, 50, 150),
    TabStroke = Color3.fromRGB(80, 40, 120),
    TabBackgroundSelected = Color3.fromRGB(120, 70, 180),
    TabTextColor = Color3.fromRGB(240, 240, 255),
    SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
    ElementBackground = Color3.fromRGB(30, 20, 40),
    ElementBackgroundHover = Color3.fromRGB(40, 30, 50),
}

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 400, 0, 300)
Frame.Position = UDim2.new(0.5, -200, 0.5, -150)
Frame.BackgroundColor3 = Theme.Background
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui
Frame.AnchorPoint = Vector2.new(0.5, 0.5)

local Topbar = Instance.new("Frame")
Topbar.Size = UDim2.new(1, 0, 0, 30)
Topbar.Position = UDim2.new(0, 0, 0, 0)
Topbar.BackgroundColor3 = Theme.Topbar
Topbar.BorderSizePixel = 0
Topbar.Parent = Frame

local dragging = false
local dragInput, mousePos, framePos

Topbar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        mousePos = input.Position
        framePos = Frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Topbar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - mousePos
        Frame.Position = UDim2.new(
            framePos.X.Scale,
            framePos.X.Offset + delta.X,
            framePos.Y.Scale,
            framePos.Y.Offset + delta.Y
        )
    end
end)

local Title = Instance.new("TextLabel")
Title.Text = "📜 Log de Atualizações"
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 24
Title.TextColor3 = Theme.TextColor
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Parent = Topbar

local CloseButton = Instance.new("TextButton")
CloseButton.Text = "✖"
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.TextSize = 20
CloseButton.TextColor3 = Theme.TextColor
CloseButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 0)
CloseButton.Parent = Topbar
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local function createLogItem(text, yOffset)
    local Label = Instance.new("TextLabel")
    Label.Text = text
    Label.Font = Enum.Font.SourceSans
    Label.TextSize = 18
    Label.TextColor3 = Theme.TextColor
    Label.BackgroundTransparency = 1
    Label.Size = UDim2.new(1, -20, 0, 30)
    Label.Position = UDim2.new(0, 10, 0, yOffset)
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame
end

createLogItem("✨ Novas Funcionalidades adicionadas", 50)
createLogItem("🎨 Tema Personalizado implementado", 90)
createLogItem("🗂️ Alguns tabs foram removidos", 130)
createLogItem("🖱️ Alguns botões foram removidos", 170)
createLogItem("🔄 Alterações de posição realizadas", 210)

    end,
})

Tab:CreateButton({
    Name = "Destruir Hub",
    Callback = function()
        Rayfield:Destroy()
    end,
})

local Input = Tab:CreateInput({
   Name = "Box Creator Key",
   CurrentValue = "",
   PlaceholderText = "Key",
   RemoveTextAfterFocusLost = false,
   Flag = "CreatorKey",
   Callback = function(Text)
       if Text == "13031" then
           loadstring(game:HttpGet("https://raw.githubusercontent.com/MTS13GAMER/Dev-Scripter/refs/heads/main/BoxCreator.lua"))()
       end
   end,
})

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local Slider = Tab2:CreateSlider({
    Name = "Speed",
    Range = {16, 900},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "Speed",
    Callback = function(Value)
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = Value
            end
        end
    end,
})

local jumpPowerSlider = Tab2:CreateSlider({
    Name = "Jump Power",
    Range = {16, 200},
    Increment = 1,
    Suffix = "Power",
    CurrentValue = 50,
    Flag = "JumpPower",
    Callback = function(Value)
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.JumpPower = Value
                if humanoid.JumpHeight then
                    humanoid.JumpHeight = Value / 4
                end
            end
        end
    end,
})

local Toggle = Tab2:CreateToggle({
   Name = "Infinite Jump",
   CurrentValue = false,
   Flag = "ToggleInfJump", 
   Callback = function(Value)
       if _G.InfJumpConnection then
           _G.InfJumpConnection:Disconnect()
           _G.InfJumpConnection = nil
       end

       if Value then
           _G.InfJumpConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
               local character = game.Players.LocalPlayer.Character
               if character and character:FindFirstChildOfClass("Humanoid") then
                   character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
               end
           end)
       end
   end,
})

local noclipEnabled = false
local RunService = game:GetService("RunService")

local function applyNoclip()
    if player.Character then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.CanCollide = not noclipEnabled
            end
        end
    end
end

local noclipConnection
local Toggle = Tab2:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "Noclip",
    Callback = function(Value)
        noclipEnabled = Value
        
        if noclipEnabled then
            noclipConnection = RunService.Stepped:Connect(function()
                applyNoclip()
            end)
            Rayfield:Notify({
                Title = "Noclip",
                Content = "Noclip ativado",
                Duration = 1.5,
                Image = "zap"
            })
        else
            if noclipConnection then
                noclipConnection:Disconnect()
                noclipConnection = nil
            end
            applyNoclip()
            Rayfield:Notify({
                Title = "Noclip",
                Content = "Noclip desativado",
                Duration = 1.5,
                Image = "zap"
            })
        end
    end,
})

local toolName = "Click Tp"
local mouse = player:GetMouse()

local tool = Instance.new("Tool")
tool.Name = toolName
tool.RequiresHandle = true
tool.CanBeDropped = true

local handle = Instance.new("Part")
handle.Name = "Handle"
handle.Size = Vector3.new(1, 1, 1)
handle.Color = Color3.fromRGB(255, 0, 0)
handle.Shape = Enum.PartType.Ball
handle.Material = Enum.Material.Neon
handle.Parent = tool

local function teleportToClick()
    if mouse.Hit then
        local targetPosition = mouse.Hit.Position
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition + Vector3.new(0, 3, 0))
        end
    end
end

tool.Activated:Connect(teleportToClick)

local Button = Tab2:CreateButton({
    Name = "Click TP",
    Callback = function()
        if player.Backpack:FindFirstChild(toolName) then
            tool.Parent = player.Character
        else
            tool.Parent = player.Backpack
        end
        
        Rayfield:Notify({
            Title = "Click TP",
            Content = "Ferramenta de teleporte adicionada!",
            Duration = 1,
            Image = "zap"
        })
    end,
})

local Button = Tab2:CreateButton({
    Name = "Reset",
    Callback = function()
        local character = player.Character

        if character and character:FindFirstChild("Humanoid") then
            local humanoid = character.Humanoid
            humanoid.Health = 0

            Rayfield:Notify({
                Title = "Resetado",
                Content = "Você morreu!",
                Duration = 0.8,
                Image = "skull",
            })
        else
            Rayfield:Notify({
                Title = "Reset Error",
                Content = "Não foi possível Resetar.",
                Duration = 0.8,
                Image = "x",
            })
        end
    end,
})

local GotoPlayerName = ""
local fastTp = false
local fastTpConnection

local Input = Tab2:CreateInput({ 
   Name = "Goto", 
   CurrentValue = "",
   PlaceholderText = "Nome do jogador",
   RemoveTextAfterFocusLost = false,
   Flag = "GotoInput",
   Callback = function(Text)
      GotoPlayerName = Text
   end,
})

local function ToggleFastTeleport()
    fastTp = not fastTp
    if fastTp then
        fastTpConnection = RunService.Heartbeat:Connect(function()
            local localChar = player.Character
            local targetPlr = Players:FindFirstChild(GotoPlayerName)

            if targetPlr and targetPlr.Character and targetPlr.Character:FindFirstChild("HumanoidRootPart") and 
               localChar and localChar:FindFirstChild("HumanoidRootPart") then
                localChar.HumanoidRootPart.CFrame = targetPlr.Character.HumanoidRootPart.CFrame
            end
        end)
        Rayfield:Notify({
            Title = "Teleporte Loop",
            Content = "Ativado para " .. GotoPlayerName,
            Duration = 1.5,
            Image = "zap"
        })
    else
        if fastTpConnection then
            fastTpConnection:Disconnect()
            fastTpConnection = nil
        end
        Rayfield:Notify({
            Title = "Teleporte Loop",
            Content = "Desativado",
            Duration = 1.5,
            Image = "x"
        })
    end
end

Tab2:CreateButton({
   Name = "Teleportar",
   Callback = function()
      local localChar = player.Character
      local targetPlr = Players:FindFirstChild(GotoPlayerName)

      if targetPlr and targetPlr.Character and targetPlr.Character:FindFirstChild("HumanoidRootPart") and
         localChar and localChar:FindFirstChild("HumanoidRootPart") then
         localChar.HumanoidRootPart.CFrame = targetPlr.Character.HumanoidRootPart.CFrame
         Rayfield:Notify({
            Title = "Teleporte",
            Content = "Teleportado para " .. GotoPlayerName,
            Duration = 1,
            Image = "zap"
         })
      else
         Rayfield:Notify({
            Title = "Erro",
            Content = "Jogador não encontrado ou inválido",
            Duration = 2,
            Image = "x"
         })
      end
   end,
})

Tab2:CreateButton({
   Name = "Teleporte Loop",
   Callback = function()
      if GotoPlayerName ~= "" then
          ToggleFastTeleport()
      else
          Rayfield:Notify({
             Title = "Erro",
             Content = "Digite o nome de um jogador primeiro",
             Duration = 2,
             Image = "x"
          })
      end
   end,
})

local Button = Tab4:CreateButton({
    Name = "Reverse (Mobile)",
    Callback = function()
        local flashbacklength = 60
        local flashbackspeed = 1
         
        local name = game:GetService("RbxAnalyticsService"):GetSessionId()
        local frames = {}
        local LP = Players.LocalPlayer
        local RS = RunService
        local UIS = game:GetService("UserInputService")
         
        pcall(RS.UnbindFromRenderStep, RS, name)
        
        local function getchar()
            return LP.Character or LP.CharacterAdded:Wait()
        end
        
        local function gethrp(c)
            return c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso")
        end
        
        local flashback = {lastinput=false, canrevert=true, isReverting=false}
        
        function flashback:Advance(char, hrp, hum, allowinput)
            if #frames > flashbacklength * 60 then
                table.remove(frames, 1)
            end
            if allowinput and not self.canrevert then
                self.canrevert = true
            end
            if self.lastinput then
                hum.PlatformStand = false
                self.lastinput = false
            end
            table.insert(frames, {
                hrp.CFrame,
                hrp.AssemblyLinearVelocity or hrp.Velocity,
                hum:GetState(),
                hum.PlatformStand,
                char:FindFirstChildOfClass("Tool")
            })
        end
        
        function flashback:Revert(char, hrp, hum)
            local num = #frames
            if num == 0 or not self.canrevert then
                self.canrevert = false
                self:Advance(char, hrp, hum)
                return
            end
            for i = 1, flashbackspeed do
                table.remove(frames, num)
                num = num - 1
                if num <= 0 then break end
            end
            if num > 0 then
                self.lastinput = true
                local lastframe = frames[num]
                table.remove(frames, num)
                hrp.CFrame = lastframe[1]
                if hrp.AssemblyLinearVelocity then
                    hrp.AssemblyLinearVelocity = -lastframe[2]
                else
                    hrp.Velocity = -lastframe[2]
                end
                hum:ChangeState(lastframe[3])
                hum.PlatformStand = lastframe[4]
                local currenttool = char:FindFirstChildOfClass("Tool")
                if lastframe[5] then
                    if not currenttool then
                        hum:EquipTool(lastframe[5])
                    end
                else
                    hum:UnequipTools()
                end
            end
        end
        
        local screenGui = Instance.new("ScreenGui")
        screenGui.Parent = LP:WaitForChild("PlayerGui")
        
        local reverseButton = Instance.new("TextButton")
        reverseButton.Size = UDim2.new(0.12, 0, 0.06, 0)
        reverseButton.Position = UDim2.new(0.8, 0, 0.85, 0)
        reverseButton.Text = "Reverse"
        reverseButton.BackgroundColor3 = Color3.new(1, 0, 0)
        reverseButton.TextColor3 = Color3.new(1, 1, 1)
        reverseButton.TextScaled = true
        reverseButton.Font = Enum.Font.SourceSansBold
        reverseButton.BorderSizePixel = 2
        reverseButton.BorderColor3 = Color3.new(0, 0, 0)
        reverseButton.Draggable = true
        reverseButton.Active = true
        reverseButton.Selectable = true
        reverseButton.Parent = screenGui
        
        local function step()
            local char = getchar()
            if not char then return end
            local hrp = gethrp(char)
            local hum = char:FindFirstChildWhichIsA("Humanoid")
            if not hrp or not hum then return end
            
            if flashback.isReverting then
                flashback:Revert(char, hrp, hum)
            else
                flashback:Advance(char, hrp, hum, true)
            end
        end
        
        reverseButton.MouseButton1Click:Connect(function()
            flashback.isReverting = not flashback.isReverting
            reverseButton.BackgroundColor3 = flashback.isReverting and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
            reverseButton.Text = flashback.isReverting and "ON" or "Reverse"
        end)
        
        RS:BindToRenderStep(name, 1, step)
        
        Rayfield:Notify({
            Title = "Reverse Mobile",
            Content = "Botão de reverse criado!",
            Duration = 2,
            Image = "smartphone"
        })
    end,
})

local Button = Tab4:CreateButton({
    Name = "Reverse (PC)",
    Callback = function()
        local key = "E"
        local flashbacklength = 60
        local flashbackspeed = 1
         
        local name = game:GetService("RbxAnalyticsService"):GetSessionId()
        local frames = {}
        local uis = game:GetService("UserInputService")
        local LP = Players.LocalPlayer
        local RS = RunService
         
        pcall(RS.UnbindFromRenderStep, RS, name)
         
        local function getchar()
           return LP.Character or LP.CharacterAdded:Wait()
        end
         
        local function gethrp(c)
            return c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso")
        end
         
        local flashback = {lastinput=false, canrevert=true}
         
        function flashback:Advance(char, hrp, hum, allowinput)
           if #frames > flashbacklength * 60 then
               table.remove(frames, 1)
           end
         
           if allowinput and not self.canrevert then
               self.canrevert = true
           end
         
           if self.lastinput then
               hum.PlatformStand = false
               self.lastinput = false
           end
         
           table.insert(frames, {
               hrp.CFrame,
               hrp.AssemblyLinearVelocity or hrp.Velocity,
               hum:GetState(),
               hum.PlatformStand,
               char:FindFirstChildOfClass("Tool")
           })
        end
         
        function flashback:Revert(char, hrp, hum)
           local num = #frames
           if num == 0 or not self.canrevert then
               self.canrevert = false
               self:Advance(char, hrp, hum)
               return
           end
           for i = 1, flashbackspeed do
               table.remove(frames, num)
               num = num - 1
               if num <= 0 then break end
           end
           if num > 0 then
               self.lastinput = true
               local lastframe = frames[num]
               table.remove(frames, num)
               hrp.CFrame = lastframe[1]
               if hrp.AssemblyLinearVelocity then
                   hrp.AssemblyLinearVelocity = -lastframe[2]
               else
                   hrp.Velocity = -lastframe[2]
               end
               hum:ChangeState(lastframe[3])
               hum.PlatformStand = lastframe[4]
               local currenttool = char:FindFirstChildOfClass("Tool")
               if lastframe[5] then
                   if not currenttool then
                       hum:EquipTool(lastframe[5])
                   end
               else
                   hum:UnequipTools()
               end
           end
        end
         
        local function step()
           local char = getchar()
           if not char then return end
           local hrp = gethrp(char)
           local hum = char:FindFirstChildWhichIsA("Humanoid")
           if not hrp or not hum then return end
           
           if uis:IsKeyDown(Enum.KeyCode[key]) then
               flashback:Revert(char, hrp, hum)
           else
               flashback:Advance(char, hrp, hum, true)
           end
        end
        
        RS:BindToRenderStep(name, 1, step)
        
        Rayfield:Notify({
            Title = "Reverse PC",
            Content = "Aperte E para voltar no tempo!",
            Duration = 3,
            Image = "keyboard"
        })
    end,
})

local antiAfkEnabled = false
local VirtualUser = game:GetService("VirtualUser")

local function enableAntiAfk()
    if not antiAfkEnabled then
        antiAfkEnabled = true
        player.Idled:Connect(function()
            if antiAfkEnabled then
                VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                wait(1)
                VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            end
        end)
        Rayfield:Notify({
            Title = "Anti-AFK",
            Content = "Anti-AFK ativado!",
            Duration = 0.8,
            Image = "shield",
        })
    end
end

local function disableAntiAfk()
    antiAfkEnabled = false
    Rayfield:Notify({
        Title = "Anti-AFK",
        Content = "Anti-AFK desativado!",
        Duration = 0.8,
        Image = "x",
    })
end

local Toggle = Tab2:CreateToggle({
    Name = "Anti-AFK",
    CurrentValue = false,
    Flag = "AntiAfkToggle",
    Callback = function(Value)
        if Value then
            enableAntiAfk()
        else
            disableAntiAfk()
        end
    end,
})


Tab3:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
        Rayfield:Notify({
            Title = "GUI Carregado",
            Content = "Infinite Yield foi carregado!",
            Duration = 2,
            Image = "code"
        })
    end,
})

Tab3:CreateButton({
    Name = "Fly GUI V3",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
        Rayfield:Notify({
            Title = "GUI Carregado",
            Content = "Fly GUI V3 foi carregado!",
            Duration = 2,
            Image = "plane"
        })
    end,
})

Tab3:CreateButton({
    Name = "Dark Dex",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua"))()
        Rayfield:Notify({
            Title = "GUI Carregado",
            Content = "Dark Dex foi carregado!",
            Duration = 2,
            Image = "search"
        })
    end,
})

Tab3:CreateButton({
    Name = "Simple Spy",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/master/SimpleSpy.lua"))()
        Rayfield:Notify({
            Title = "GUI Carregado",
            Content = "Simple Spy foi carregado!",
            Duration = 2,
            Image = "eye"
        })
    end,
})

Tab3:CreateButton({
    Name = "Fe Emote Gui",
    Callback = function()
        loadstring(game:HttpGet("https://yarhm.mhi.im/scr?channel=afem"))()
        Rayfield:Notify({
            Title = "GUI Carregado",
            Content = "Emote Gui foi carregado!",
            Duration = 2,
            Image = "ticket-plus"
        })
    end,
})

local fovSlider = Tab4:CreateSlider({
    Name = "FOV",
    Range = {70, 120},
    Increment = 1,
    Suffix = "FOV",
    CurrentValue = 70,
    Flag = "FOV",
    Callback = function(Value)
        workspace.CurrentCamera.FieldOfView = Value
    end,
})

Tab4:CreateButton({
   Name = "Reset Player",
   Callback = function()
       if player.Character and player.Character:FindFirstChild("Humanoid") then
           player.Character.Humanoid.Health = 0
           Rayfield:Notify({
               Title = "Player Resetado",
               Content = "Seu personagem foi resetado!",
               Duration = 1.5,
               Image = "refresh-cw"
           })
       end
   end,
})

Tab4:CreateButton({
   Name = "Rejoin Server",
   Callback = function()
       game:GetService("TeleportService"):Teleport(game.PlaceId, player)
   end,
})

local fullbrightEnabled = false
local lighting = game:GetService("Lighting")
local originalSettings = {
    Brightness = lighting.Brightness,
    Ambient = lighting.Ambient,
    OutdoorAmbient = lighting.OutdoorAmbient
}

local Toggle = Tab4:CreateToggle({
    Name = "Full Bright",
    CurrentValue = false,
    Flag = "FullBright",
    Callback = function(Value)
        fullbrightEnabled = Value
        if fullbrightEnabled then
            lighting.Brightness = 2
            lighting.Ambient = Color3.new(1, 1, 1)
            lighting.OutdoorAmbient = Color3.new(1, 1, 1)
        else
            lighting.Brightness = originalSettings.Brightness
            lighting.Ambient = originalSettings.Ambient
            lighting.OutdoorAmbient = originalSettings.OutdoorAmbient
        end
    end,
})

Rayfield:Notify({
    Title = "BoxBuh Hub",
    Content = "Hub carregado (By MTS13GAMER)",
    Duration = 3,
    Image = "check"
})
