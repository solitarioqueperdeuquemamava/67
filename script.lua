--[==[ VOID HUB - COMPLETO E CORRIGIDO (V33) ]==]
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TeleportService = game:GetService("TeleportService")
local Lighting = game:GetService("Lighting")
local Stats = game:GetService("Stats")
local LocalPlayer = Players.LocalPlayer

local existing = CoreGui:FindFirstChild("VoidHubSystem")
if existing then existing:Destroy() end

getgenv().VoidHub = getgenv().VoidHub or {}
local VH = getgenv().VoidHub

VH.PurpleColor = Color3.fromRGB(140, 40, 220)
VH.NeonPurple = Color3.fromRGB(180, 80, 255)

VH.Gui = Instance.new("ScreenGui")
VH.Gui.Name = "VoidHubSystem"
VH.Gui.ResetOnSpawn = false
VH.Gui.Parent = CoreGui

-- ==================== SISTEMA DE CONFIGURAÇÃO SALVA (SÓ COR) ====================
local CONFIG_FILE = "VoidHub_Config.txt"
local corPadrao = { cor = Color3.fromRGB(140, 40, 220), img = "rbxassetid://112459375607724", transparente = false }

local function carregarConfig()
    local config = corPadrao
    if readfile and isfile then
        local ok, content = pcall(function()
            if isfile(CONFIG_FILE) then return readfile(CONFIG_FILE) end
            return nil
        end)
        if ok and content and content ~= "" then
            local parts = string.split(content, "|")
            if #parts >= 2 then
                local rgb = string.split(parts[1], ",")
                if #rgb == 3 then
                    local r = tonumber(rgb[1])
                    local g = tonumber(rgb[2])
                    local b = tonumber(rgb[3])
                    if r and g and b then
                        config = {
                            cor = Color3.fromRGB(r, g, b),
                            img = parts[2],
                            transparente = parts[3] == "true"
                        }
                    end
                end
            end
        end
    end
    return config
end

local function salvarConfig(op)
    local str = op.cor.R .. "," .. op.cor.G .. "," .. op.cor.B .. "|" .. op.img .. "|" .. tostring(op.transparente or false)
    if writefile then
        pcall(function() writefile(CONFIG_FILE, str) end)
    end
end

VH.CorAtual = carregarConfig()
-- FORÇA O BYPASS A SEMPRE COMEÇAR BLOQUEADO AO INJETAR O SCRIPT
VH.BypassConcluido = false 

local isBranco = (VH.CorAtual.cor == Color3.fromRGB(220, 220, 220) or VH.CorAtual.cor == Color3.fromRGB(240, 240, 240))
local corTextoInvertido = Color3.fromRGB(40, 40, 40)

-- ==================== KEY SYSTEM ====================
local function generateDeviceKey()
    local userIdStr = tostring(LocalPlayer.UserId)
    local hash = 0
    for i = 1, #userIdStr do
        hash = (hash * 31 + string.byte(userIdStr, i)) % 4294967296
    end
    return string.format("VH-%08X-%04X", hash, (hash * 7) % 65536)
end
VH.DeviceKey = generateDeviceKey()

local keyContainer = Instance.new("Frame", VH.Gui)
keyContainer.Name = "KeyContainer"
keyContainer.Size = UDim2.new(0, 400, 0, 240)
keyContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
keyContainer.AnchorPoint = Vector2.new(0.5, 0.5)
keyContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
keyContainer.BackgroundTransparency = VH.CorAtual.transparente and 0.95 or 0.3
keyContainer.ClipsDescendants = true
Instance.new("UICorner", keyContainer).CornerRadius = UDim.new(0, 28)

local keyBg = Instance.new("ImageLabel", keyContainer)
keyBg.Size = UDim2.new(1, 0, 1, 0)
keyBg.BackgroundTransparency = 1
keyBg.Image = VH.CorAtual.img
keyBg.ScaleType = Enum.ScaleType.Crop
keyBg.ImageTransparency = VH.CorAtual.transparente and 0.95 or 0
keyBg.ZIndex = 0
Instance.new("UICorner", keyBg).CornerRadius = UDim.new(0, 28)

local keyStroke = Instance.new("UIStroke", keyContainer)
keyStroke.Color = VH.CorAtual.cor
keyStroke.Thickness = 2.5
keyStroke.Transparency = 0

local titleKey = Instance.new("TextLabel", keyContainer)
titleKey.Size = UDim2.new(1, 0, 0, 32)
titleKey.Position = UDim2.new(0, 0, 0, 18)
titleKey.BackgroundTransparency = 1
titleKey.Text = "VOID HUB"
titleKey.Font = Enum.Font.GothamBold
titleKey.TextSize = 20
titleKey.TextColor3 = isBranco and corTextoInvertido or Color3.fromRGB(255, 255, 255)
titleKey.ZIndex = 3

local subTitleKey = Instance.new("TextLabel", keyContainer)
subTitleKey.Size = UDim2.new(1, 0, 0, 16)
subTitleKey.Position = UDim2.new(0, 0, 0, 48)
subTitleKey.BackgroundTransparency = 1
subTitleKey.Text = "Digite sua Key para continuar"
subTitleKey.Font = Enum.Font.Gotham
subTitleKey.TextSize = 11
subTitleKey.TextColor3 = isBranco and corTextoInvertido or Color3.fromRGB(180, 160, 200)
subTitleKey.ZIndex = 3

local textBox = Instance.new("TextBox", keyContainer)
textBox.Size = UDim2.new(0, 340, 0, 40)
textBox.Position = UDim2.new(0.5, -170, 0, 78)
textBox.BackgroundColor3 = Color3.fromRGB(15, 10, 25)
textBox.BackgroundTransparency = 0.4
textBox.PlaceholderText = "Digite sua Key..."
textBox.PlaceholderColor3 = Color3.fromRGB(140, 120, 160)
textBox.Text = ""
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.Font = Enum.Font.Gotham
textBox.TextSize = 13
Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 10)
textBox.ZIndex = 3

local validateBtn = Instance.new("TextButton", keyContainer)
validateBtn.Size = UDim2.new(0, 165, 0, 40)
validateBtn.Position = UDim2.new(0, 30, 0, 130)
validateBtn.BackgroundColor3 = VH.CorAtual.cor
validateBtn.Text = "Verificar"
validateBtn.Font = Enum.Font.GothamBold
validateBtn.TextSize = 13
validateBtn.TextColor3 = isBranco and corTextoInvertido or Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", validateBtn).CornerRadius = UDim.new(0, 10)
validateBtn.ZIndex = 3

local getKeyBtn = Instance.new("TextButton", keyContainer)
getKeyBtn.Size = UDim2.new(0, 165, 0, 40)
getKeyBtn.Position = UDim2.new(1, -195, 0, 130)
getKeyBtn.BackgroundColor3 = Color3.fromRGB(20, 15, 30)
getKeyBtn.Text = "Obter Key"
getKeyBtn.Font = Enum.Font.GothamBold
getKeyBtn.TextSize = 13
getKeyBtn.TextColor3 = Color3.fromRGB(220, 180, 255)
Instance.new("UICorner", getKeyBtn).CornerRadius = UDim.new(0, 10)
getKeyBtn.ZIndex = 3
local getKeyStroke = Instance.new("UIStroke", getKeyBtn)
getKeyStroke.Color = VH.CorAtual.cor
getKeyStroke.Thickness = 1.5

