return(function(U8JKr, ...)
local plfzwE = {"wwyKqcmv2D";"7cQsPrXV8Rcp4C";"AOe0J2WdDlOdLy";"FE2XJ";"Rf4Rvo";"Rk6DYQ0NbFz5oZZ2V";"355s"}
local bjs9e2KA = function(...)
--[==[ Void Hub - Device Key + Server Hop + Test Bypass ]==]

local Players = game:GetService(loadstring(base64decode("UGxheWVycw=="))())
local TweenService = game:GetService(loadstring(base64decode("VHdlZW5TZXJ2aWNl"))())
local CoreGui = game:GetService(loadstring(base64decode("Q29yZUd1aQ=="))())
local RunService = game:GetService(loadstring(base64decode("UnVuU2VydmljZQ=="))())
local UserInputService = game:GetService(loadstring(base64decode("VXNlcklucHV0U2VydmljZQ=="))())
local Stats = game:GetService(loadstring(base64decode("U3RhdHM="))())
local Lighting = game:GetService(loadstring(base64decode("TGlnaHRpbmc="))())
local HttpService = game:GetService(loadstring(base64decode("SHR0cFNlcnZpY2U="))())
local TeleportService = game:GetService(loadstring(base64decode("VGVsZXBvcnRTZXJ2aWNl"))())
local LocalPlayer = Players.LocalPlayer

local existing = CoreGui:FindFirstChild(loadstring(base64decode("Vm9pZEh1YlN5c3RlbQ=="))())
if existing then existing:Destroy() end

local voidHubSystem = Instance.new(loadstring(base64decode("U2NyZWVuR3Vp"))())
voidHubSystem.Name = loadstring(base64decode("Vm9pZEh1YlN5c3RlbQ=="))()
voidHubSystem.ResetOnSpawn = false
voidHubSystem.Parent = CoreGui

local purpleColor = Color3.fromRGB(140, 40, 220)
local DISCORD_LINK = loadstring(base64decode("aHR0cHM6Ly9kaXNjb3JkLmdnL3Jrd2U3ZXVuOA=="))()

local function getDeviceIdentifier()
    local id = nil
    pcall(function()
        local service = game:GetService(loadstring(base64decode("UmJ4QW5hbHl0aWNzU2VydmljZQ=="))())
        if service and service.GetClientId then
            id = service:GetClientId()
        end
    end)
    if not id or id == loadstring(base64decode(""))() then
        pcall(function()
            id = HttpService:GetUserAgent()
        end)
    end
    if not id or id == loadstring(base64decode(""))() then
        id = tostring(LocalPlayer.UserId) .. loadstring(base64decode("Xw=="))() .. tostring(game.PlaceId)
    end
    return id
end

local deviceId = getDeviceIdentifier()

local function generateDeviceKey()
    local str = loadstring(base64decode("Vk9JREhVQl8="))() .. deviceId .. loadstring(base64decode("Xw=="))() .. tostring(LocalPlayer.UserId) .. loadstring(base64decode("Xw=="))() .. tostring(game.PlaceId)
    local hash = 0
    for i = 1, #str do
        hash = (hash * 31 + string.byte(str, i)) % 4294967296
    end
    return string.format(loadstring(base64decode("VkgtJTA4WC0lMDRY"))(), hash, (hash * 7) % 65536)
end

local deviceKey = generateDeviceKey()

local keyContainer = Instance.new(loadstring(base64decode("RnJhbWU="))(), voidHubSystem)
keyContainer.Name = loadstring(base64decode("S2V5Q29udGFpbmVy"))()
keyContainer.Size = UDim2.new(0, 400, 0, 240)
keyContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
keyContainer.AnchorPoint = Vector2.new(0.5, 0.5)
keyContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
keyContainer.BackgroundTransparency = 0.3
keyContainer.ClipsDescendants = true

Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), keyContainer).CornerRadius = UDim.new(0, 28)

local keyBg = Instance.new(loadstring(base64decode("SW1hZ2VMYWJlbA=="))(), keyContainer)
keyBg.Name = loadstring(base64decode("S2V5QmFja2dyb3VuZEltYWdl"))()
keyBg.Size = UDim2.new(1, 0, 1, 0)
keyBg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
keyBg.BackgroundTransparency = 1
keyBg.Image = loadstring(base64decode("cmJ4YXNzZXRpZDovLzExMjQ1OTM3NTYwNzcyNA=="))()
keyBg.ImageTransparency = 0
keyBg.ScaleType = Enum.ScaleType.Crop
keyBg.ZIndex = 0
Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), keyBg).CornerRadius = UDim.new(0, 28)

local keyStroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))(), keyContainer)
keyStroke.Color = purpleColor
keyStroke.Thickness = 2.5

local titleKey = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))(), keyContainer)
titleKey.Size = UDim2.new(1, 0, 0, 32)
titleKey.Position = UDim2.new(0, 0, 0, 18)
titleKey.BackgroundTransparency = 1
titleKey.Text = loadstring(base64decode("Vk9JRCBIVUI="))()
titleKey.Font = Enum.Font.GothamBold
titleKey.TextSize = 20
titleKey.TextColor3 = Color3.fromRGB(255, 255, 255)
titleKey.ZIndex = 3

local subTitleKey = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))(), keyContainer)
subTitleKey.Size = UDim2.new(1, 0, 0, 16)
subTitleKey.Position = UDim2.new(0, 0, 0, 48)
subTitleKey.BackgroundTransparency = 1
subTitleKey.Text = loadstring(base64decode("RGlnaXRlIHN1YSBLZXkgcGFyYSBjb250aW51YXI="))()
subTitleKey.Font = Enum.Font.Gotham
subTitleKey.TextSize = 11
subTitleKey.TextColor3 = Color3.fromRGB(180, 160, 200)
subTitleKey.ZIndex = 3

local textBox = Instance.new(loadstring(base64decode("VGV4dEJveA=="))(), keyContainer)
textBox.Size = UDim2.new(0, 340, 0, 40)
textBox.Position = UDim2.new(0.5, -170, 0, 78)
textBox.BackgroundColor3 = Color3.fromRGB(15, 10, 25)
textBox.BackgroundTransparency = 0.4
textBox.PlaceholderText = loadstring(base64decode("RGlnaXRlIHN1YSBLZXkuLi4="))()
textBox.PlaceholderColor3 = Color3.fromRGB(140, 120, 160)
textBox.Text = loadstring(base64decode(""))()
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.Font = Enum.Font.Gotham
textBox.TextSize = 13
Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), textBox).CornerRadius = UDim.new(0, 10)
textBox.ZIndex = 3

local validateBtn = Instance.new(loadstring(base64decode("VGV4dEJ1dHRvbg=="))(), keyContainer)
validateBtn.Size = UDim2.new(0, 165, 0, 40)
validateBtn.Position = UDim2.new(0, 30, 0, 130)
validateBtn.BackgroundColor3 = purpleColor
validateBtn.BackgroundTransparency = 0.2
validateBtn.Text = loadstring(base64decode("VmVyaWZpY2Fy"))()
validateBtn.Font = Enum.Font.GothamBold
validateBtn.TextSize = 13
validateBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
validateBtn.AutoButtonColor = false
Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), validateBtn).CornerRadius = UDim.new(0, 10)
validateBtn.ZIndex = 3

