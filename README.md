#-- BYPASS LEVE
pcall(function()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Script") and (string.find(string.lower(v.Name), "anti") or string.find(string.lower(v.Name), "detect")) then
            v.Disabled = true
        end
    end
    _G.antiban = true
    _G.bypass = true
    _G.allowTeleport = true
    spawn(function()
        while wait(2) do
            _G.antiban = true
            _G.bypass = true
            _G.allowTeleport = true
        end
    end)
end)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer
local TargetParent = (gethui and gethui()) or CoreGui
if TargetParent:FindFirstChild("VoidHubGui") then TargetParent.VoidHubGui:Destroy() end

local CORRECT_KEY = "Void"
local isLocked = false
local isMinimized = false
local gojoActive = false
local flyActive = false

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "VoidHubGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = TargetParent

-- CONTADOR DE FPS
local FpsFrame = Instance.new("Frame")
FpsFrame.Name = "FpsFrame"
FpsFrame.Size = UDim2.new(0, 100, 0, 30)
FpsFrame.Position = UDim2.new(0, 15, 0, 15)
FpsFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
FpsFrame.BorderSizePixel = 0
FpsFrame.Parent = ScreenGui

local FpsCorner = Instance.new("UICorner")
FpsCorner.CornerRadius = UDim.new(0, 8)
FpsCorner.Parent = FpsFrame

local FpsStroke = Instance.new("UIStroke")
FpsStroke.Color = Color3.fromRGB(138, 43, 226)
FpsStroke.Thickness = 1.5
FpsStroke.Parent = FpsFrame

local FpsLabel = Instance.new("TextLabel")
FpsLabel.Size = UDim2.new(1, 0, 1, 0)
FpsLabel.BackgroundTransparency = 1
FpsLabel.Text = "FPS: 60"
FpsLabel.TextColor3 = Color3.fromRGB(190, 140, 255)
FpsLabel.TextSize = 13
FpsLabel.Font = Enum.Font.GothamBold
FpsLabel.Parent = FpsFrame

local frameCount = 0
local lastUpdate = tick()

RunService.RenderStepped:Connect(function()
    frameCount = frameCount + 1
    local now = tick()
    if now - lastUpdate >= 1 then
        local fps = math.floor(frameCount / (now - lastUpdate))
        FpsLabel.Text = "FPS: " .. tostring(fps)
        frameCount = 0
        lastUpdate = now
    end
end)

-- SISTEMA DE KEY
local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0, 360, 0, 240)
KeyFrame.Position = UDim2.new(0.5, -180, 0.5, -120)
KeyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
KeyFrame.BorderSizePixel = 0
KeyFrame.ClipsDescendants = true
KeyFrame.Parent = ScreenGui

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 12)
KeyCorner.Parent = KeyFrame

local KeyStroke = Instance.new("UIStroke")
KeyStroke.Color = Color3.fromRGB(138, 43, 226)
KeyStroke.Thickness = 2
KeyStroke.Parent = KeyFrame

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Size = UDim2.new(1, 0, 0, 40)
KeyTitle.Position = UDim2.new(0, 0, 0, 10)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Text = "VOID HUB"
KeyTitle.TextColor3 = Color3.fromRGB(220, 220, 255)
KeyTitle.TextSize = 16
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.Parent = KeyFrame

local KeyInputBg = Instance.new("Frame")
KeyInputBg.Size = UDim2.new(0.85, 0, 0, 40)
KeyInputBg.Position = UDim2.new(0.075, 0, 0, 70)
KeyInputBg.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
KeyInputBg.BorderSizePixel = 0
KeyInputBg.Parent = KeyFrame

local KeyInputCorner = Instance.new("UICorner")
KeyInputCorner.CornerRadius = UDim.new(0, 8)
KeyInputCorner.Parent = KeyInputBg

