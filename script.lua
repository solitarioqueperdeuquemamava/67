-- // VOID HUB v6.2 (DESIGN PREMIUM + FOCUS ORBIT ROUBADO)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer

local TargetParent = LocalPlayer:WaitForChild("PlayerGui")
if CoreGui and pcall(function() return CoreGui.Name end) then
    TargetParent = CoreGui
end

if TargetParent:FindFirstChild("VoidHubV6") then 
    TargetParent.VoidHubV6:Destroy() 
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "VoidHubV6"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = TargetParent

local gojoActive, flyActive, espActive, espDummyActive, fpsBoosterActive, focusActive = false, false, false, false, false, false
local isMinimized, isLocked = false, false
local flySpeed = 85

-- Controles do Fly
local FlyGui = Instance.new("Frame")
FlyGui.Name = "FlyControls"
FlyGui.Size = UDim2.new(1, 0, 1, 0)
FlyGui.BackgroundTransparency = 1
FlyGui.Visible = false
FlyGui.Parent = ScreenGui

local function MakeArrow(name, text, pos, parent)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Size = UDim2.new(0, 52, 0, 52)
    btn.Position = pos
    btn.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
    btn.BackgroundTransparency = 0.2
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 20
    btn.Font = Enum.Font.GothamBold
    btn.Parent = parent
    
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 14)
    local stroke = Instance.new("UIStroke", btn)
    stroke.Color = Color3.fromRGB(138, 43, 226)
    stroke.Thickness = 1.4
    return btn
end

local LPad = Instance.new("Frame", FlyGui)
LPad.Size = UDim2.new(0, 160, 0, 160)
LPad.Position = UDim2.new(0, 25, 1, -190)
LPad.BackgroundTransparency = 1

local Up = MakeArrow("Up", "▲", UDim2.new(0.5, -26, 0, 0), LPad)
local Down = MakeArrow("Down", "▼", UDim2.new(0.5, -26, 1, -52), LPad)
local Left = MakeArrow("Left", "◄", UDim2.new(0, 0, 0.5, -26), LPad)
local Right = MakeArrow("Right", "►", UDim2.new(1, -52, 0.5, -26), LPad)

local RPad = Instance.new("Frame", FlyGui)
RPad.Size = UDim2.new(0, 52, 0, 120)
RPad.Position = UDim2.new(1, -75, 1, -170)
RPad.BackgroundTransparency = 1

local Asc = MakeArrow("Ascend", "⬆", UDim2.new(0, 0, 0, 0), RPad)
local Desc = MakeArrow("Descend", "⬇", UDim2.new(0, 0, 1, -52), RPad)

local inputs = {Forward = false, Backward = false, Left = false, Right = false, Up = false, Down = false}

local function HoldBind(btn, key)
    btn.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            inputs[key] = true
        end
    end)
    btn.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            inputs[key] = false
        end
    end)
end

HoldBind(Up, "Forward")
HoldBind(Down, "Backward")
HoldBind(Left, "Left")
HoldBind(Right, "Right")
HoldBind(Asc, "Up")
HoldBind(Desc, "Down")

local function ToggleFly(state)
    flyActive = state
    FlyGui.Visible = flyActive
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if flyActive and root then
        local bv = Instance.new("BodyVelocity")
        bv.Name = "FlyBV"
        bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        bv.Parent = root
    else
        for k in pairs(inputs) do inputs[k] = false end
        if root and root:FindFirstChild("FlyBV") then
            root.FlyBV:Destroy()
        end
    end
end

RunService.RenderStepped:Connect(function()
    if flyActive then
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        local bv = root and root:FindFirstChild("FlyBV")
        if bv then
            local vel = Vector3.zero
            local camCF = workspace.CurrentCamera.CFrame
            if inputs.Forward then vel = vel + camCF.LookVector end
            if inputs.Backward then vel = vel - camCF.LookVector end
            if inputs.Left then vel = vel - camCF.RightVector end
            if inputs.Right then vel = vel + camCF.RightVector end
            if inputs.Up then vel = vel + Vector3.new(0, 1, 0) end
            if inputs.Down then vel = vel - Vector3.new(0, 1, 0) end
            bv.Velocity = (vel.Magnitude > 0) and (vel.Unit * flySpeed) or Vector3.zero
        end
    end
end)