local getKeyBtn = Instance.new(loadstring(base64decode("VGV4dEJ1dHRvbg=="))(), keyContainer)
getKeyBtn.Size = UDim2.new(0, 165, 0, 40)
getKeyBtn.Position = UDim2.new(1, -195, 0, 130)
getKeyBtn.BackgroundColor3 = Color3.fromRGB(20, 15, 30)
getKeyBtn.BackgroundTransparency = 0.4
getKeyBtn.Text = loadstring(base64decode("T2J0ZXIgS2V5"))()
getKeyBtn.Font = Enum.Font.GothamBold
getKeyBtn.TextSize = 13
getKeyBtn.TextColor3 = Color3.fromRGB(220, 180, 255)
getKeyBtn.AutoButtonColor = false
Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), getKeyBtn).CornerRadius = UDim.new(0, 10)
getKeyBtn.ZIndex = 3
local getKeyStroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))(), getKeyBtn)
getKeyStroke.Color = purpleColor
getKeyStroke.Thickness = 1.5

local discordLink = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))(), keyContainer)
discordLink.Size = UDim2.new(1, 0, 0, 18)
discordLink.Position = UDim2.new(0, 0, 0, 188)
discordLink.BackgroundTransparency = 1
discordLink.Text = loadstring(base64decode("ZGlzY29yZC5nZy9ya3dlN2V1bjg="))()
discordLink.Font = Enum.Font.GothamBold
discordLink.TextSize = 11
discordLink.TextColor3 = Color3.fromRGB(180, 150, 220)
discordLink.ZIndex = 3

getKeyBtn.MouseButton1Click:Connect(function()
    if setclipboard then setclipboard(deviceKey) end
    
    local notif = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))(), voidHubSystem)
    notif.Size = UDim2.new(0, 320, 0, 50)
    notif.Position = UDim2.new(0.5, -160, 0, 20)
    notif.BackgroundColor3 = Color3.fromRGB(20, 15, 30)
    notif.BackgroundTransparency = 0.1
    notif.TextColor3 = Color3.fromRGB(255, 255, 255)
    notif.Text = loadstring(base64decode("U3VhIEtleTog"))() .. deviceKey .. loadstring(base64decode("XG4oQ29waWFkYSBwYXJhIGEgw6FyZWEgZGUgdHJhbnNmZXLDqm5jaWEp"))()
    notif.Font = Enum.Font.GothamBold
    notif.TextSize = 11
    notif.TextWrapped = true
    notif.ZIndex = 20
    notif.Parent = voidHubSystem
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), notif).CornerRadius = UDim.new(0, 8)
    local st = Instance.new(loadstring(base64decode("VUlTdHJva2U="))(), notif)
    st.Color = purpleColor
    st.Thickness = 1.5
    
    task.delay(5, function()
        if notif and notif.Parent then notif:Destroy() end
    end)
end)

local voidHubMain = Instance.new(loadstring(base64decode("RnJhbWU="))(), voidHubSystem)
voidHubMain.Name = loadstring(base64decode("Vm9pZEh1Yk1haW4="))()
voidHubMain.Size = UDim2.new(0, 360, 0, 400)
voidHubMain.Position = UDim2.new(0.5, 0, 0.3, 0)
voidHubMain.AnchorPoint = Vector2.new(0.5, 0)
voidHubMain.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
voidHubMain.BackgroundTransparency = 0.6
voidHubMain.ClipsDescendants = true
voidHubMain.Visible = false

Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), voidHubMain).CornerRadius = UDim.new(0, 28)
local mainStroke = Instance.new(loadstring(base64decode("VUlTdHJva2U="))(), voidHubMain)
mainStroke.Color = purpleColor
mainStroke.Thickness = 2.5

local mainBg = Instance.new(loadstring(base64decode("SW1hZ2VMYWJlbA=="))(), voidHubMain)
mainBg.Name = loadstring(base64decode("QmFja2dyb3VuZEltYWdl"))()
mainBg.Size = UDim2.new(1, 0, 1, 0)
mainBg.Position = UDim2.new(0, 0, 0, 0)
mainBg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainBg.BackgroundTransparency = 1
mainBg.Image = loadstring(base64decode("cmJ4YXNzZXRpZDovLzExMjQ1OTM3NTYwNzcyNA=="))()
mainBg.ImageTransparency = 0
mainBg.ScaleType = Enum.ScaleType.Crop
mainBg.ZIndex = 0
Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), mainBg).CornerRadius = UDim.new(0, 28)

local mainTitle = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))(), voidHubMain)
mainTitle.Size = UDim2.new(1, -100, 0, 25)
mainTitle.Position = UDim2.new(0.5, 0, 0, 12)
mainTitle.AnchorPoint = Vector2.new(0.5, 0)
mainTitle.BackgroundTransparency = 1
mainTitle.Text = loadstring(base64decode("Vm9pZCBIdWI="))()
mainTitle.Font = Enum.Font.GothamBold
mainTitle.TextSize = 20
mainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
mainTitle.ZIndex = 3

local subTitle = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))(), voidHubMain)
subTitle.Size = UDim2.new(1, 0, 0, 15)
subTitle.Position = UDim2.new(0.5, 0, 0, 38)
subTitle.AnchorPoint = Vector2.new(0.5, 0)
subTitle.BackgroundTransparency = 1
subTitle.Text = loadstring(base64decode("VGhlIGJlc3Qgc2NyaXB0"))()
subTitle.Font = Enum.Font.GothamBold
subTitle.TextSize = 10
subTitle.TextColor3 = Color3.fromRGB(210, 150, 255)
subTitle.ZIndex = 3

local minimizeBtn = Instance.new(loadstring(base64decode("VGV4dEJ1dHRvbg=="))(), voidHubMain)
minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
minimizeBtn.Position = UDim2.new(0, 12, 0, 12)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(20, 15, 30)
minimizeBtn.BackgroundTransparency = 0.5
minimizeBtn.Text = loadstring(base64decode("LQ=="))()
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 20
minimizeBtn.TextColor3 = purpleColor
minimizeBtn.ZIndex = 5
Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), minimizeBtn).CornerRadius = UDim.new(0, 9)

local lockBtn = Instance.new(loadstring(base64decode("VGV4dEJ1dHRvbg=="))(), voidHubMain)
lockBtn.Size = UDim2.new(0, 30, 0, 30)
lockBtn.Position = UDim2.new(1, -42, 0, 12)
lockBtn.BackgroundColor3 = Color3.fromRGB(20, 15, 30)
lockBtn.BackgroundTransparency = 0.5
lockBtn.Text = loadstring(base64decode("8J+Ukw=="))()
lockBtn.Font = Enum.Font.Gotham
lockBtn.TextSize = 14
lockBtn.ZIndex = 5
Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), lockBtn).CornerRadius = UDim.new(0, 9)

local bodyContainer = Instance.new(loadstring(base64decode("RnJhbWU="))(), voidHubMain)
bodyContainer.Name = loadstring(base64decode("Qm9keUNvbnRhaW5lcg=="))()
bodyContainer.Size = UDim2.new(1, 0, 1, -55)
bodyContainer.Position = UDim2.new(0, 0, 0, 55)
bodyContainer.BackgroundTransparency = 1
bodyContainer.ClipsDescendants = true
bodyContainer.ZIndex = 3

local statusFrame = Instance.new(loadstring(base64decode("RnJhbWU="))(), bodyContainer)
statusFrame.Size = UDim2.new(0, 300, 0, 24)
statusFrame.Position = UDim2.new(0.5, -150, 0, 8)
statusFrame.BackgroundColor3 = Color3.fromRGB(15, 10, 25)
statusFrame.BackgroundTransparency = 0.6
statusFrame.ZIndex = 3
Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), statusFrame).CornerRadius = UDim.new(0, 7)