getKeyBtn.MouseButton1Click:Connect(function()
    if setclipboard then setclipboard(VH.DeviceKey) end
    textBox.Text = VH.DeviceKey
end)

-- ==================== MAIN GUI ====================
local voidHubMain = Instance.new("Frame", VH.Gui)
voidHubMain.Name = "VoidHubMain"
voidHubMain.Size = UDim2.new(0, 360, 0, 440)
voidHubMain.Position = UDim2.new(0.5, 0, 0.3, 0)
voidHubMain.AnchorPoint = Vector2.new(0.5, 0)
voidHubMain.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
voidHubMain.BackgroundTransparency = VH.CorAtual.transparente and 0.95 or 0.6
voidHubMain.ClipsDescendants = true
voidHubMain.Visible = false
Instance.new("UICorner", voidHubMain).CornerRadius = UDim.new(0, 28)

local mainStroke = Instance.new("UIStroke", voidHubMain)
mainStroke.Color = VH.CorAtual.cor
mainStroke.Thickness = 2.5
mainStroke.Transparency = 0

local mainBg = Instance.new("ImageLabel", voidHubMain)
mainBg.Size = UDim2.new(1, 0, 1, 0)
mainBg.BackgroundTransparency = 1
mainBg.Image = VH.CorAtual.img
mainBg.ScaleType = Enum.ScaleType.Crop
mainBg.ImageTransparency = VH.CorAtual.transparente and 0.95 or 0
mainBg.ZIndex = 0
Instance.new("UICorner", mainBg).CornerRadius = UDim.new(0, 28)

local mainTitle = Instance.new("TextLabel", voidHubMain)
mainTitle.Size = UDim2.new(1, -100, 0, 25)
mainTitle.Position = UDim2.new(0.5, 0, 0, 12)
mainTitle.AnchorPoint = Vector2.new(0.5, 0)
mainTitle.BackgroundTransparency = 1
mainTitle.Text = "Void Hub"
mainTitle.Font = Enum.Font.GothamBold
mainTitle.TextSize = 20
mainTitle.TextColor3 = isBranco and corTextoInvertido or Color3.fromRGB(255, 255, 255)
mainTitle.ZIndex = 3

local subTitle = Instance.new("TextLabel", voidHubMain)
subTitle.Size = UDim2.new(1, 0, 0, 15)
subTitle.Position = UDim2.new(0.5, 0, 0, 38)
subTitle.AnchorPoint = Vector2.new(0.5, 0)
subTitle.BackgroundTransparency = 1
subTitle.Text = "The best script"
subTitle.Font = Enum.Font.GothamBold
subTitle.TextSize = 10
subTitle.TextColor3 = isBranco and corTextoInvertido or VH.CorAtual.cor
subTitle.ZIndex = 3

local minimizeBtn = Instance.new("TextButton", voidHubMain)
minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
minimizeBtn.Position = UDim2.new(0, 12, 0, 12)
minimizeBtn.BackgroundColor3 = VH.CorAtual.cor
minimizeBtn.BackgroundTransparency = isBranco and 0.2 or 0.5
minimizeBtn.Text = "-"
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 20
minimizeBtn.TextColor3 = isBranco and corTextoInvertido or Color3.fromRGB(255, 255, 255)
minimizeBtn.ZIndex = 5
Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(0, 9)

local lockBtn = Instance.new("TextButton", voidHubMain)
lockBtn.Size = UDim2.new(0, 30, 0, 30)
lockBtn.Position = UDim2.new(1, -42, 0, 12)
lockBtn.BackgroundColor3 = VH.CorAtual.cor
lockBtn.BackgroundTransparency = isBranco and 0.2 or 0.5
lockBtn.Text = "🔓"
lockBtn.Font = Enum.Font.Gotham
lockBtn.TextSize = 14
lockBtn.TextColor3 = isBranco and corTextoInvertido or Color3.fromRGB(255, 255, 255)
lockBtn.ZIndex = 5
Instance.new("UICorner", lockBtn).CornerRadius = UDim.new(0, 9)

VH.MainGui = voidHubMain
VH.MainStroke = mainStroke
VH.MainTitle = mainTitle
VH.SubTitle = subTitle
VH.MainBg = mainBg
VH.KeyContainer = keyContainer
VH.KeyStroke = keyStroke
VH.KeyTitle = titleKey
VH.KeyBg = keyBg
VH.ValidateBtn = validateBtn
VH.TextBox = textBox
VH.MinimizeBtn = minimizeBtn
VH.LockBtn = lockBtn

-- ==================== PARTE 2: FUNÇÕES ====================
local bodyContainer = Instance.new("Frame", voidHubMain)
bodyContainer.Name = "BodyContainer"
bodyContainer.Size = UDim2.new(1, 0, 1, -55)
bodyContainer.Position = UDim2.new(0, 0, 0, 55)
bodyContainer.BackgroundTransparency = 1
bodyContainer.ClipsDescendants = true
bodyContainer.ZIndex = 3

local tabBar = Instance.new("Frame", bodyContainer)
tabBar.Size = UDim2.new(1, -20, 0, 28)
tabBar.Position = UDim2.new(0, 10, 0, 5)
tabBar.BackgroundTransparency = 1
tabBar.ZIndex = 5
local tabLayout = Instance.new("UIListLayout", tabBar)
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.Padding = UDim.new(0, 5)

local function createTab(name, order)
    local t = Instance.new("TextButton", tabBar)
    t.Size = UDim2.new(0, 108, 0, 28)
    t.BackgroundColor3 = Color3.fromRGB(20, 15, 30)
    t.BackgroundTransparency = 0.4
    t.Text = name
    t.Font = Enum.Font.GothamBold
    t.TextSize = 12
    t.TextColor3 = Color3.fromRGB(200, 180, 230)
    t.AutoButtonColor = false
    t.LayoutOrder = order
    t.ZIndex = 6
    Instance.new("UICorner", t).CornerRadius = UDim.new(0, 8)
    local st = Instance.new("UIStroke", t)
    st.Color = Color3.fromRGB(160, 110, 210)
    st.Thickness = 1.2
    st.Transparency = 0.25
    return t
end

local tabPrincipal = createTab("Principal", 1)
local tabExtras = createTab("Extras", 2)
local tabScripts = createTab("Scripts", 3)

local function setTabActive(tab, active)
    if active then
        tab.TextColor3 = isBranco and corTextoInvertido or Color3.fromRGB(255, 255, 255)
        TweenService:Create(tab, TweenInfo.new(0.2), {BackgroundColor3 = VH.CorAtual.cor, BackgroundTransparency = 0.15}):Play()
    else
        tab.TextColor3 = Color3.fromRGB(200, 180, 230)
        TweenService:Create(tab, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(20, 15, 30), BackgroundTransparency = 0.4}):Play()
    end
end
setTabActive(tabPrincipal, true)

