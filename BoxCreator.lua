local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Box Creator Hub",
    Icon = 0,
    LoadingTitle = "Box Creator",
    LoadingSubtitle = "➡ By MTS13GAMER⬅",
    ShowText = "Creator Hub",
    Theme = "Default",

    ToggleUIKeybind = "J",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,

    ConfigurationSaving = {
        Enabled = true,
        FolderName = "Creator",
        FileName = "Box Creator Hub"
    },

    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },

    KeySystem = false,
    KeySettings = {
        Title = "Box Creator Key",
        Subtitle = "Key System",
        Note = "a",
        FileName = "triz",
        SaveKey = true,
        GrabKeyFromSite = false, -- IMPORTANTE: falso para pegar manualmente
        key = {"5mNrCF7SZHH8DRoSaLlNm0DyeBT9BH"} -- Essa é a key válida que o jogador deve colar
    }
})

local Tab = Window:CreateTab("Box Creator", 4483362458) 

local Section = Tab:CreateSection("Cordenadas")

local Divider = Tab:CreateDivider()

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local runService = game:GetService("RunService")
local setClipboard = setclipboard or toclipboard

-- GUI coordenadas
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CoordenadasGUI"
screenGui.ResetOnSpawn = false
screenGui.Enabled = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Frame maior
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 100)
frame.Position = UDim2.new(0.7, 0, 0.15, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BackgroundTransparency = 0.1
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

-- Texto coordenadas
local coordLabel = Instance.new("TextLabel")
coordLabel.Size = UDim2.new(1, 0, 0.6, 0)
coordLabel.Position = UDim2.new(0, 0, 0, 0)
coordLabel.BackgroundTransparency = 1
coordLabel.TextColor3 = Color3.new(1, 1, 1)
coordLabel.TextScaled = true
coordLabel.Font = Enum.Font.SourceSansBold
coordLabel.Text = "Coordenadas: Carregando..."
coordLabel.Parent = frame

-- Botão copiar
local copyButton = Instance.new("TextButton")
copyButton.Size = UDim2.new(1, -20, 0.3, 0)
copyButton.Position = UDim2.new(0, 10, 0.65, 0)
copyButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
copyButton.TextColor3 = Color3.new(1, 1, 1)
copyButton.TextScaled = true
copyButton.Font = Enum.Font.SourceSans
copyButton.Text = "Copiar Coordenadas"
copyButton.Parent = frame

-- Armazena texto amigável e formato compacto
local ultimaPosicaoTexto = "..."
local ultimaPosicaoCopiar = "..."

-- Atualiza coordenadas em tempo real
local updateConnection
local function startUpdatingCoords()
	updateConnection = runService.RenderStepped:Connect(function()
		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local pos = player.Character.HumanoidRootPart.Position
			local textoVisivel = string.format("X: %.1f  Y: %.1f  Z: %.1f", pos.X, pos.Y, pos.Z)
			local textoCopiar = string.format("%.1f,%.1f,%.1f", pos.X, pos.Y, pos.Z)

			coordLabel.Text = textoVisivel
			ultimaPosicaoTexto = textoVisivel
			ultimaPosicaoCopiar = textoCopiar
		end
	end)
end

local function stopUpdatingCoords()
	if updateConnection then
		updateConnection:Disconnect()
	end
end

-- Copiar para área de transferência
copyButton.MouseButton1Click:Connect(function()
	if setClipboard then
		setClipboard(ultimaPosicaoCopiar)
	end
end)

-- Toggle Rayfield
local Toggle = Tab:CreateToggle({
	Name = "Coordenadas",
	CurrentValue = false,
	Flag = "Coods",
	Callback = function(Value)
		if Value then
			screenGui.Enabled = true
			startUpdatingCoords()
		else
			screenGui.Enabled = false
			stopUpdatingCoords()
		end
	end,
})


local Players = game:GetService("Players")
local player = Players.LocalPlayer
local setClipboard = setclipboard or toclipboard -- compatível com executores

local coordenadasTexto = ""

-- Função auxiliar: converte texto para Vector3
local function parseCoordenadas(texto)
	local x, y, z = string.match(texto, "(-?%d+%.?%d*),%s*(-?%d+%.?%d*),%s*(-?%d+%.?%d*)")
	if x and y and z then
		return Vector3.new(tonumber(x), tonumber(y), tonumber(z))
	else
		return nil
	end
end

-- Input para digitar as coordenadas
local Input = Tab:CreateInput({
	Name = "Digite as coordenadas (X, Y, Z)",
	CurrentValue = "",
	PlaceholderText = "Ex: 100, 50, 200",
	RemoveTextAfterFocusLost = false,
	Flag = "Input1",
	Callback = function(Text)
		coordenadasTexto = Text
	end,
})

-- Botão para teleportar o jogador
local ButtonTP = Tab:CreateButton({
	Name = "Teleportar para coordenadas",
	Callback = function()
		local destino = parseCoordenadas(coordenadasTexto)
		if destino and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			player.Character.HumanoidRootPart.CFrame = CFrame.new(destino)
		else
			warn("Coordenadas inválidas ou personagem não encontrado.")
		end
	end,
})

-- Botão para copiar o script de teleporte
local ButtonCopy = Tab:CreateButton({
	Name = "Copiar script de Teleporte",
	Callback = function()
		local destino = parseCoordenadas(coordenadasTexto)
		if destino and setClipboard then
			local scriptText = string.format([[
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local destino = Vector3.new(%.2f, %.2f, %.2f)

if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
	player.Character.HumanoidRootPart.CFrame = CFrame.new(destino)
end]], destino.X, destino.Y, destino.Z)

			setClipboard(scriptText)
		else
			warn("Coordenadas inválidas ou clipboard não disponível.")
		end
	end,
})


local Button = Tab:CreateButton({
   Name = "Destroy",
   Callback = function()
    Rayfield:Destroy()
   end,
})