local statusLabel = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))(), statusFrame)
statusLabel.Size = UDim2.new(1, -10, 1, 0)
statusLabel.Position = UDim2.new(0, 5, 0, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = loadstring(base64decode("U3RhdHVzOiBOYWRhIGF0aXZv"))()
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 11
statusLabel.TextColor3 = Color3.fromRGB(190, 170, 220)
statusLabel.ZIndex = 4

local contentArea = Instance.new(loadstring(base64decode("U2Nyb2xsaW5nRnJhbWU="))(), bodyContainer)
contentArea.Size = UDim2.new(1, -20, 1, -50)
contentArea.Position = UDim2.new(0, 10, 0, 42)
contentArea.BackgroundTransparency = 1
contentArea.CanvasSize = UDim2.new(0, 0, 0, 500)
contentArea.ScrollBarThickness = 3
contentArea.ZIndex = 4

local extrasArea = Instance.new(loadstring(base64decode("U2Nyb2xsaW5nRnJhbWU="))(), bodyContainer)
extrasArea.Size = UDim2.new(1, -20, 1, -50)
extrasArea.Position = UDim2.new(0, 10, 0, 42)
extrasArea.BackgroundTransparency = 1
extrasArea.CanvasSize = UDim2.new(0, 0, 0, 550)
extrasArea.ScrollBarThickness = 3
extrasArea.Visible = false
extrasArea.ZIndex = 4

local scriptsArea = Instance.new(loadstring(base64decode("U2Nyb2xsaW5nRnJhbWU="))(), bodyContainer)
scriptsArea.Size = UDim2.new(1, -20, 1, -50)
scriptsArea.Position = UDim2.new(0, 10, 0, 42)
scriptsArea.BackgroundTransparency = 1
scriptsArea.CanvasSize = UDim2.new(0, 0, 0, 400)
scriptsArea.ScrollBarThickness = 3
scriptsArea.Visible = false
scriptsArea.ZIndex = 4

local function createButton(parent, name, label, yPos)
    local btn = Instance.new(loadstring(base64decode("VGV4dEJ1dHRvbg=="))(), parent)
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
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), btn).CornerRadius = UDim.new(0, 10)
    local st = Instance.new(loadstring(base64decode("VUlTdHJva2U="))(), btn)
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
        statusLabel.Text = loadstring(base64decode("U3RhdHVzOiBOYWRhIGF0aXZv"))()
    else
        if activeFunction then
            local prevDeactivate = deactivateFuncs[activeFunction]
            if prevDeactivate then pcall(prevDeactivate) end
            local prevBtn = buttonRefs[activeFunction]
            if prevBtn then 
                prevBtn.BackgroundTransparency = 1
            end
        end
        deactivateFuncs[name] = deactivateFn
        buttonRefs[name] = btn
        activateFn()
        btn.BackgroundTransparency = 0.55
        activeFunction = name
        statusLabel.Text = loadstring(base64decode("U3RhdHVzOiA="))() .. name .. loadstring(base64decode("IGF0aXZv"))()
    end
end

local killAllActive = false
local killAllRemotes = {}

local function cacheRemotesDeDano()
    killAllRemotes = {}
    local rs = game:GetService(loadstring(base64decode("UmVwbGljYXRlZFN0b3JhZ2U="))())
    local palavras = {loadstring(base64decode("ZGFtYWdl"))(), loadstring(base64decode("aGl0"))(), loadstring(base64decode("YXR0YWNr"))(), loadstring(base64decode("a2lsbA=="))(), loadstring(base64decode("ZGVhbA=="))(), loadstring(base64decode("cHVuY2g="))(), loadstring(base64decode("c2xhc2g="))(), loadstring(base64decode("c3dvcmQ="))(), loadstring(base64decode("Y29tYmF0"))(), loadstring(base64decode("dG91Y2g="))()}
    for _, obj in ipairs(rs:GetDescendants()) do
        if obj:IsA(loadstring(base64decode("UmVtb3RlRXZlbnQ="))()) then
            local n = obj.Name:lower()
            for _, p in ipairs(palavras) do
                if n:find(p) then
                    table.insert(killAllRemotes, obj)
                    break
                end
            end
        end
    end
end

local function killAllOn()
    killAllActive = true
    cacheRemotesDeDano()
    task.spawn(function()
        while killAllActive do
            pcall(function()
                local myChar = LocalPlayer.Character
                local myRoot = myChar and myChar:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
                local myHum = myChar and myChar:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
                if not myRoot or not myHum or myHum.Health <= 0 then
                    return
                end

                local tool = myChar:FindFirstChildOfClass(loadstring(base64decode("VG9vbA=="))())
                if not tool and LocalPlayer.Backpack then
                    local bt = LocalPlayer.Backpack:FindFirstChildOfClass(loadstring(base64decode("VG9vbA=="))())
                    if bt then
                        bt.Parent = myChar
                        tool = bt
                    end
                end

                for _, player in ipairs(Players:GetPlayers()) do
                    if not killAllActive then break end
                    if player ~= LocalPlayer and player.Character then
                        local tHum = player.Character:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
                        local tRoot = player.Character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
                        if tHum and tHum.Health > 0 and tRoot then
                            myRoot.CFrame = tRoot.CFrame * CFrame.new(0, 0, 2)

                            if tool then
                                pcall(function() tool:Activate() end)
                            end

                            for _, remote in ipairs(killAllRemotes) do
                                pcall(function() remote:FireServer(player.Character, 99999) end)
                                pcall(function() remote:FireServer(tHum, 99999) end)
                                pcall(function() remote:FireServer(tRoot, 99999) end)
                            end

                            task.wait(0.02)
                        end
                    end
                end
            end)
            task.wait(0.15)
        end
    end)
end
local function killAllOff() killAllActive = false end