local KeyTextBox = Instance.new("TextBox")
KeyTextBox.Size = UDim2.new(1, -20, 1, 0)
KeyTextBox.Position = UDim2.new(0, 10, 0, 0)
KeyTextBox.BackgroundTransparency = 1
KeyTextBox.Text = ""
KeyTextBox.PlaceholderText = "Cole a Key aqui..."
KeyTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTextBox.TextSize = 13
KeyTextBox.Font = Enum.Font.GothamSemibold
KeyTextBox.Parent = KeyInputBg

local VerifyBtn = Instance.new("TextButton")
VerifyBtn.Size = UDim2.new(0.85, 0, 0, 40)
VerifyBtn.Position = UDim2.new(0.075, 0, 0, 130)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
VerifyBtn.Text = "ENTRAR"
VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyBtn.TextSize = 14
VerifyBtn.Font = Enum.Font.GothamBold
VerifyBtn.Parent = KeyFrame

local VerifyCorner = Instance.new("UICorner")
VerifyCorner.CornerRadius = UDim.new(0, 8)
VerifyCorner.Parent = VerifyBtn

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, 0, 0, 20)
StatusLabel.Position = UDim2.new(0, 0, 0, 185)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = ""
StatusLabel.TextSize = 12
StatusLabel.Font = Enum.Font.GothamSemibold
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.Parent = KeyFrame

-- JANELA PRINCIPAL
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 360, 0, 240)
MainFrame.Position = UDim2.new(0.5, -180, 0.5, -120)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

local MainUICorner = Instance.new("UICorner")
MainUICorner.CornerRadius = UDim.new(0, 12)
MainUICorner.Parent = MainFrame

local MainUIStroke = Instance.new("UIStroke")
MainUIStroke.Color = Color3.fromRGB(138, 43, 226)
MainUIStroke.Thickness = 2
MainUIStroke.Parent = MainFrame

local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 12)
TopBarCorner.Parent = TopBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -90, 1, 0)
TitleLabel.Position = UDim2.new(0, 40, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "VOID HUB"
TitleLabel.TextColor3 = Color3.fromRGB(220, 220, 255)
TitleLabel.TextSize = 16
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TopBar

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Name = "MinimizeBtn"
MinimizeBtn.Size = UDim2.new(0, 30, 0, 30)
MinimizeBtn.Position = UDim2.new(0, 5, 0.5, -15)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
MinimizeBtn.Text = "-"
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.TextSize = 18
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.Parent = TopBar

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 8)
MinCorner.Parent = MinimizeBtn

local LockBtn = Instance.new("TextButton")
LockBtn.Name = "LockBtn"
LockBtn.Size = UDim2.new(0, 30, 0, 30)
LockBtn.Position = UDim2.new(1, -35, 0.5, -15)
LockBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
LockBtn.Text = "🔓"
LockBtn.TextSize = 14
LockBtn.Parent = TopBar

local LockCorner = Instance.new("UICorner")
LockCorner.CornerRadius = UDim.new(0, 8)
LockCorner.Parent = LockBtn

local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, -20, 1, -50)
ContentFrame.Position = UDim2.new(0, 10, 0, 45)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ContentFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)

local function CreateHubButton(name, text)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.TextSize = 14
    btn.Font = Enum.Font.GothamSemibold
    btn.Parent = ContentFrame
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(60, 60, 80)
    stroke.Thickness = 1
    stroke.Parent = btn
    return btn, stroke
end

local GojoBtn, GojoStroke = CreateHubButton("GojoBtn", "Gojo 0.2: [ OFF ]")
local FlyBtn, FlyStroke = CreateHubButton("FlyBtn", "Fly Mobile: [ OFF ]")