local statusFrame = Instance.new("Frame", bodyContainer)
statusFrame.Size = UDim2.new(0, 300, 0, 24)
statusFrame.Position = UDim2.new(0.5, -150, 0, 38)
statusFrame.BackgroundColor3 = Color3.fromRGB(15, 10, 25)
statusFrame.BackgroundTransparency = 0.6
statusFrame.ZIndex = 3
Instance.new("UICorner", statusFrame).CornerRadius = UDim.new(0, 7)

local statusLabel = Instance.new("TextLabel", statusFrame)
statusLabel.Size = UDim2.new(1, -10, 1, 0)
statusLabel.Position = UDim2.new(0, 5, 0, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Status: Nada ativo"
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 11
statusLabel.TextColor3 = Color3.fromRGB(190, 170, 220)
statusLabel.ZIndex = 4

local contentArea = Instance.new("ScrollingFrame", bodyContainer)
contentArea.Size = UDim2.new(1, -20, 1, -80)
contentArea.Position = UDim2.new(0, 10, 0, 72)
contentArea.BackgroundTransparency = 1
contentArea.CanvasSize = UDim2.new(0, 0, 0, 600)
contentArea.ScrollBarThickness = 3
contentArea.ZIndex = 4

local extrasArea = Instance.new("ScrollingFrame", bodyContainer)
extrasArea.Size = UDim2.new(1, -20, 1, -80)
extrasArea.Position = UDim2.new(0, 10, 0, 72)
extrasArea.BackgroundTransparency = 1
extrasArea.CanvasSize = UDim2.new(0, 0, 0, 500)
extrasArea.ScrollBarThickness = 3
extrasArea.Visible = false
extrasArea.ZIndex = 4

local scriptsArea = Instance.new("ScrollingFrame", bodyContainer)
scriptsArea.Size = UDim2.new(1, -20, 1, -80)
scriptsArea.Position = UDim2.new(0, 10, 0, 72)
scriptsArea.BackgroundTransparency = 1
scriptsArea.CanvasSize = UDim2.new(0, 0, 0, 400)
scriptsArea.ScrollBarThickness = 3
scriptsArea.Visible = false
scriptsArea.ZIndex = 4

tabPrincipal.MouseButton1Click:Connect(function()
    contentArea.Visible = true; extrasArea.Visible = false; scriptsArea.Visible = false
    setTabActive(tabPrincipal, true); setTabActive(tabExtras, false); setTabActive(tabScripts, false)
end)
tabExtras.MouseButton1Click:Connect(function()
    contentArea.Visible = false; extrasArea.Visible = true; scriptsArea.Visible = false
    setTabActive(tabPrincipal, false); setTabActive(tabExtras, true); setTabActive(tabScripts, false)
end)
tabScripts.MouseButton1Click:Connect(function()
    contentArea.Visible = false; extrasArea.Visible = false; scriptsArea.Visible = true
    setTabActive(tabPrincipal, false); setTabActive(tabExtras, false); setTabActive(tabScripts, true)
end)

local function createButton(parent, name, label, yPos)
    local btn = Instance.new("TextButton", parent)
    btn.Name = name
    btn.Size = UDim2.new(1, -10, 0, 36)
    btn.Position = UDim2.new(0, 5, 0, yPos)
    btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    btn.BackgroundTransparency = 1
    btn.Text = label
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    btn.TextColor3 = Color3.fromRGB(240, 240, 240)
    btn.AutoButtonColor = false
    btn.ZIndex = 5
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
    local st = Instance.new("UIStroke", btn)
    st.Color = Color3.fromRGB(160, 110, 210)
    st.Thickness = 1.2
    st.Transparency = 0.25
    return btn, st
end

local activeFunction = nil
local deactivateFuncs = {}
local buttonRefs = {}

local function handleToggle(name, btn, activateFn, deactivateFn)
    if activeFunction == name then
        if deactivateFn then pcall(deactivateFn) end
        btn.BackgroundTransparency = 1
        activeFunction = nil
        statusLabel.Text = "Status: Nada ativo"
    else
        if activeFunction then
            local prevD = deactivateFuncs[activeFunction]
            if prevD then pcall(prevD) end
            local prevB = buttonRefs[activeFunction]
            if prevB then prevB.BackgroundTransparency = 1 end
        end
        deactivateFuncs[name] = deactivateFn
        buttonRefs[name] = btn
        activateFn()
        btn.BackgroundTransparency = 0.55
        activeFunction = name
        statusLabel.Text = "Status: " .. name .. " ativo"
    end
end

-- ===== KILL ALL ORIGINAL =====
local killAllActive = false
local killAllConn = nil

local function killAllOn()
    killAllActive = true
    statusLabel.Text = "Status: Kill All ATIVO ☠"
    killAllConn = task.spawn(function()
        while killAllActive do
            local char = LocalPlayer.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            if root then
                for _, p in ipairs(Players:GetPlayers()) do
                    if not killAllActive then break end
                    if p ~= LocalPlayer and p.Character then
                        local tr = p.Character:FindFirstChild("HumanoidRootPart")
                        local hum = p.Character:FindFirstChildOfClass("Humanoid")
                        if tr and hum and hum.Health > 0 then
                            root.CFrame = tr.CFrame
                            RunService.Heartbeat:Wait()
                        end
                    end
                end
            end
            RunService.Heartbeat:Wait()
        end
    end)
end

local function killAllOff()
    killAllActive = false
    if killAllConn then task.cancel(killAllConn); killAllConn = nil end
    statusLabel.Text = "Status: Nada ativo"
end

-- ===== FLY =====
local flyActive, flyGui, flyBV = false, nil, nil
local flyDirection = Vector3.zero
local VELOCIDADE_FLY = 250

local function flyOn()
    flyActive = true
    flyGui = Instance.new("ScreenGui", CoreGui)
    flyGui.Name = "VoidFlyGui"; flyGui.ResetOnSpawn = false
    local function criarBotaoFly(parent, txt, pos, setDir)
        local b = Instance.new("TextButton", parent)
        b.Size = UDim2.new(0, 45, 0, 45); b.Position = pos
        b.BackgroundColor3 = Color3.fromRGB(20, 15, 30); b.BackgroundTransparency = 0.4
        b.Text = txt; b.TextColor3 = Color3.fromRGB(255,255,255); b.TextSize = 18
        b.Font = Enum.Font.GothamBold; b.AutoButtonColor = false; b.ZIndex = 100
        Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
        local st = Instance.new("UIStroke", b); st.Color = VH.CorAtual.cor; st.Thickness = 1.5
        b.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                flyDirection = setDir
            end
        end)
        b.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                flyDirection = Vector3.zero
            end
        end)
    end
    local leftPanel = Instance.new("Frame", flyGui)
    leftPanel.Size = UDim2.new(0, 150, 0, 150); leftPanel.Position = UDim2.new(0, 20, 0.55, 0)
    leftPanel.BackgroundTransparency = 1
    criarBotaoFly(leftPanel, "▲", UDim2.new(0.5, -22, 0, 0), Vector3.new(0,0,-1))
    criarBotaoFly(leftPanel, "◄", UDim2.new(0, 0, 0.5, -22), Vector3.new(-1,0,0))
    criarBotaoFly(leftPanel, "►", UDim2.new(1, -45, 0.5, -22), Vector3.new(1,0,0))
    criarBotaoFly(leftPanel, "▼", UDim2.new(0.5, -22, 1, -45), Vector3.new(0,0,1))
    local rightPanel = Instance.new("Frame", flyGui)
    rightPanel.Size = UDim2.new(0, 45, 0, 100); rightPanel.Position = UDim2.new(1, -65, 0.55, 0)
    rightPanel.BackgroundTransparency = 1
    criarBotaoFly(rightPanel, "⬆", UDim2.new(0, 0, 0, 0), Vector3.new(0,1,0))
    criarBotaoFly(rightPanel, "⬇", UDim2.new(0, 0, 1, -45), Vector3.new(0,-1,0))
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if hrp then
        flyBV = Instance.new("BodyVelocity")
        flyBV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        flyBV.Velocity = Vector3.zero
        flyBV.Parent = hrp
    end
    task.spawn(function()
        while flyActive do
            pcall(function()
                local c = LocalPlayer.Character
                local r = c and c:FindFirstChild("HumanoidRootPart")
                local cam = workspace.CurrentCamera
                if r and flyBV and flyBV.Parent then
                    local vel = Vector3.zero
                    if flyDirection.Magnitude > 0 then
                        if flyDirection.Y ~= 0 then vel = flyDirection * VELOCIDADE_FLY
                        else vel = (cam.CFrame.LookVector * -flyDirection.Z + cam.CFrame.RightVector * flyDirection.X) * VELOCIDADE_FLY end
                    end
                    flyBV.Velocity = vel
                end
            end)
            task.wait()
        end
    end)