local flyActive = false
local flyGui = nil
local flyBV = nil
local flyDirection = Vector3.zero
local VELOCIDADE_FLY = 250
local function flyOn()
    flyActive = true
    flyGui = Instance.new(loadstring(base64decode("U2NyZWVuR3Vp"))(), CoreGui)
    flyGui.Name = loadstring(base64decode("Vm9pZEZseUd1aQ=="))()
    flyGui.ResetOnSpawn = false
    local function criarBotaoFly(parent, txt, pos, setDir)
        local b = Instance.new(loadstring(base64decode("VGV4dEJ1dHRvbg=="))(), parent)
        b.Size = UDim2.new(0, 45, 0, 45)
        b.Position = pos
        b.BackgroundColor3 = Color3.fromRGB(20, 15, 30)
        b.BackgroundTransparency = 0.4
        b.Text = txt
        b.TextColor3 = Color3.fromRGB(255, 255, 255)
        b.TextSize = 18
        b.Font = Enum.Font.GothamBold
        b.AutoButtonColor = false
        b.ZIndex = 100
        Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), b).CornerRadius = UDim.new(0, 8)
        local st = Instance.new(loadstring(base64decode("VUlTdHJva2U="))(), b)
        st.Color = purpleColor
        st.Thickness = 1.5
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
    local leftPanel = Instance.new(loadstring(base64decode("RnJhbWU="))(), flyGui)
    leftPanel.Size = UDim2.new(0, 150, 0, 150)
    leftPanel.Position = UDim2.new(0, 20, 0.55, 0)
    leftPanel.BackgroundTransparency = 1
    criarBotaoFly(leftPanel, loadstring(base64decode("4pay"))(), UDim2.new(0.5, -22, 0, 0), Vector3.new(0, 0, -1))
    criarBotaoFly(leftPanel, loadstring(base64decode("4peE"))(), UDim2.new(0, 0, 0.5, -22), Vector3.new(-1, 0, 0))
    criarBotaoFly(leftPanel, loadstring(base64decode("4pa6"))(), UDim2.new(1, -45, 0.5, -22), Vector3.new(1, 0, 0))
    criarBotaoFly(leftPanel, loadstring(base64decode("4pa8"))(), UDim2.new(0.5, -22, 1, -45), Vector3.new(0, 0, 1))
    local rightPanel = Instance.new(loadstring(base64decode("RnJhbWU="))(), flyGui)
    rightPanel.Size = UDim2.new(0, 45, 0, 100)
    rightPanel.Position = UDim2.new(1, -65, 0.55, 0)
    rightPanel.BackgroundTransparency = 1
    criarBotaoFly(rightPanel, loadstring(base64decode("4qyG"))(), UDim2.new(0, 0, 0, 0), Vector3.new(0, 1, 0))
    criarBotaoFly(rightPanel, loadstring(base64decode("4qyH"))(), UDim2.new(0, 0, 1, -45), Vector3.new(0, -1, 0))
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
    if hrp then
        flyBV = Instance.new(loadstring(base64decode("Qm9keVZlbG9jaXR5"))())
        flyBV.Name = loadstring(base64decode("Vm9pZEZseUJW"))()
        flyBV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        flyBV.Velocity = Vector3.zero
        flyBV.Parent = hrp
    end
    task.spawn(function()
        while flyActive do
            pcall(function()
                local c = LocalPlayer.Character
                local r = c and c:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
                local cam = workspace.CurrentCamera
                if r and flyBV and flyBV.Parent then
                    local vel = Vector3.zero
                    if flyDirection.Magnitude > 0 then
                        if flyDirection.Y ~= 0 then
                            vel = flyDirection * VELOCIDADE_FLY
                        else
                            vel = (cam.CFrame.LookVector * -flyDirection.Z + cam.CFrame.RightVector * flyDirection.X) * VELOCIDADE_FLY
                        end
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

local bypassActive = false

local function escolherAlvoBypass()
    local alvos = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local hrp = p.Character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
            local hum = p.Character:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
            if hrp and hum and hum.Health > 0 then
                table.insert(alvos, hrp)
            end
        end
    end
    if #alvos == 0 then return nil end
    return alvos[math.random(1, #alvos)]
end

local function runBypassLogic()
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
    local hrp = char and char:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
    if not hum or not hrp then return end

    local colisoes = {}
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
            colisoes[part] = part.CanCollide
            part.CanCollide = false
        end
    end

    hum.PlatformStand = true

    local bv = Instance.new(loadstring(base64decode("Qm9keVZlbG9jaXR5"))())
    bv.Name = loadstring(base64decode("Vm9pZEJ5cGFzc0JW"))()
    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bv.Velocity = Vector3.zero
    bv.Parent = hrp

    local bg = Instance.new(loadstring(base64decode("Qm9keUd5cm8="))())
    bg.Name = loadstring(base64decode("Vm9pZEJ5cGFzc0JH"))()
    bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    bg.CFrame = hrp.CFrame
    bg.Parent = hrp

    local posInicial = hrp.Position

    local params = RaycastParams.new()
    params.FilterDescendantsInstances = {char}
    params.FilterType = Enum.RaycastFilterType.Exclude

    local dirs = {
        Vector3.new(1, 0, 0),
        Vector3.new(-1, 0, 0),
        Vector3.new(0, 0, 1),
        Vector3.new(0, 0, -1)
    }
    local menores = {}
    for _, dir in ipairs(dirs) do
        local result = workspace:Raycast(posInicial, dir * 5000, params)
        local dist = result and result.Distance or 5000
        table.insert(menores, { dist = dist, dir = dir })
    end
    table.sort(menores, function(a, b) return a.dist < b.dist end)
    local melhorDir = menores[1].dir

    local startTime = tick()
    while hrp.Position.Y < 800 and tick() - startTime < 6 and bypassActive do
        bv.Velocity = Vector3.new(0, 300, 0)
        RunService.RenderStepped:Wait()
    end

    local targetForward = posInicial + (melhorDir * 1000)
    local t2 = tick()
    while tick() - t2 < 3 and bypassActive do
        local diff = targetForward - hrp.Position
        local diffH = Vector3.new(diff.X, 0, diff.Z)
        if diffH.Magnitude < 20 then break end
        bv.Velocity = diffH.Unit * 400
        RunService.RenderStepped:Wait()
    end

    if bv then bv:Destroy() end
    if bg then bg:Destroy() end

    hum.PlatformStand = false
    hrp.AssemblyLinearVelocity = Vector3.new(0, -100, 0)

    task.delay(4, function()
        if char and char.Parent then
            for part, col in pairs(colisoes) do
                if part.Parent then part.CanCollide = col end
            end
        end
    end)
end

local function bypassOn()
    bypassActive = true
    task.spawn(function()
        statusLabel.Text = loadstring(base64decode("U3RhdHVzOiBCeXBhc3MgVm9pZC4uLg=="))()

        runBypassLogic()

        local timeoutMorrer = tick() + 15
        while bypassActive and tick() < timeoutMorrer do
            local char = LocalPlayer.Character
            local hum = char and char:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
            if hum and hum.Health <= 0 then break end
            task.wait(0.2)
        end

        bypassActive = false

        if buttonRefs[loadstring(base64decode("QnlwYXNz"))()] then
            buttonRefs[loadstring(base64decode("QnlwYXNz"))()].BackgroundTransparency = 1
        end
        if activeFunction == loadstring(base64decode("QnlwYXNz"))() then
            activeFunction = nil
        end
        statusLabel.Text = loadstring(base64decode("U3RhdHVzOiBOYWRhIGF0aXZv"))()
    end)
end

local function bypassOff()
    bypassActive = false
end

local function testarBypass()
    statusLabel.Text = loadstring(base64decode("c3RhdHVzOiB0ZXN0YW5kby4uLg=="))()

    local alvo = escolherAlvoBypass()
    if not alvo then
        statusLabel.Text = loadstring(base64decode("c3RhdHVzOiBmYWxob3XinYw="))()
        task.wait(2)
        statusLabel.Text = loadstring(base64decode("U3RhdHVzOiBOYWRhIGF0aXZv"))()
        return
    end

    local myHrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
    if not myHrp then
        statusLabel.Text = loadstring(base64decode("c3RhdHVzOiBmYWxob3XinYw="))()
        task.wait(2)
        statusLabel.Text = loadstring(base64decode("U3RhdHVzOiBOYWRhIGF0aXZv"))()
        return
    end

    local destino = alvo.CFrame * CFrame.new(0, 0, 3)
    myHrp.CFrame = destino
    local posTeleporte = destino.Position

    task.wait(2)

    local currentHrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))())
    if currentHrp then
        local dist = (currentHrp.Position - posTeleporte).Magnitude
        if dist < 30 then
            statusLabel.Text = loadstring(base64decode("c3RhdHVzOiBzdWNlc3Nv4pyF"))()
        else
            statusLabel.Text = loadstring(base64decode("c3RhdHVzOiBmYWxob3XinYw="))()
        end
    else
        statusLabel.Text = loadstring(base64decode("c3RhdHVzOiBmYWxob3XinYw="))()
    end

    task.wait(2.5)
    statusLabel.Text = loadstring(base64decode("U3RhdHVzOiBOYWRhIGF0aXZv"))()
end

local invisActive = false
local invisBackup = nil

local function aplicarInvisibilidade()
    local char = LocalPlayer.Character
    if not char then return end

    for _, obj in ipairs(char:GetDescendants()) do
        if obj:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) or obj:IsA(loadstring(base64decode("RGVjYWw="))()) or obj:IsA(loadstring(base64decode("VGV4dHVyZQ=="))()) then
            obj.Transparency = 1
            if obj:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
                obj.CanCollide = false
                obj.CastShadow = false
            end
        elseif obj:IsA(loadstring(base64decode("UGFydGljbGVFbWl0dGVy"))()) or obj:IsA(loadstring(base64decode("VHJhaWw="))()) or obj:IsA(loadstring(base64decode("QmVhbQ=="))()) or obj:IsA(loadstring(base64decode("RmlyZQ=="))()) or obj:IsA(loadstring(base64decode("U21va2U="))()) or obj:IsA(loadstring(base64decode("U3BhcmtsZXM="))()) then
            obj.Enabled = false
        elseif obj:IsA(loadstring(base64decode("QmlsbGJvYXJkR3Vp"))()) or obj:IsA(loadstring(base64decode("U3VyZmFjZUd1aQ=="))()) then
            obj.Enabled = false
        elseif obj:IsA(loadstring(base64decode("SGlnaGxpZ2h0"))()) then
            obj.Enabled = false
        end
    end

    local hum = char:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
    if hum then
        hum.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
        hum.NameDisplayDistance = 0
        hum.HealthDisplayDistance = 0
    end