-- LÓGICA DA KEY
VerifyBtn.MouseButton1Click:Connect(function()
    if KeyTextBox.Text == CORRECT_KEY then
        StatusLabel.TextColor3 = Color3.fromRGB(100, 220, 120)
        StatusLabel.Text = "Acesso Concedido!"
        task.wait(0.4)
        KeyFrame:Destroy()
        MainFrame.Visible = true
    else
        StatusLabel.TextColor3 = Color3.fromRGB(240, 80, 80)
        StatusLabel.Text = "Key Incorreta!"
        task.wait(1.2)
        StatusLabel.Text = ""
    end
end)

-- DRAG
local dragging = false
local dragInput, dragStart, startPos

TopBar.InputBegan:Connect(function(input)
    if not isLocked and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TopBar.InputChanged:Connect(function(input)
    if not isLocked and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging and not isLocked then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

-- CADEADO E MINIMIZAR
LockBtn.MouseButton1Click:Connect(function()
    isLocked = not isLocked
    LockBtn.Text = isLocked and "🔒" or "🔓"
    LockBtn.BackgroundColor3 = isLocked and Color3.fromRGB(120, 40, 40) or Color3.fromRGB(45, 45, 60)
end)

MinimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        ContentFrame.Visible = false
        MainFrame:TweenSize(UDim2.new(0, 360, 0, 40), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.3, true)
        MinimizeBtn.Text = "+"
    else
        MainFrame:TweenSize(UDim2.new(0, 360, 0, 240), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.3, true, function()
            ContentFrame.Visible = true
        end)
        MinimizeBtn.Text = "-"
    end
end)

-- GOJO 0.2 (TELEPORTE + AUTO ATAQUE CONTINUO)
GojoBtn.MouseButton1Click:Connect(function()
    gojoActive = not gojoActive
    if gojoActive then
        GojoBtn.Text = "Gojo 0.2: [ ON ]"
        GojoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        GojoStroke.Color = Color3.fromRGB(138, 43, 226)
    else
        GojoBtn.Text = "Gojo 0.2: [ OFF ]"
        GojoBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
        GojoStroke.Color = Color3.fromRGB(60, 60, 80)
    end
end)

task.spawn(function()
    while true do
        task.wait(0.02)
        if gojoActive then
            local myChar = LocalPlayer.Character
            if myChar and myChar:FindFirstChild("HumanoidRootPart") then
                local myHrp = myChar.HumanoidRootPart
                
                -- Procura ferramenta e equipa se necessário
                local tool = myChar:FindFirstChildOfClass("Tool")
                if not tool and LocalPlayer.Backpack then
                    local backpackTool = LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
                    if backpackTool then
                        backpackTool.Parent = myChar
                        tool = backpackTool
                    end
                end

                local allPlayers = Players:GetPlayers()
                for i = 1, #allPlayers do
                    if not gojoActive then break end
                    local target = allPlayers[i]
                    if target ~= LocalPlayer and target.Character then
                        local tChar = target.Character
                        local tHum = tChar:FindFirstChildOfClass("Humanoid")
                        local tHrp = tChar:FindFirstChild("HumanoidRootPart")
                        
                        if tHum and tHum.Health > 0 and tHrp then
                            -- Teleporta diretamente na frente do inimigo virado para ele
                            myHrp.AssemblyLinearVelocity = Vector3.zero
                            myHrp.CFrame = tHrp.CFrame * CFrame.new(0, 0, -1.5) * CFrame.Angles(0, math.pi, 0)
                            
                            -- Ativa o golpe da arma equipada
                            if tool then
                                tool:Activate()
                            end
                            
                            task.wait(0.05)
                        end
                    end
                end
            end
        end
    end
end)

-- FLY MOBILE
local FlyGui = Instance.new("Frame")
FlyGui.Name = "FlyControls"
FlyGui.Size = UDim2.new(1, 0, 1, 0)
FlyGui.BackgroundTransparency = 1
FlyGui.Visible = false
FlyGui.Parent = ScreenGui

local flySpeed = 75

local function CreateArrowBtn(name, text, pos, parent)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Size = UDim2.new(0, 50, 0, 50)
    btn.Position = pos
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
    btn.BackgroundTransparency = 0.2
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 20
    btn.Font = Enum.Font.GothamBold
    btn.Parent = parent
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = btn
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(138, 43, 226)
    stroke.Thickness = 1.5
    stroke.Parent = btn
    return btn
end

local LeftPanel = Instance.new("Frame")
LeftPanel.Size = UDim2.new(0, 160, 0, 160)
LeftPanel.Position = UDim2.new(0, 20, 1, -180)
LeftPanel.BackgroundTransparency = 1
LeftPanel.Parent = FlyGui

local BtnUp = CreateArrowBtn("Up", "▲", UDim2.new(0.5, -25, 0, 0), LeftPanel)
local BtnDown = CreateArrowBtn("Down", "▼", UDim2.new(0.5, -25, 1, -50), LeftPanel)
local BtnLeft = CreateArrowBtn("Left", "◄", UDim2.new(0, 0, 0.5, -25), LeftPanel)
local BtnRight = CreateArrowBtn("Right", "►", UDim2.new(1, -50, 0.5, -25), LeftPanel)

local RightPanel = Instance.new("Frame")
RightPanel.Size = UDim2.new(0, 60, 0, 120)
RightPanel.Position = UDim2.new(1, -80, 1, -160)
RightPanel.BackgroundTransparency = 1
RightPanel.Parent = FlyGui

local BtnAscend = CreateArrowBtn("Ascend", "⬆", UDim2.new(0, 0, 0, 0), RightPanel)
local BtnDescend = CreateArrowBtn("Descend", "⬇", UDim2.new(0, 0, 1, -50), RightPanel)

local activeInputs = {Forward = false, Backward = false, Left = false, Right = false, Up = false, Down = false}

local function BindHold(button, key)
    button.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            activeInputs[key] = true
        end
    end)
    button.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            activeInputs[key] = false
        end
    end)