-- Main Frame
local Main = Instance.new("Frame")
Main.Name = "MainFrame"
Main.Size = UDim2.new(0, 310, 0, 370)
Main.Position = UDim2.new(0.5, -155, 0.5, -185)
Main.BackgroundColor3 = Color3.fromRGB(11, 10, 16)
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui

Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 16)

local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Color = Color3.fromRGB(138, 43, 226)
MainStroke.Thickness = 1.8

-- TopBar
local TopBar = Instance.new("Frame", Main)
TopBar.Size = UDim2.new(1, 0, 0, 44)
TopBar.BackgroundTransparency = 1

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(1, 0, 0, 24)
Title.Position = UDim2.new(0, 0, 0, 6)
Title.BackgroundTransparency = 1
Title.Text = "VOID HUB"
Title.TextColor3 = Color3.fromRGB(168, 85, 247)
Title.TextSize = 16
Title.Font = Enum.Font.GothamBold

local MinBtn = Instance.new("TextButton", TopBar)
MinBtn.Size = UDim2.new(0, 26, 0, 26)
MinBtn.Position = UDim2.new(0, 10, 0.5, -13)
MinBtn.BackgroundColor3 = Color3.fromRGB(24, 20, 35)
MinBtn.Text = "-"
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 16
Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(0, 6)

local LockBtn = Instance.new("TextButton", TopBar)
LockBtn.Size = UDim2.new(0, 26, 0, 26)
LockBtn.Position = UDim2.new(1, -36, 0.5, -13)
LockBtn.BackgroundColor3 = Color3.fromRGB(24, 20, 35)
LockBtn.Text = "🔓"
LockBtn.TextSize = 12
Instance.new("UICorner", LockBtn).CornerRadius = UDim.new(0, 6)

-- Barra de Abas
local TabBar = Instance.new("Frame", Main)
TabBar.Size = UDim2.new(1, -20, 0, 32)
TabBar.Position = UDim2.new(0, 10, 0, 44)
TabBar.BackgroundColor3 = Color3.fromRGB(18, 16, 26)
Instance.new("UICorner", TabBar).CornerRadius = UDim.new(0, 8)

local TabListLayout = Instance.new("UIListLayout", TabBar)
TabListLayout.FillDirection = Enum.FillDirection.Horizontal
TabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
TabListLayout.Padding = UDim.new(0, 4)

-- Conteúdo
local ContentArea = Instance.new("Frame", Main)
ContentArea.Size = UDim2.new(1, -20, 1, -90)
ContentArea.Position = UDim2.new(0, 10, 0, 82)
ContentArea.BackgroundTransparency = 1

local tabs = {}
local function CreateTabSection(name)
    local tab = Instance.new("ScrollingFrame", ContentArea)
    tab.Size = UDim2.new(1, 0, 1, 0)
    tab.BackgroundTransparency = 1
    tab.CanvasSize = UDim2.new(0, 0, 0, 300)
    tab.ScrollBarThickness = 0
    tab.Visible = false
    
    local layout = Instance.new("UIListLayout", tab)
    layout.Padding = UDim.new(0, 6)
    
    tabs[name] = tab
    return tab
end

local MainTab = CreateTabSection("Main")
local VisualsTab = CreateTabSection("Extras")
local ScriptsTab = CreateTabSection("Scripts")

MainTab.Visible = true