end

local function invisOn()
    invisActive = true
    local char = LocalPlayer.Character
    if not char then return end

    invisBackup = { parent = char.Parent }

    aplicarInvisibilidade()

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local hl = player.Character:FindFirstChild(loadstring(base64decode("UHVycGxlSGlnaGxpZ2h0"))())
            if hl then hl:Destroy() end
        end
    end

    local camera = workspace.CurrentCamera
    if camera and char.Parent ~= camera then
        char.Parent = camera
    end

    if not invisBackup.loop then
        invisBackup.loop = task.spawn(function()
            while invisActive do
                pcall(function()
                    local c = LocalPlayer.Character
                    if c then
                        aplicarInvisibilidade()
                        if c.Parent ~= camera then
                            c.Parent = camera
                        end
                    end
                end)
                task.wait(0.2)
            end
        end)
    end
end

local function invisOff()
    invisActive = false
    local char = LocalPlayer.Character
    if not char then
        invisBackup = nil
        return
    end

    if invisBackup and invisBackup.parent then
        char.Parent = invisBackup.parent
    else
        char.Parent = workspace
    end

    local hum = char:FindFirstChildOfClass(loadstring(base64decode("SHVtYW5vaWQ="))())
    if hum then
        hum.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Viewer
        hum.NameDisplayDistance = 100
        hum.HealthDisplayDistance = 100
    end

    invisBackup = nil
end

local function serverHop()
    statusLabel.Text = loadstring(base64decode("U3RhdHVzOiBQcm9jdXJhbmRvIHNlcnZpZG9yLi4u"))()
    task.spawn(function()
        local success, result = pcall(function()
            local url = loadstring(base64decode("aHR0cHM6Ly9nYW1lcy5yb2Jsb3guY29tL3YxL2dhbWVzLw=="))() .. game.PlaceId .. loadstring(base64decode("L3NlcnZlcnMvUHVibGljP3NvcnRPcmRlcj1EZXNjJmxpbWl0PTEwMA=="))()
            local response = HttpService:JSONDecode(game:HttpGet(url))
            return response
        end)
        
        if success and result and result.data then
            local candidatos = {}
            for _, server in ipairs(result.data) do
                if server.id ~= game.JobId and server.playing < server.maxPlayers and server.playing >= 3 then
                    local razao = server.playing / server.maxPlayers
                    if razao >= 0.25 and razao <= 0.75 then
                        table.insert(candidatos, server)
                    end
                end
            end

            table.sort(candidatos, function(a, b)
                local razaoA = a.playing / a.maxPlayers
                local razaoB = b.playing / b.maxPlayers
                return math.abs(razaoA - 0.5) < math.abs(razaoB - 0.5)
            end)

            for _, server in ipairs(candidatos) do
                pcall(function()
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, LocalPlayer)
                end)
                return
            end
        end
        
        pcall(function()
            TeleportService:Teleport(game.PlaceId, LocalPlayer)
        end)
    end)
end

local espDummyActive = false
local function espDummyOn()
    espDummyActive = true
    task.spawn(function()
        while espDummyActive do
            pcall(function()
                for _, obj in ipairs(workspace:GetDescendants()) do
                    if obj.Name == loadstring(base64decode("RHVtbXk="))() and obj:FindFirstChild(loadstring(base64decode("SHVtYW5vaWRSb290UGFydA=="))()) and not obj:FindFirstChild(loadstring(base64decode("UkdCSGlnaGxpZ2h0"))()) then
                        local hl = Instance.new(loadstring(base64decode("SGlnaGxpZ2h0"))(), obj)
                        hl.Name = loadstring(base64decode("UkdCSGlnaGxpZ2h0"))()
                        task.spawn(function()
                            while hl and hl.Parent do
                                hl.FillColor = Color3.fromHSV((tick() * 0.5) % 1, 1, 1)
                                task.wait(0.1)
                            end
                        end)
                    end
                end
            end)
            task.wait(2)
        end
    end)
end
local function espDummyOff()
    espDummyActive = false
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name == loadstring(base64decode("RHVtbXk="))() then
            local hl = obj:FindFirstChild(loadstring(base64decode("UkdCSGlnaGxpZ2h0"))())
            if hl then hl:Destroy() end
        end
    end
end