end

BindHold(BtnUp, "Forward")
BindHold(BtnDown, "Backward")
BindHold(BtnLeft, "Left")
BindHold(BtnRight, "Right")
BindHold(BtnAscend, "Up")
BindHold(BtnDescend, "Down")

RunService.RenderStepped:Connect(function(delta)
    if flyActive and LocalPlayer.Character then
        local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        local camera = workspace.CurrentCamera
        if hrp and camera then
            if hum then hum:ChangeState(Enum.HumanoidStateType.Flying) end
            local moveVector = Vector3.zero
            if activeInputs.Forward then moveVector = moveVector + camera.CFrame.LookVector end
            if activeInputs.Backward then moveVector = moveVector - camera.CFrame.LookVector end
            if activeInputs.Left then moveVector = moveVector - camera.CFrame.RightVector end
            if activeInputs.Right then moveVector = moveVector + camera.CFrame.RightVector end
            if activeInputs.Up then moveVector = moveVector + Vector3.new(0, 1, 0) end
            if activeInputs.Down then moveVector = moveVector - Vector3.new(0, 1, 0) end
            if moveVector.Magnitude > 0 then
                hrp.CFrame = hrp.CFrame + (moveVector.Unit * flySpeed * delta)
            end
            hrp.AssemblyLinearVelocity = Vector3.zero
        end
    end
end)

FlyBtn.MouseButton1Click:Connect(function()
    flyActive = not flyActive
    FlyGui.Visible = flyActive
    if flyActive then
        FlyBtn.Text = "Fly Mobile: [ ON ]"
        FlyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        FlyStroke.Color = Color3.fromRGB(138, 43, 226)
    else
        FlyBtn.Text = "Fly Mobile: [ OFF ]"
        FlyBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
        FlyStroke.Color = Color3.fromRGB(60, 60, 80)
        for k in pairs(activeInputs) do activeInputs[k] = false end
        if LocalPlayer.Character then
            local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum:ChangeState(Enum.HumanoidStateType.Freefall) end
        end
    end
end)