end

local function flyOff()
    flyActive = false
    if flyGui then flyGui:Destroy() flyGui = nil end
    if flyBV then flyBV:Destroy() flyBV = nil end
    flyDirection = Vector3.zero
end

-- ===== BYPASS ORIGINAL (IR PRO VOID) =====
local bypassActive = false

local function runBypassLogic()
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hum or not hrp then return end
    local colisoes = {}
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then colisoes[part] = part.CanCollide; part.CanCollide = false end
    end
    hum.PlatformStand = true
    local bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bv.P = 12500; bv.Velocity = Vector3.zero; bv.Parent = hrp
    local bg = Instance.new("BodyGyro")
    bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    bg.P = 3000; bg.CFrame = hrp.CFrame; bg.Parent = hrp
    local posInicial = hrp.Position
    local params = RaycastParams.new()
    params.FilterDescendantsInstances = {char}
    params.FilterType = Enum.RaycastFilterType.Exclude
    local dirs = {Vector3.new(1,0,0), Vector3.new(-1,0,0), Vector3.new(0,0,1), Vector3.new(0,0,-1)}
    local menores = {}
    for _, dir in ipairs(dirs) do
        local result = workspace:Raycast(posInicial, dir * 5000, params)
        local dist = result and result.Distance or 5000
        table.insert(menores, {dist = dist, dir = dir})
    end
    table.sort(menores, function(a,b) return a.dist < b.dist end)
    local melhorDir = menores[1].dir
    local startTime = tick()
    while hrp.Position.Y < 1500 and tick() - startTime < 8 and bypassActive do
        bv.Velocity = Vector3.new(0, 600, 0)
        hrp.AssemblyLinearVelocity = Vector3.zero; hrp.AssemblyAngularVelocity = Vector3.zero
        RunService.RenderStepped:Wait()
    end
    local targetForward = posInicial + (melhorDir * 2000)
    local t2 = tick()
    while tick() - t2 < 4 and bypassActive do
        local diff = targetForward - hrp.Position
        local diffH = Vector3.new(diff.X, 0, diff.Z)
        if diffH.Magnitude < 20 then break end
        bv.Velocity = diffH.Unit * 800
        hrp.AssemblyLinearVelocity = Vector3.zero; hrp.AssemblyAngularVelocity = Vector3.zero
        RunService.RenderStepped:Wait()
    end
    if bv then bv:Destroy() end
    if bg then bg:Destroy() end
    hum.PlatformStand = false
    hrp.AssemblyLinearVelocity = Vector3.new(0, -500, 0)
    task.delay(4, function()
        if char and char.Parent then
            for part, col in pairs(colisoes) do
                if part.Parent then part.CanCollide = col end
            end
        end
    end)
end

local btnKillAll_Ref

local function atualizarBotoesBloqueados()
    if VH.BypassConcluido then
        if btnKillAll_Ref then btnKillAll_Ref.Text = "☠  Kill All" end
    else
        if btnKillAll_Ref then btnKillAll_Ref.Text = "🔒 Faça o bypass primeiro" end
    end
end

local function unlockBypass()
    if not VH.BypassConcluido then
        VH.BypassConcluido = true
        atualizarBotoesBloqueados()
        statusLabel.Text = "Status: Opções desbloqueadas! ✅"
        task.wait(2)
        statusLabel.Text = "Status: Nada ativo"
    else
        statusLabel.Text = "Status: Bypass já liberado ✅"
        task.wait(2)
        statusLabel.Text = "Status: Nada ativo"
    end
end

local function bypassOn()
    if VH.BypassConcluido then
        statusLabel.Text = "Status: Bypass já liberado ✅"
        task.wait(2)
        statusLabel.Text = "Status: Nada ativo"
        return
    end

    bypassActive = true
    task.spawn(function()
        statusLabel.Text = "Status: Executando Bypass..."
        runBypassLogic()
        bypassActive = false
        
        statusLabel.Text = "Status: Bypass executado. Use 'Testar Bypass'!"
        task.wait(3)
        statusLabel.Text = "Status: Nada ativo"

        if buttonRefs["Bypass"] then buttonRefs["Bypass"].BackgroundTransparency = 1 end
        if activeFunction == "Bypass" then activeFunction = nil end
    end)
end
local function bypassOff() bypassActive = false end