local espJogadoresActive = false
local function espJogadoresOn()
    espJogadoresActive = true
    task.spawn(function()
        while espJogadoresActive do
            pcall(function()
                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and not player.Character:FindFirstChild(loadstring(base64decode("UHVycGxlSGlnaGxpZ2h0"))()) then
                        local hl = Instance.new(loadstring(base64decode("SGlnaGxpZ2h0"))(), player.Character)
                        hl.Name = loadstring(base64decode("UHVycGxlSGlnaGxpZ2h0"))()
                        hl.FillColor = Color3.fromRGB(140, 40, 220)
                        hl.OutlineColor = Color3.fromRGB(255, 255, 255)
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
            local hl = player.Character:FindFirstChild(loadstring(base64decode("UHVycGxlSGlnaGxpZ2h0"))())
            if hl then hl:Destroy() end
        end
    end
end

local espDomainActive = false
local espDomainGui = nil
local espDomainTxt = nil

local function temDominioNoMapa()
    local padroes = {loadstring(base64decode("ZG9tYWlu"))(), loadstring(base64decode("ZG9taW5pbw=="))(), loadstring(base64decode("ZG9tw61uaW8="))(), loadstring(base64decode("c2hyaW5l"))(), loadstring(base64decode("ZXhwYW5zaW9u"))(), loadstring(base64decode("aW5maW5pdGUgdm9pZA=="))(), loadstring(base64decode("bWFsZXZvbGVudA=="))(), loadstring(base64decode("dW5saW1pdGVk"))(), loadstring(base64decode("Y29mZmlu"))(), loadstring(base64decode("Y2hpbWVyYQ=="))(), loadstring(base64decode("aWRsZSBkZWF0aA=="))(), loadstring(base64decode("aG9yaXpvbg=="))(), loadstring(base64decode("YXV0aGVudGlj"))(), loadstring(base64decode("bXV0dWFs"))(), loadstring(base64decode("bG92ZQ=="))()}
    for _, obj in ipairs(workspace:GetDescendants()) do
        local nome = obj.Name:lower()
        for _, p in ipairs(padroes) do
            if nome:find(p) then
                if (obj:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) and obj.Size.Magnitude > 20) or obj:IsA(loadstring(base64decode("TW9kZWw="))()) then
                    return true
                end
            end
        end
    end
    return false
end

local function espDomainOn()
    espDomainActive = true
    espDomainGui = Instance.new(loadstring(base64decode("U2NyZWVuR3Vp"))(), CoreGui)
    espDomainGui.Name = loadstring(base64decode("Vm9pZEVzcERvbWFpbg=="))()
    espDomainGui.ResetOnSpawn = false

    local f = Instance.new(loadstring(base64decode("RnJhbWU="))(), espDomainGui)
    f.Size = UDim2.new(0, 200, 0, 34)
    f.Position = UDim2.new(0.02, 0, 0.15, 0)
    f.BackgroundColor3 = Color3.fromRGB(15, 10, 25)
    f.BackgroundTransparency = 0.3
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), f).CornerRadius = UDim.new(0, 10)
    local fs = Instance.new(loadstring(base64decode("VUlTdHJva2U="))(), f)
    fs.Color = purpleColor
    fs.Thickness = 2

    espDomainTxt = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))(), f)
    espDomainTxt.Size = UDim2.new(1, -10, 1, 0)
    espDomainTxt.Position = UDim2.new(0, 5, 0, 0)
    espDomainTxt.BackgroundTransparency = 1
    espDomainTxt.Text = loadstring(base64decode("RVNQIERvbWFpbjogT0ZG"))()
    espDomainTxt.TextColor3 = Color3.fromRGB(255, 80, 80)
    espDomainTxt.Font = Enum.Font.GothamBold
    espDomainTxt.TextSize = 13

    task.spawn(function()
        while espDomainActive and espDomainGui and espDomainGui.Parent do
            pcall(function()
                if temDominioNoMapa() then
                    espDomainTxt.Text = loadstring(base64decode("RVNQIERvbWFpbjogT04="))()
                    espDomainTxt.TextColor3 = Color3.fromRGB(80, 255, 120)
                else
                    espDomainTxt.Text = loadstring(base64decode("RVNQIERvbWFpbjogT0ZG"))()
                    espDomainTxt.TextColor3 = Color3.fromRGB(255, 80, 80)
                end
            end)
            task.wait(1)
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
    pcall(function()
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level05
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 999999
        Lighting.Brightness = 2
        for _, v in ipairs(Lighting:GetChildren()) do
            if v:IsA(loadstring(base64decode("UG9zdEVmZmVjdA=="))()) or v:IsA(loadstring(base64decode("QXRtb3NwaGVyZQ=="))()) or v:IsA(loadstring(base64decode("U2t5"))()) or v:IsA(loadstring(base64decode("Qmxvb21FZmZlY3Q="))()) or v:IsA(loadstring(base64decode("Qmx1ckVmZmVjdA=="))()) or v:IsA(loadstring(base64decode("U3VuUmF5c0VmZmVjdA=="))()) then
                v.Enabled = false
            end
        end
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA(loadstring(base64decode("QmFzZVBhcnQ="))()) then
                v.CastShadow = false
                v.Reflectance = 0
            elseif v:IsA(loadstring(base64decode("UGFydGljbGVFbWl0dGVy"))()) or v:IsA(loadstring(base64decode("VHJhaWw="))()) or v:IsA(loadstring(base64decode("QmVhbQ=="))()) or v:IsA(loadstring(base64decode("RmlyZQ=="))()) or v:IsA(loadstring(base64decode("U21va2U="))()) or v:IsA(loadstring(base64decode("U3BhcmtsZXM="))()) then
                v.Enabled = false
            elseif v:IsA(loadstring(base64decode("UG9pbnRMaWdodA=="))()) or v:IsA(loadstring(base64decode("U3BvdExpZ2h0"))()) or v:IsA(loadstring(base64decode("U3VyZmFjZUxpZ2h0"))()) then
                v.Enabled = false
            end
        end
    end)
end
local function fpsOff() fpsActive = false end

local panelGui = nil
local function panelOn()
    panelGui = Instance.new(loadstring(base64decode("U2NyZWVuR3Vp"))(), CoreGui)
    panelGui.Name = loadstring(base64decode("Vm9pZEZwc1BpbmdQYW5lbA=="))()
    panelGui.ResetOnSpawn = false
    local f = Instance.new(loadstring(base64decode("RnJhbWU="))(), panelGui)
    f.Size = UDim2.new(0, 180, 0, 75)
    f.Position = UDim2.new(0.78, 0, 0.1, 0)
    f.BackgroundColor3 = Color3.fromRGB(15, 10, 25)
    f.BackgroundTransparency = 0.3
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), f).CornerRadius = UDim.new(0, 14)
    local fs = Instance.new(loadstring(base64decode("VUlTdHJva2U="))(), f)
    fs.Color = purpleColor
    fs.Thickness = 2
    local txt = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))(), f)
    txt.Size = UDim2.new(1, 0, 1, 0)
    txt.BackgroundTransparency = 1
    txt.TextColor3 = Color3.fromRGB(255, 255, 255)
    txt.Font = Enum.Font.GothamBold
    txt.TextSize = 13
    task.spawn(function()
        while panelGui and f.Parent do
            local fps = math.floor(1 / RunService.RenderStepped:Wait())
            local ping = 0
            pcall(function()
                ping = math.floor(Stats.Network.ServerStatsItem[loadstring(base64decode("RGF0YSBQaW5n"))()]:GetValue())
            end)
            txt.Text = string.format(loadstring(base64decode("IEZQUzogJWRcbiBQaW5nOiAlZCBtc1xuIFBsYXllcnM6ICVk"))(), fps, ping, #Players:GetPlayers())
            task.wait(1)
        end
    end)
end
local function panelOff()
    if panelGui then panelGui:Destroy() panelGui = nil end
end

local btnKillAll = createButton(contentArea, loadstring(base64decode("S2lsbEFsbA=="))(), loadstring(base64decode("4pigICBLaWxsIEFsbCAoTWF0YSB0b2Rvcyk="))(), 5)
btnKillAll.MouseButton1Click:Connect(function()
    handleToggle(loadstring(base64decode("S2lsbEFsbA=="))(), btnKillAll, killAllOn, killAllOff)
end)

local btnFly = createButton(contentArea, loadstring(base64decode("Rmx5"))(), loadstring(base64decode("8J+bqyAgRmx5IGNvbSBCb3TDtWVz"))(), 48)
btnFly.MouseButton1Click:Connect(function()
    handleToggle(loadstring(base64decode("Rmx5"))(), btnFly, flyOn, flyOff)
end)

local btnBypass = createButton(contentArea, loadstring(base64decode("QnlwYXNz"))(), loadstring(base64decode("8J+boSAgQnlwYXNzIFZvaWQgKFBlcnNpc3RlbnRlKQ=="))(), 91)
btnBypass.MouseButton1Click:Connect(function()
    handleToggle(loadstring(base64decode("QnlwYXNz"))(), btnBypass, bypassOn, bypassOff)
end)

local btnTestBypass = createButton(contentArea, loadstring(base64decode("VGVzdGVCeXBhc3M="))(), loadstring(base64decode("8J+UhCAgVGVzdGFyIEJ5cGFzcyAoVFAgUGxheWVyKQ=="))(), 134)
btnTestBypass.MouseButton1Click:Connect(function()
    btnTestBypass.BackgroundTransparency = 0.55
    testarBypass()
    btnTestBypass.BackgroundTransparency = 1
end)

local btnServerHop = createButton(contentArea, loadstring(base64decode("U2VydmVySG9w"))(), loadstring(base64decode("8J+MkCAgU2VydmVyIEhvcCAoVHJvY2FyIFNlcnZpZG9yKQ=="))(), 177)
btnServerHop.MouseButton1Click:Connect(function()
    btnServerHop.BackgroundTransparency = 0.55
    serverHop()
    task.wait(2)
    btnServerHop.BackgroundTransparency = 1
end)

local btnAbrirExtras = createButton(contentArea, loadstring(base64decode("QWJyaXJFeHRyYXM="))(), loadstring(base64decode("4pqhICBFeHRyYXMgJiBWaXN1YWxz"))(), 220)
btnAbrirExtras.MouseButton1Click:Connect(function()
    contentArea.Visible = false
    extrasArea.Visible = true
end)

local btnEspJogadores = createButton(extrasArea, loadstring(base64decode("RXNwSm9nYWRvcmVz"))(), loadstring(base64decode("8J+RgSAgRVNQIEpvZ2Fkb3Jlcw=="))(), 5)
btnEspJogadores.MouseButton1Click:Connect(function()
    if not espJogadoresActive then
        espJogadoresOn()
        btnEspJogadores.BackgroundTransparency = 0.55
    else
        espJogadoresOff()
        btnEspJogadores.BackgroundTransparency = 1
    end
end)

local btnEspDummy = createButton(extrasArea, loadstring(base64decode("RXNwRHVtbXk="))(), loadstring(base64decode("8J+OryAgRVNQIER1bW15"))(), 48)
btnEspDummy.MouseButton1Click:Connect(function()
    if not espDummyActive then
        espDummyOn()
        btnEspDummy.BackgroundTransparency = 0.55
    else
        espDummyOff()
        btnEspDummy.BackgroundTransparency = 1
    end
end)

local btnEspDomain = createButton(extrasArea, loadstring(base64decode("RXNwRG9tYWlu"))(), loadstring(base64decode("8J+RgSAgRVNQIERvbWFpbg=="))(), 91)
btnEspDomain.MouseButton1Click:Connect(function()
    if not espDomainActive then
        espDomainOn()
        btnEspDomain.BackgroundTransparency = 0.55
    else
        espDomainOff()
        btnEspDomain.BackgroundTransparency = 1
    end
end)

local btnInvis = createButton(extrasArea, loadstring(base64decode("SW52aXNpYmlsaWRhZGU="))(), loadstring(base64decode("8J+SjiAgSW52aXNpYmlsaWRhZGU="))(), 134)
btnInvis.MouseButton1Click:Connect(function()
    handleToggle(loadstring(base64decode("SW52aXNpYmlsaWRhZGU="))(), btnInvis, invisOn, invisOff)
end)

local btnFPS = createButton(extrasArea, loadstring(base64decode("RlBT"))(), loadstring(base64decode("8J+agCAgRlBTIEJvb3N0ZXI="))(), 177)
btnFPS.MouseButton1Click:Connect(function()
    if not fpsActive then
        fpsOn()
        btnFPS.BackgroundTransparency = 0.55
    else
        fpsOff()
        btnFPS.BackgroundTransparency = 1
    end
end)

local btnPainel = createButton(extrasArea, loadstring(base64decode("UGFpbmVs"))(), loadstring(base64decode("8J+TiiAgUGFpbmVsIEZQUy9QaW5n"))(), 220)
btnPainel.MouseButton1Click:Connect(function()
    if not panelGui then
        panelOn()
        btnPainel.BackgroundTransparency = 0.55
    else
        panelOff()
        btnPainel.BackgroundTransparency = 1
    end
end)

local btnCoresHub = createButton(extrasArea, loadstring(base64decode("Q29yZXNIdWI="))(), loadstring(base64decode("8J+OqCAgQ29yZXMgZG8gSHVi"))(), 263)
btnCoresHub.MouseButton1Click:Connect(function()
    local picker = Instance.new(loadstring(base64decode("U2NyZWVuR3Vp"))(), CoreGui)
    picker.Name = loadstring(base64decode("Vm9pZENvbG9yUGlja2Vy"))()
    picker.ResetOnSpawn = false
    local f = Instance.new(loadstring(base64decode("RnJhbWU="))(), picker)
    f.Size = UDim2.new(0, 220, 0, 150)
    f.Position = UDim2.new(0.5, -110, 0.5, -75)
    f.BackgroundColor3 = Color3.fromRGB(15, 10, 25)
    f.BackgroundTransparency = 0.1
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), f).CornerRadius = UDim.new(0, 16)
    local fs = Instance.new(loadstring(base64decode("VUlTdHJva2U="))(), f)
    fs.Color = purpleColor
    fs.Thickness = 2

    local title = Instance.new(loadstring(base64decode("VGV4dExhYmVs"))(), f)
    title.Size = UDim2.new(1, 0, 0, 25)
    title.Position = UDim2.new(0, 0, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = loadstring(base64decode("Q29yIGRvIEh1Yg=="))()
    title.Font = Enum.Font.GothamBold
    title.TextSize = 13
    title.TextColor3 = Color3.fromRGB(255, 255, 255)

    local opcoesCores = {
        { cor = Color3.fromRGB(140, 40, 220), img = loadstring(base64decode("cmJ4YXNzZXRpZDovLzExMjQ1OTM3NTYwNzcyNA=="))() },
        { cor = Color3.fromRGB(40, 100, 240), img = loadstring(base64decode("cmJ4YXNzZXRpZDovLzEwMjQ3MjQ1MDgxMDYzNw=="))() },
        { cor = Color3.fromRGB(40, 220, 100), img = loadstring(base64decode("cmJ4YXNzZXRpZDovLzc1MTU5OTk0NzM2MDU2"))()  },
        { cor = Color3.fromRGB(220, 40, 40),  img = loadstring(base64decode("cmJ4YXNzZXRpZDovLzEzNjg4ODg5MzU3NTE0OQ=="))() },
        { cor = Color3.fromRGB(240, 220, 40), img = loadstring(base64decode("cmJ4YXNzZXRpZDovLzcxMDk5NjA0ODUzMjQx"))()  },
        { cor = Color3.fromRGB(240, 240, 240),img = loadstring(base64decode("cmJ4YXNzZXRpZDovLzEyMzY5NDkwODE5MjQ3Mg=="))() },
    }

    for i, opcao in ipairs(opcoesCores) do
        local row = math.floor((i-1) / 3)
        local col = (i-1) % 3
        local b = Instance.new(loadstring(base64decode("VGV4dEJ1dHRvbg=="))(), f)
        b.Size = UDim2.new(0, 55, 0, 38)
        b.Position = UDim2.new(0, 20 + col * 62, 0, 45 + row * 45)
        b.BackgroundColor3 = opcao.cor
        b.Text = loadstring(base64decode(""))()
        b.AutoButtonColor = false
        Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), b).CornerRadius = UDim.new(0, 8)
        local bs = Instance.new(loadstring(base64decode("VUlTdHJva2U="))(), b)
        bs.Color = Color3.fromRGB(255, 255, 255)
        bs.Thickness = 1
        bs.Transparency = 0.6

        b.MouseButton1Click:Connect(function()
            mainStroke.Color = opcao.cor
            keyStroke.Color = opcao.cor
            mainBg.Image = opcao.img
            keyBg.Image = opcao.img
            picker:Destroy()
        end)
    end

    local close = Instance.new(loadstring(base64decode("VGV4dEJ1dHRvbg=="))(), f)
    close.Size = UDim2.new(0, 80, 0, 24)
    close.Position = UDim2.new(1, -90, 1, -30)
    close.BackgroundColor3 = Color3.fromRGB(60, 30, 30)
    close.Text = loadstring(base64decode("RmVjaGFy"))()
    close.Font = Enum.Font.GothamBold
    close.TextSize = 11
    close.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new(loadstring(base64decode("VUlDb3JuZXI="))(), close).CornerRadius = UDim.new(0, 7)
    close.MouseButton1Click:Connect(function() picker:Destroy() end)