local function AddTabBtn(name, icon, tabRef)
    local btn = Instance.new("TextButton", TabBar)
    btn.Size = UDim2.new(0.31, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = icon .. " " .. name
    btn.TextColor3 = (tabRef.Visible) and Color3.fromRGB(216, 180, 254) or Color3.fromRGB(120, 120, 150)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 10

    btn.MouseButton1Click:Connect(function()
        for _, t in pairs(tabs) do t.Visible = false end
        for _, b in pairs(TabBar:GetChildren()) do
            if b:IsA("TextButton") then b.TextColor3 = Color3.fromRGB(120, 120, 150) end
        end
        tabRef.Visible = true
        btn.TextColor3 = Color3.fromRGB(216, 180, 254)
    end)
end

AddTabBtn("Inicio", "⚔️", MainTab)
AddTabBtn("Visuais", "👁️", VisualsTab)
AddTabBtn("Scripts", "📜", ScriptsTab)

-- Funções de Elementos
local function CreateToggle(parent, text, icon, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, 0, 0, 38)
    btn.BackgroundColor3 = Color3.fromRGB(20, 18, 30)
    btn.Text = "   " .. icon .. "  " .. text
    btn.TextColor3 = Color3.fromRGB(200, 200, 220)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 11
    btn.TextXAlignment = Enum.TextXAlignment.Left
    
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", btn)
    stroke.Color = Color3.fromRGB(50, 40, 70)
    stroke.Thickness = 1

    local state = false
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.BackgroundColor3 = state and Color3.fromRGB(138, 43, 226) or Color3.fromRGB(20, 18, 30)
        btn.TextColor3 = state and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(200, 200, 220)
        stroke.Color = state and Color3.fromRGB(168, 85, 247) or Color3.fromRGB(50, 40, 70)
        callback(state)
    end)
end

local function CreateScriptBtn(parent, text, icon, link)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, 0, 0, 38)
    btn.BackgroundColor3 = Color3.fromRGB(24, 20, 36)
    btn.Text = "   " .. icon .. "  " .. text
    btn.TextColor3 = Color3.fromRGB(216, 180, 254)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 11
    btn.TextXAlignment = Enum.TextXAlignment.Left
    
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", btn)
    stroke.Color = Color3.fromRGB(138, 43, 226)
    stroke.Transparency = 0.6

    btn.MouseButton1Click:Connect(function()
        pcall(function() loadstring(game:HttpGet(link))() end)
    end)
end

-- Botões Inicio
CreateToggle(MainTab, "Kill All", "⚔️", function(s) gojoActive = s end)
CreateToggle(MainTab, "Focus Orbit (Alvo)", "🎯", function(s) focusActive = s end)
CreateToggle(MainTab, "Fly Mobile", "🚀", function(s) ToggleFly(s) end)

-- Botões Visuais & Extras
CreateToggle(VisualsTab, "ESP Jogadores", "👁️", function(s) espActive = s end)
CreateToggle(VisualsTab, "ESP Dummy", "🎯", function(s) espDummyActive = s end)
CreateToggle(VisualsTab, "FPS Booster (Textura Lisa)", "⚡", function(s)
    fpsBoosterActive = s
    if fpsBoosterActive then
        pcall(function()
            Lighting.GlobalShadows = false
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.Material = Enum.Material.SmoothPlastic
                end
            end
        end)
    end
end)

-- Botões Scripts Externos
CreateScriptBtn(ScriptsTab, "Jujutsuer Script", "▶", "https://rawscripts.net/raw/Jujutsu-Shenanigans-Jujutsuer-62785")
CreateScriptBtn(ScriptsTab, "TSB Slide Dash", "▶", "https://rawscripts.net/raw/The-Strongest-Battlegrounds-TsB-slide-dash-81918")
CreateScriptBtn(ScriptsTab, "Instant Black Hole", "▶", "https://raw.githubusercontent.com/Dragonfly5101/Minosr/refs/heads/main/InstantBlackHole.JJS")
CreateScriptBtn(ScriptsTab, "Lock-On Auto", "▶", "https://raw.githubusercontent.com/b17111326-hue/Lock-On/refs/heads/main/obfuscated_script-1786226030102.lua.txt")