-- ===== TESTAR BYPASS ORIGINAL (TP E CHECAGEM DE ANTI-CHEAT) =====
local function testarBypass()
    if VH.BypassConcluido then
        statusLabel.Text = "Status: Bypass já liberado ✅"
        task.wait(2)
        statusLabel.Text = "Status: Nada ativo"
        return
    end

    local alvos = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local hrp = p.Character:FindFirstChild("HumanoidRootPart")
            local hum = p.Character:FindFirstChildOfClass("Humanoid")
            if hrp and hum and hum.Health > 0 then table.insert(alvos, {hrp = hrp, player = p}) end
        end
    end

    if #alvos == 0 then
        statusLabel.Text = "Status: ❌ Nenhum player para testar."
        task.wait(2)
        statusLabel.Text = "Status: Nada ativo"
        return
    end

    local alvo = alvos[math.random(1, #alvos)]
    statusLabel.Text = "Status: 🎯 TP p/ " .. alvo.player.Name
    
    local myHrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not myHrp then return end

    local destPos = alvo.hrp.Position
    myHrp.CFrame = CFrame.new(destPos)

    local falhou = false
    for i = 1, 30 do
        task.wait(0.1)
        local c = LocalPlayer.Character
        local cHrp = c and c:FindFirstChild("HumanoidRootPart")
        
        if not cHrp then
            falhou = true
            break
        end

        local distFromDest = (cHrp.Position - destPos).Magnitude
        if distFromDest > 60 then
            falhou = true
            break
        end
    end

    if falhou then
        statusLabel.Text = "Status: ❌ Anti-cheat puxou você de volta."
        task.wait(2)
        statusLabel.Text = "Status: Nada ativo"
    else
        unlockBypass()
    end
end

-- ===== SERVER HOP =====
local function trocarServidor()
    statusLabel.Text = "Status: Procurando servidor..."
    task.spawn(function()
        local success, result = pcall(function()
            return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100"))
        end)
        if success and result and result.data then
            local cands = {}
            for _, server in ipairs(result.data) do
                if server.id ~= game.JobId and server.playing < server.maxPlayers and server.playing >= 3 then
                    local r = server.playing / server.maxPlayers
                    if r >= 0.25 and r <= 0.75 then table.insert(cands, server) end
                end
            end
            table.sort(cands, function(a,b)
                local ra = a.playing/a.maxPlayers
                local rb = b.playing/b.maxPlayers
                return math.abs(ra-0.5) < math.abs(rb-0.5)
            end)
            for _, server in ipairs(cands) do
                pcall(function() TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, LocalPlayer) end)
                return
            end
        end
        pcall(function() TeleportService:Teleport(game.PlaceId, LocalPlayer) end)
    end)
end

local function mostrarConfirmacaoServerHop()
    local confirmGui = Instance.new("ScreenGui", CoreGui)
    confirmGui.Name = "VoidServerHopConfirm"; confirmGui.ResetOnSpawn = false
    confirmGui.DisplayOrder = 999; confirmGui.IgnoreGuiInset = true

    local overlay = Instance.new("TextButton", confirmGui)
    overlay.Size = UDim2.new(1, 0, 1, 0)
    overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    overlay.BackgroundTransparency = 1
    overlay.Text = ""

    local box = Instance.new("Frame", confirmGui)
    box.Size = UDim2.new(0, 340, 0, 190)
    box.Position = UDim2.new(0.5, -170, 0.5, -95)
    box.BackgroundColor3 = voidHubMain.BackgroundColor3
    box.BackgroundTransparency = voidHubMain.BackgroundTransparency
    box.ClipsDescendants = true
    box.ZIndex = 5
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 18)

    local boxBg = Instance.new("ImageLabel", box)
    boxBg.Size = UDim2.new(1, 0, 1, 0)
    boxBg.BackgroundTransparency = 1
    boxBg.Image = VH.MainBg.Image
    boxBg.ScaleType = Enum.ScaleType.Crop
    boxBg.ImageTransparency = mainBg.ImageTransparency
    boxBg.ZIndex = 0
    Instance.new("UICorner", boxBg).CornerRadius = UDim.new(0, 18)

    local boxStroke = Instance.new("UIStroke", box)
    boxStroke.Color = VH.CorAtual.cor
    boxStroke.Thickness = 2.5

    local title = Instance.new("TextLabel", box)
    title.Size = UDim2.new(1, -20, 0, 26); title.Position = UDim2.new(0, 10, 0, 18)
    title.BackgroundTransparency = 1; title.Text = "⚠️ Trocar de Servidor?"
    title.TextColor3 = isBranco and corTextoInvertido or Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 21; title.ZIndex = 2
    title.TextStrokeTransparency = isBranco and 1 or 0
    title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

    local desc = Instance.new("TextLabel", box)
    desc.Size = UDim2.new(1, -30, 0, 50); desc.Position = UDim2.new(0, 15, 0, 55)
    desc.BackgroundTransparency = 1
    desc.Text = "Você realmente deseja trocar de servidor?\nSua ULT será resetada!"
    desc.TextColor3 = isBranco and corTextoInvertido or Color3.fromRGB(245, 240, 255)
    desc.Font = Enum.Font.GothamBold
    desc.TextSize = 14; desc.TextWrapped = true; desc.ZIndex = 2
    desc.TextStrokeTransparency = isBranco and 1 or 0
    desc.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

    local btnSim = Instance.new("TextButton", box)
    btnSim.Size = UDim2.new(0, 130, 0, 42); btnSim.Position = UDim2.new(0, 25, 1, -58)
    btnSim.BackgroundColor3 = Color3.fromRGB(40, 160, 80); btnSim.Text = "✅ Confirmar"
    btnSim.TextColor3 = Color3.fromRGB(255, 255, 255); btnSim.Font = Enum.Font.GothamBold
    btnSim.TextSize = 15; btnSim.TextStrokeTransparency = 0; Instance.new("UICorner", btnSim).CornerRadius = UDim.new(0, 10)
    btnSim.ZIndex = 2
    local simStroke = Instance.new("UIStroke", btnSim); simStroke.Color = Color3.fromRGB(120, 255, 160); simStroke.Thickness = 1.5

    local btnNao = Instance.new("TextButton", box)
    btnNao.Size = UDim2.new(0, 130, 0, 42); btnNao.Position = UDim2.new(1, -155, 1, -58)
    btnNao.BackgroundColor3 = Color3.fromRGB(160, 40, 40); btnNao.Text = "❌ Cancelar"
    btnNao.TextColor3 = Color3.fromRGB(255, 255, 255); btnNao.Font = Enum.Font.GothamBold
    btnNao.TextSize = 15; btnNao.TextStrokeTransparency = 0; Instance.new("UICorner", btnNao).CornerRadius = UDim.new(0, 10)
    btnNao.ZIndex = 2
    local naoStroke = Instance.new("UIStroke", btnNao); naoStroke.Color = Color3.fromRGB(255, 120, 120); naoStroke.Thickness = 1.5

    local function fechar() confirmGui:Destroy() end
    btnSim.MouseButton1Click:Connect(function() fechar(); task.wait(0.2); trocarServidor() end)
    btnNao.MouseButton1Click:Connect(function() fechar(); statusLabel.Text = "Status: Nada ativo" end)
    overlay.MouseButton1Click:Connect(fechar)
end

-- ===== BOTÕES PRINCIPAIS =====
local btnKillAll = createButton(contentArea, "KillAll", "🔒 Faça o bypass primeiro", 5)
btnKillAll_Ref = btnKillAll
btnKillAll.MouseButton1Click:Connect(function()
    if not VH.BypassConcluido then
        statusLabel.Text = "Status: ❌ Use 'Testar Bypass' primeiro!"
        task.wait(2)
        statusLabel.Text = "Status: Nada ativo"
        return
    end
    handleToggle("KillAll", btnKillAll, killAllOn, killAllOff)
end)

local btnFly = createButton(contentArea, "Fly", "🛫  Fly com Botões", 48)
btnFly.MouseButton1Click:Connect(function()
    handleToggle("Fly", btnFly, flyOn, flyOff)
end)

local btnBypass = createButton(contentArea, "Bypass", "🛡  Bypass Void", 91)
btnBypass.MouseButton1Click:Connect(function()
    if VH.BypassConcluido then
        statusLabel.Text = "Status: Bypass já liberado ✅"
        task.wait(2)
        statusLabel.Text = "Status: Nada ativo"
        return
    end
    handleToggle("Bypass", btnBypass, bypassOn, bypassOff)
end)