end)

local btnAbrirScripts = createButton(extrasArea, loadstring(base64decode("QWJyaXJTY3JpcHRz"))(), loadstring(base64decode("8J+TnCAgU2NyaXB0cyBFc3BlY2lhaXM="))(), 306)
btnAbrirScripts.MouseButton1Click:Connect(function()
    extrasArea.Visible = false
    scriptsArea.Visible = true
end)

local btnVoltar = createButton(extrasArea, loadstring(base64decode("Vm9sdGFy"))(), loadstring(base64decode("4qyF77iPICBWb2x0YXI="))(), 349)
btnVoltar.MouseButton1Click:Connect(function()
    extrasArea.Visible = false
    contentArea.Visible = true
end)

local scriptsList = {
    { loadstring(base64decode("VEJP"))(), loadstring(base64decode("8J+UpSAgVEJPIFNjcmlwdA=="))(), loadstring(base64decode("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2Nvb2w1MDEzL1RCTy9tYWluL1RCT3NjcmlwdA=="))() },
    { loadstring(base64decode("S29rdXNlbg=="))(), loadstring(base64decode("4pqhICBLb2t1c2VuIENoYWlu"))(), loadstring(base64decode("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2dnYWIyMzUxLXN0YWNrL0pqcy9yZWZzL2hlYWRzL21haW4vb2JmdXNjYXRlZF9zY3JpcHQtMTc3MDAwMjc4MDU0MS5sdWEudHh0"))() },
    { loadstring(base64decode("S29rdXNlbjI="))(), loadstring(base64decode("4pqhICBLb2t1c2VuIDI="))(), loadstring(base64decode("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2RyZWFtNzcyMzkvc3NzL3JlZnMvaGVhZHMvbWFpbi95dWpp"))() },
    { loadstring(base64decode("TG9ja09u"))(), loadstring(base64decode("8J+OryAgTG9jayBPbg=="))(), loadstring(base64decode("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2IxNzExMTMyNi1odWUvTG9jay1Pbi9yZWZzL2hlYWRzL21haW4vb2JmdXNjYXRlZF9zY3JpcHQtMTc4NjIyNjAzMDEwMi5sdWEudHh0"))() },
    { loadstring(base64decode("SnVqdXRzdWVy"))(), loadstring(base64decode("8J+UriAgSnVqdXRzdWVyIFYy"))(), loadstring(base64decode("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL3NvbGFyYXN0dWZmL3R6ZS9yZWZzL2hlYWRzL21haW4vSnVqdXRzdWVyVjIubHVh"))() },
    { loadstring(base64decode("WXVraQ=="))(), loadstring(base64decode("8J+MgCAgQmxhY2sgSG9sZSBZdWtp"))(), loadstring(base64decode("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL0RyYWdvbmZseTUxMDEvTWlub3NyL3JlZnMvaGVhZHMvbWFpbi9JbnN0YW50QmxhY2tIb2xlLkpKUw=="))() },
}
for i, data in ipairs(scriptsList) do
    local btn = createButton(scriptsArea, data[1], data[2], 5 + (i-1) * 42)
    btn.MouseButton1Click:Connect(function()
        btn.BackgroundTransparency = 0.55
        statusLabel.Text = loadstring(base64decode("U3RhdHVzOiBFeGVjdXRhbmRvIA=="))() .. data[1] .. loadstring(base64decode("Li4u"))()
        pcall(function()
            loadstring(game:HttpGet(data[3]))()
        end)
        task.wait(0.5)
        btn.BackgroundTransparency = 1
    end)