-- Ações Minimizar/Bloquear
MinBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    ContentArea.Visible = not isMinimized
    TabBar.Visible = not isMinimized
    Main.Size = isMinimized and UDim2.new(0, 310, 0, 44) or UDim2.new(0, 310, 0, 370)
    MinBtn.Text = isMinimized and "+" or "-"
end)

LockBtn.MouseButton1Click:Connect(function()
    isLocked = not isLocked
    Main.Draggable = not isLocked
    LockBtn.Text = isLocked and "🔒" or "🔓"
end)

-- Sistema ESP Jogadores
RunService.RenderStepped:Connect(function()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local hl = p.Character:FindFirstChild("VoidESP")
            if espActive then
                if not hl then
                    hl = Instance.new("Highlight")
                    hl.Name = "VoidESP"
                    hl.FillColor = Color3.fromRGB(138, 43, 226)
                    hl.Parent = p.Character
                end
            elseif hl then
                hl:Destroy()
            end
        end
    end
end)

-- Sistema ESP Dummy
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("Model") and obj:FindFirstChildOfClass("Humanoid") and not Players:GetPlayerFromCharacter(obj) then
                    local hl = obj:FindFirstChild("VoidDummyESP")
                    if espDummyActive then
                        if not hl then
                            hl = Instance.new("Highlight")
                            hl.Name = "VoidDummyESP"
                            hl.FillColor = Color3.fromRGB(0, 255, 150)
                            hl.Parent = obj
                        end
                    elseif hl then
                        hl:Destroy()
                    end
                end
            end
        end)
    end
end)

-- Lógica do Focus Orbit
local orbitAngle = 0
local orbitRadius = 4.5
local orbitSpeed = 12

local function GetClosestPlayer()
    local closest, dist = nil, math.huge
    local myChar = LocalPlayer.Character
    local myHrp = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myHrp then return nil end
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local tHrp = p.Character:FindFirstChild("HumanoidRootPart")
            local tHum = p.Character:FindFirstChildOfClass("Humanoid")
            if tHrp and tHum and tHum.Health > 0 then
                local d = (myHrp.Position - tHrp.Position).Magnitude
                if d < dist then
                    dist = d
                    closest = tHrp
                end
            end
        end
    end
    return closest
end

RunService.RenderStepped:Connect(function(dt)
    if focusActive then
        local myChar = LocalPlayer.Character
        local myHrp = myChar and myChar:FindFirstChild("HumanoidRootPart")
        local targetHrp = GetClosestPlayer()
        if myHrp and targetHrp then
            myHrp.AssemblyLinearVelocity = Vector3.zero
            orbitAngle = orbitAngle + (orbitSpeed * dt)
            local offset = Vector3.new(math.cos(orbitAngle) * orbitRadius, 0, math.sin(orbitAngle) * orbitRadius)
            myHrp.CFrame = CFrame.new(targetHrp.Position + offset, targetHrp.Position)
        end
    end
end)

-- Loop Kill All
task.spawn(function()
    while true do
        task.wait(0.05)
        if gojoActive and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local myHrp = LocalPlayer.Character.HumanoidRootPart
            local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool") or (LocalPlayer.Backpack and LocalPlayer.Backpack:FindFirstChildOfClass("Tool"))
            if tool and tool.Parent ~= LocalPlayer.Character then tool.Parent = LocalPlayer.Character end
            for _, target in pairs(Players:GetPlayers()) do
                if not gojoActive then break end
                if target ~= LocalPlayer and target.Character then
                    local tHum = target.Character:FindFirstChildOfClass("Humanoid")
                    local tHrp = target.Character:FindFirstChild("HumanoidRootPart")
                    if tHum and tHum.Health > 0 and tHrp then
                        myHrp.AssemblyLinearVelocity = Vector3.zero
                        myHrp.CFrame = tHrp.CFrame * CFrame.new(0, 0, -1.5) * CFrame.Angles(0, math.pi, 0)
                        if tool then tool:Activate() end
                        task.wait(0.05)
                    end
                end
            end
        end
    end
end)