local btnTestBypass = createButton(contentArea, "TesteBypass", "🔄  Testar Bypass (Único que libera)", 134)
btnTestBypass.MouseButton1Click:Connect(function()
    if VH.BypassConcluido then
        statusLabel.Text = "Status: Bypass já liberado ✅"
        task.wait(2)
        statusLabel.Text = "Status: Nada ativo"
        return
    end
    btnTestBypass.BackgroundTransparency = 0.55
    testarBypass()
    btnTestBypass.BackgroundTransparency = 1
end)

local btnServerHop = createButton(contentArea, "ServerHop", "🌐  Server Hop", 177)
btnServerHop.MouseButton1Click:Connect(function()
    mostrarConfirmacaoServerHop()
end)

atualizarBotoesBloqueados()

-- ==================== PARTE 3: EXTRAS ====================
local espJogadoresActive = false
local function espJogadoresOn()
    espJogadoresActive = true
    task.spawn(function()
        while espJogadoresActive do
            pcall(function()
                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and not player.Character:FindFirstChild("PurpleHighlight") then
                        local hl = Instance.new("Highlight", player.Character)
                        hl.Name = "PurpleHighlight"
                        hl.FillColor = VH.CorAtual.cor
                        hl.OutlineColor = Color3.fromRGB(255,255,255)
                    end
                end
            end)
            task.wait(1)
        end
    end)
end
local function espJogadoresOff()
    espJogadoresActive = false
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character then
            local hl = player.Character:FindFirstChild("PurpleHighlight")
            if hl then hl:Destroy() end
        end
    end
end

local espDummyActive = false
local function espDummyOn()
    espDummyActive = true
    task.spawn(function()
        while espDummyActive do
            pcall(function()
                for _, obj in ipairs(workspace:GetDescendants()) do
                    if VH.ehDummy(obj) and not obj:FindFirstChild("DummyHighlight") then
                        local hl = Instance.new("Highlight", obj)
                        hl.Name = "DummyHighlight"
                        local opColor = Color3.new(1 - VH.CorAtual.cor.R, 1 - VH.CorAtual.cor.G, 1 - VH.CorAtual.cor.B)
                        hl.FillColor = opColor
                        hl.OutlineColor = Color3.fromRGB(255,255,255)
                    end
                end
            end)
            task.wait(2)
        end
    end)
end
local function espDummyOff()
    espDummyActive = false
    pcall(function()
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("Highlight") and obj.Name == "DummyHighlight" then obj:Destroy() end
        end
    end)
end

local espDomainActive = false
local espDomainGui, espDomainTxt
local function temDominioNoMapa()
    local pad = {"domain", "dominio", "shrine", "expansion", "void", "malevolent", "unlimited", "coffin", "chimera", "idle death", "horizon"}
    for _, obj in ipairs(workspace:GetChildren()) do
        local n = string.lower(obj.Name)
        for _, p in ipairs(pad) do
            if string.find(n, p) then
                if obj:IsA("Model") or (obj:IsA("BasePart") and obj.Size.Magnitude > 20) then
                    return true 
                end
            end
        end
    end
    return false
end

local function espDomainOn()
    espDomainActive = true
    espDomainGui = Instance.new("ScreenGui", CoreGui)
    espDomainGui.Name = "VoidEspDomain"; espDomainGui.ResetOnSpawn = false
    local f = Instance.new("Frame", espDomainGui)
    f.Size = UDim2.new(0, 200, 0, 34); f.Position = UDim2.new(0.02, 0, 0.15, 0)
    f.BackgroundColor3 = Color3.fromRGB(15, 10, 25); f.BackgroundTransparency = 0.3
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 10)
    local fs = Instance.new("UIStroke", f); fs.Color = VH.CorAtual.cor; fs.Thickness = 2
    espDomainTxt = Instance.new("TextLabel", f)
    espDomainTxt.Size = UDim2.new(1, -10, 1, 0); espDomainTxt.Position = UDim2.new(0, 5, 0, 0)
    espDomainTxt.BackgroundTransparency = 1; espDomainTxt.Text = "ESP Domain: OFF"
    espDomainTxt.TextColor3 = Color3.fromRGB(80,255,120); espDomainTxt.Font = Enum.Font.GothamBold
    espDomainTxt.TextSize = 13
    
    task.spawn(function()
        while espDomainActive and espDomainGui and espDomainGui.Parent do
            pcall(function()
                if temDominioNoMapa() then
                    espDomainTxt.Text = "ESP Domain: ON" 
                    espDomainTxt.TextColor3 = Color3.fromRGB(255,80,80)
                else
                    espDomainTxt.Text = "ESP Domain: OFF" 
                    espDomainTxt.TextColor3 = Color3.fromRGB(80,255,120)
                end
            end)
            task.wait(3)
        end
    end)
end
local function espDomainOff()
    espDomainActive = false
    if espDomainGui then espDomainGui:Destroy() espDomainGui = nil end
    espDomainTxt = nil
end

local fpsActive = false
local function fpsOn()
    fpsActive = true
    task.spawn(function()
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level05
            Lighting.GlobalShadows = false
            Lighting.FogEnd = 999999
            Lighting.Brightness = 2
            for _, v in ipairs(Lighting:GetChildren()) do
                if v:IsA("PostEffect") or v:IsA("Atmosphere") or v:IsA("Sky") then v.Enabled = false end
            end
        end)
    end)
end
local function fpsOff() fpsActive = false end

local panelGui = nil
local function panelOn()
    panelGui = Instance.new("ScreenGui", CoreGui)
    panelGui.Name = "VoidFpsPingPanel"; panelGui.ResetOnSpawn = false
    local f = Instance.new("Frame", panelGui)
    f.Size = UDim2.new(0, 160, 0, 70)
    f.Position = UDim2.new(0, 15, 0, 15)
    f.BackgroundColor3 = Color3.fromRGB(15, 10, 25); f.BackgroundTransparency = 0.3
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 12)
    local fs = Instance.new("UIStroke", f); fs.Color = VH.CorAtual.cor; fs.Thickness = 2
    local txt = Instance.new("TextLabel", f)
    txt.Size = UDim2.new(1, 0, 1, 0); txt.BackgroundTransparency = 1
    txt.TextColor3 = Color3.fromRGB(255,255,255); txt.Font = Enum.Font.GothamBold; txt.TextSize = 12
    task.spawn(function()
        while panelGui and f.Parent do
            local fps = math.floor(1 / RunService.RenderStepped:Wait())
            local ping = 0
            pcall(function() ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue()) end)
            txt.Text = string.format(" FPS: %d\n Ping: %d ms\n Players: %d", fps, ping, #Players:GetPlayers())
            task.wait(1)
        end
    end)
end
local function panelOff()
    if panelGui then panelGui:Destroy() panelGui = nil end
end

local btnEspJogadores = createButton(extrasArea, "EspJogadores", "👁  ESP Jogadores", 5)
btnEspJogadores.MouseButton1Click:Connect(function()
    if not espJogadoresActive then espJogadoresOn(); btnEspJogadores.BackgroundTransparency = 0.55
    else espJogadoresOff(); btnEspJogadores.BackgroundTransparency = 1 end
end)

local btnEspDummy = createButton(extrasArea, "EspDummy", "🎯  ESP Dummy", 48)
btnEspDummy.MouseButton1Click:Connect(function()
    if not espDummyActive then espDummyOn(); btnEspDummy.BackgroundTransparency = 0.55
    else espDummyOff(); btnEspDummy.BackgroundTransparency = 1 end
end)