end

local btnVoltar2 = createButton(scriptsArea, loadstring(base64decode("Vm9sdGFyMg=="))(), loadstring(base64decode("4qyF77iPICBWb2x0YXI="))(), 5 + #scriptsList * 42)
btnVoltar2.MouseButton1Click:Connect(function()
    scriptsArea.Visible = false
    contentArea.Visible = true
end)

local isLocked = false
local dragging = false
local dragStart, startPos

voidHubMain.InputBegan:Connect(function(input)
    if isLocked then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        local my = input.Position.Y
        local abs = voidHubMain.AbsolutePosition
        if my - abs.Y < 55 then
            dragging = true
            dragStart = input.Position
            startPos = voidHubMain.Position
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
    lockBtn.Text = isLocked and loadstring(base64decode("8J+Ukg=="))() or loadstring(base64decode("8J+Ukw=="))()
    lockBtn.BackgroundColor3 = isLocked and Color3.fromRGB(120, 40, 40) or Color3.fromRGB(20, 15, 30)
end)

local isMinimized = false
local fullHeight = 400
local minHeight = 55

minimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        bodyContainer.Visible = false
        TweenService:Create(voidHubMain, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 360, 0, minHeight)
        }):Play()
        minimizeBtn.Text = loadstring(base64decode("Kw=="))()
    else
        TweenService:Create(voidHubMain, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 360, 0, fullHeight)
        }):Play()
        task.wait(0.3)
        bodyContainer.Visible = true
        minimizeBtn.Text = loadstring(base64decode("LQ=="))()
    end
end)

local function abrirHub()
    TweenService:Create(keyContainer, TweenInfo.new(0.4), {Size = UDim2.new(0,0,0,0)}):Play()
    task.wait(0.4)
    keyContainer:Destroy()
    voidHubMain.Visible = true
end

validateBtn.MouseButton1Click:Connect(function()
    if textBox.Text == deviceKey then
        abrirHub()
    else
        validateBtn.Text = loadstring(base64decode("SW5jb3JyZXRhIQ=="))()
        task.wait(1.5)
        validateBtn.Text = loadstring(base64decode("VmVyaWZpY2Fy"))()
    end
end)

LocalPlayer.CharacterAdded:Connect(function()
    if invisActive then
        task.wait(1)
        invisBackup = { parent = workspace }
        invisOn()
    end
end)

print(loadstring(base64decode("4pyFIFZvaWQgSHViIGNhcnJlZ2FkbyBjb20gc3VjZXNzbyE="))())
end
LjXXt75a(10mRS)
end)(...)