local btnEspDomain = createButton(extrasArea, "EspDomain", "👁  ESP Domain", 91)
btnEspDomain.MouseButton1Click:Connect(function()
    if not espDomainActive then espDomainOn(); btnEspDomain.BackgroundTransparency = 0.55
    else espDomainOff(); btnEspDomain.BackgroundTransparency = 1 end
end)

local btnFPS = createButton(extrasArea, "FPS", "🚀  FPS Booster", 134)
btnFPS.MouseButton1Click:Connect(function()
    if not fpsActive then fpsOn(); btnFPS.BackgroundTransparency = 0.55
    else fpsOff(); btnFPS.BackgroundTransparency = 1 end
end)

local btnPainel = createButton(extrasArea, "Painel", "📊  Painel FPS/Ping", 177)
btnPainel.MouseButton1Click:Connect(function()
    if not panelGui then panelOn(); btnPainel.BackgroundTransparency = 0.55
    else panelOff(); btnPainel.BackgroundTransparency = 1 end
end)

-- 🎨 CORES DO HUB
local btnCoresHub = createButton(extrasArea, "CoresHub", "🎨  Cores do Hub", 220)
btnCoresHub.MouseButton1Click:Connect(function()
    local picker = Instance.new("ScreenGui", CoreGui)
    picker.Name = "VoidColorPicker"; picker.ResetOnSpawn = false
    local f = Instance.new("Frame", picker)
    f.Size = UDim2.new(0, 280, 0, 200)
    f.Position = UDim2.new(0.5, -140, 0.5, -100)
    f.BackgroundColor3 = Color3.fromRGB(15, 10, 25); f.BackgroundTransparency = 0.1
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 16)
    local fs = Instance.new("UIStroke", f); fs.Color = VH.CorAtual.cor; fs.Thickness = 2

    local title = Instance.new("TextLabel", f)
    title.Size = UDim2.new(1, 0, 0, 25); title.Position = UDim2.new(0, 0, 0, 12)
    title.BackgroundTransparency = 1; title.Text = "🎨 Cor do Hub"
    title.Font = Enum.Font.GothamBold; title.TextSize = 14
    title.TextColor3 = Color3.fromRGB(255,255,255)

    local opcoes = {
        { cor = Color3.fromRGB(140, 40, 220), img = "rbxassetid://112459375607724" },
        { cor = Color3.fromRGB(40, 100, 240), img = "rbxassetid://102472450810637" },
        { cor = Color3.fromRGB(40, 220, 100), img = "rbxassetid://127946542596903" },
        { cor = Color3.fromRGB(220, 40, 40),  img = "rbxassetid://136888893575149" },
        { cor = Color3.fromRGB(240, 220, 40), img = "rbxassetid://71099604853241"  },
        { cor = Color3.fromRGB(220, 220, 220),img = "rbxassetid://123694908192472" },
        { cor = Color3.fromRGB(200, 200, 200),img = "rbxassetid://112459375607724", transparente = true },
    }

    for i, op in ipairs(opcoes) do
        local row = math.floor((i-1)/4)
        local col = (i-1)%4
        local b = Instance.new("TextButton", f)
        b.Size = UDim2.new(0, 58, 0, 58)
        b.Position = UDim2.new(0, 15 + col * 63, 0, 50 + row * 68)
        b.BackgroundColor3 = op.cor; b.Text = ""
        b.AutoButtonColor = false
        Instance.new("UICorner", b).CornerRadius = UDim.new(0, 10)
        local bs = Instance.new("UIStroke", b)
        bs.Color = Color3.fromRGB(255,255,255); bs.Thickness = 1.5; bs.Transparency = 0.5

        if op.transparente then
            local grad = Instance.new("UIGradient", b)
            grad.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.5, 0.3),
                NumberSequenceKeypoint.new(1, 0.8)
            })
            grad.Rotation = 45
        end

        b.MouseButton1Click:Connect(function()
            VH.CorAtual = op
            salvarConfig(op)

            VH.MainStroke.Color = op.cor
            VH.MainStroke.Transparency = 0
            if VH.KeyStroke then VH.KeyStroke.Color = op.cor; VH.KeyStroke.Transparency = 0 end
            VH.MainBg.Image = op.img
            if VH.KeyBg then VH.KeyBg.Image = op.img end

            local novoIsBranco = (op.cor == Color3.fromRGB(220, 220, 220) or op.cor == Color3.fromRGB(240, 240, 240))

            VH.MainTitle.TextColor3 = novoIsBranco and corTextoInvertido or Color3.fromRGB(255,255,255)
            if VH.KeyTitle then VH.KeyTitle.TextColor3 = novoIsBranco and corTextoInvertido or Color3.fromRGB(255,255,255) end
            VH.SubTitle.TextColor3 = novoIsBranco and corTextoInvertido or op.cor

            VH.MinimizeBtn.BackgroundColor3 = op.cor
            VH.MinimizeBtn.BackgroundTransparency = novoIsBranco and 0.2 or 0.5
            VH.MinimizeBtn.TextColor3 = novoIsBranco and corTextoInvertido or Color3.fromRGB(255, 255, 255)

            VH.LockBtn.BackgroundColor3 = op.cor
            VH.LockBtn.BackgroundTransparency = novoIsBranco and 0.2 or 0.5
            VH.LockBtn.TextColor3 = novoIsBranco and corTextoInvertido or Color3.fromRGB(255, 255, 255)

            if op.transparente then
                voidHubMain.BackgroundTransparency = 0.95
                mainBg.ImageTransparency = 0.95
                if keyContainer and keyContainer.Parent then
                    keyContainer.BackgroundTransparency = 0.95
                    keyBg.ImageTransparency = 0.95
                end
            else
                voidHubMain.BackgroundTransparency = 0.6
                mainBg.ImageTransparency = 0
                if keyContainer and keyContainer.Parent then
                    keyContainer.BackgroundTransparency = 0.3
                    keyBg.ImageTransparency = 0
                end
            end
            picker:Destroy()
        end)
    end

    local close = Instance.new("TextButton", f)
    close.Size = UDim2.new(0, 90, 0, 26); close.Position = UDim2.new(1, -100, 1, -34)
    close.BackgroundColor3 = Color3.fromRGB(60, 30, 30); close.Text = "Fechar"
    close.Font = Enum.Font.GothamBold; close.TextSize = 12
    close.TextColor3 = Color3.fromRGB(255,255,255)
    Instance.new("UICorner", close).CornerRadius = UDim.new(0, 7)
    close.MouseButton1Click:Connect(function() picker:Destroy() end)
end)

-- SCRIPTS
local scriptsList = {
    { "TBO", "🔥  TBO Script", "https://raw.githubusercontent.com/cool5013/TBO/main/TBOscript" },
    { "Kokusen", "⚡  Kokusen Chain", "https://raw.githubusercontent.com/ggab2351-stack/Jjs/refs/heads/main/obfuscated_script-1770002780541.lua.txt" },
    { "Kokusen2", "⚡  Kokusen 2", "https://raw.githubusercontent.com/dream77239/sss/refs/heads/main/yuji" },
    { "LockOn", "🎯  Lock On", "https://raw.githubusercontent.com/b17111326-hue/Lock-On/refs/heads/main/obfuscated_script-1786226030102.lua.txt" },
    { "Jujutsuer", "🔮  Jujutsuer V2", "https://raw.githubusercontent.com/solarastuff/tze/refs/heads/main/JujutsuerV2.lua" },
    { "Yuki", "🌀  Black Hole Yuki", "https://raw.githubusercontent.com/Dragonfly5101/Minosr/refs/heads/main/InstantBlackHole.JJS" },
}
for i, data in ipairs(scriptsList) do
    local btn = createButton(scriptsArea, data[1], data[2], 5 + (i-1) * 42)
    btn.MouseButton1Click:Connect(function()
        btn.BackgroundTransparency = 0.55
        statusLabel.Text = "Status: Executando " .. data[1] .. "..."
        pcall(function() loadstring(game:HttpGet(data[3]))() end)
        task.wait(0.5)
        btn.BackgroundTransparency = 1
    end)
end

-- DRAG / LOCK / MIN
local isLocked = false
local dragging = false
local dragStart, startPos

voidHubMain.InputBegan:Connect(function(input)
    if isLocked then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        local my = input.Position.Y
        local abs = voidHubMain.AbsolutePosition
        if my - abs.Y < 55 then
            dragging = true; dragStart = input.Position; startPos = voidHubMain.Position
        end
    end
end)
voidHubMain.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and not isLocked then
        local delta = input.Position - dragStart
        voidHubMain.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

lockBtn.MouseButton1Click:Connect(function()
    isLocked = not isLocked
    lockBtn.Text = isLocked and "🔒" or "🔓"
    if not isLocked then
        lockBtn.BackgroundColor3 = VH.CorAtual.cor
        lockBtn.TextColor3 = isBranco and corTextoInvertido or Color3.fromRGB(255, 255, 255)
    else
        lockBtn.BackgroundColor3 = Color3.fromRGB(120, 40, 40)
        lockBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
end)

local isMinimized = false
local fullHeight = 440
local minHeight = 55

minimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        bodyContainer.Visible = false
        TweenService:Create(voidHubMain, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 360, 0, minHeight)
        }):Play()
        minimizeBtn.Text = "+"
    else
        TweenService:Create(voidHubMain, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 360, 0, fullHeight)
        }):Play()
        task.wait(0.3)
        bodyContainer.Visible = true
        minimizeBtn.Text = "-"
    end
end)

-- ==================== LOADING SCREEN & KEY VALIDATION ====================
local function abrirTelaCarregamento()
    TweenService:Create(keyContainer, TweenInfo.new(0.3), {Size = UDim2.new(0,0,0,0)}):Play()
    task.wait(0.3)
    keyContainer:Destroy()

    local loadFrame = Instance.new("Frame", VH.Gui)
    loadFrame.Name = "LoadingFrame"
    loadFrame.Size = UDim2.new(0, 400, 0, 260)
    loadFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    loadFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    loadFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    loadFrame.BackgroundTransparency = 0.4
    loadFrame.ClipsDescendants = true
    Instance.new("UICorner", loadFrame).CornerRadius = UDim.new(0, 28)

    local loadBg = Instance.new("ImageLabel", loadFrame)
    loadBg.Size = UDim2.new(1, 0, 1, 0)
    loadBg.BackgroundTransparency = 1
    loadBg.Image = VH.CorAtual.img
    loadBg.ScaleType = Enum.ScaleType.Crop
    loadBg.ZIndex = 0
    Instance.new("UICorner", loadBg).CornerRadius = UDim.new(0, 28)

    local loadStroke = Instance.new("UIStroke", loadFrame)
    loadStroke.Color = VH.CorAtual.cor
    loadStroke.Thickness = 2.5
    loadStroke.Transparency = 0

    local avatar = Instance.new("ImageLabel", loadFrame)
    avatar.Size = UDim2.new(0, 80, 0, 80)
    avatar.Position = UDim2.new(0.5, 0, 0, 30)
    avatar.AnchorPoint = Vector2.new(0.5, 0)
    avatar.BackgroundColor3 = Color3.fromRGB(20, 15, 30)
    avatar.BorderSizePixel = 0
    avatar.ZIndex = 2
    Instance.new("UICorner", avatar).CornerRadius = UDim.new(1, 0)

    local avStroke = Instance.new("UIStroke", avatar)
    avStroke.Color = VH.CorAtual.cor
    avStroke.Thickness = 2

    task.spawn(function()
        local success, img = pcall(function()
            return Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
        end)
        if success and img then avatar.Image = img end
    end)

    local novoIsBranco = (VH.CorAtual.cor == Color3.fromRGB(220, 220, 220) or VH.CorAtual.cor == Color3.fromRGB(240, 240, 240))

    local nameLabel = Instance.new("TextLabel", loadFrame)
    nameLabel.Size = UDim2.new(1, 0, 0, 25)
    nameLabel.Position = UDim2.new(0, 0, 0, 120)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = LocalPlayer.DisplayName .. " (@" .. LocalPlayer.Name .. ")"
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextSize = 18
    nameLabel.TextColor3 = novoIsBranco and corTextoInvertido or Color3.fromRGB(255, 255, 255)
    nameLabel.ZIndex = 2

    local welcomeLabel = Instance.new("TextLabel", loadFrame)
    welcomeLabel.Size = UDim2.new(1, 0, 0, 20)
    welcomeLabel.Position = UDim2.new(0, 0, 0, 150)
    welcomeLabel.BackgroundTransparency = 1
    welcomeLabel.Text = "Seja bem vindo, " .. LocalPlayer.DisplayName .. "! Aproveite o Hub 🪐"
    welcomeLabel.Font = Enum.Font.Gotham
    welcomeLabel.TextSize = 13
    welcomeLabel.TextColor3 = novoIsBranco and corTextoInvertido or VH.NeonPurple
    welcomeLabel.ZIndex = 2

    local barBg = Instance.new("Frame", loadFrame)
    barBg.Size = UDim2.new(0, 300, 0, 8)
    barBg.Position = UDim2.new(0.5, -150, 0, 190)
    barBg.BackgroundColor3 = Color3.fromRGB(20, 15, 30)
    barBg.ZIndex = 2
    Instance.new("UICorner", barBg).CornerRadius = UDim.new(1, 0)

    local barFill = Instance.new("Frame", barBg)
    barFill.Size = UDim2.new(0, 0, 1, 0)
    barFill.BackgroundColor3 = VH.CorAtual.cor
    barFill.ZIndex = 3
    Instance.new("UICorner", barFill).CornerRadius = UDim.new(1, 0)

    local tween = TweenService:Create(barFill, TweenInfo.new(2.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 1, 0)})
    tween:Play()

    tween.Completed:Connect(function()
        task.wait(0.3)
        loadFrame:Destroy()
        voidHubMain.Visible = true
    end)
end

validateBtn.MouseButton1Click:Connect(function()
    if textBox.Text == VH.DeviceKey then
        abrirTelaCarregamento()
    else
        validateBtn.Text = "Incorreta!"
        task.wait(1.5)
        validateBtn.Text = "Verificar"
    end
end)

print("Void Hub completo e Corrigido (V33) 🪐")
