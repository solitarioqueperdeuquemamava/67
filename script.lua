local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
function iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu(data) m=string.sub(data, 0, 55) data=data:gsub(m,'')

data = string.gsub(data, '[^'..b..'=]', '') return (data:gsub('.', function(x) if (x == '=') then return '' end local r,f='',(b:find(x)-1) for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end return r; end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x) if (#x ~= 8) then return '' end local c=0 for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end return string.char(c) end)) end


 


--[==[ Void Hub - Device Key + Server Hop + Test Bypass ]==]

local Players = game:GetService(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('yiOswJDurArVPKVOiUztpEBltgzkakEQabEoBcbxDTSUtHFhSVTNfcuUGxheWVycw=='))
local TweenService = game:GetService(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('MCvsotYzBNlROSGOjIhzaNCHdOYpvKeaJQYzHazTmSINhjjqhsMMywgVHdlZW5TZXJ2aWNl'))
local CoreGui = game:GetService(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('fcbmsetMdjJAhRWIuLzRTMgotHHmLQXCKdyAYRrZlLzPzFcSSTFChgdQ29yZUd1aQ=='))
local RunService = game:GetService(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('qNDoKIYMhpdLyqPpvMTgOcpSWTiCfkiWwiuqZjCAacRfqANgcOZVvyoUnVuU2VydmljZQ=='))
local UserInputService = game:GetService(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('LMfrmXtkCReDLiqQgfvQvlSboqGldXBhCTdZaUcMvhJjUlxGaZeiiQiVXNlcklucHV0U2VydmljZQ=='))
local Stats = game:GetService(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('CwAqWhmGJqbDXPxZOrgmSRQcZOXZxjUcaEXqJfbQJPjsPYFMkUymhIrU3RhdHM='))
local Lighting = game:GetService(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('yqiSrJQDXFpraCNLlqPqrMxvWAnKMAMIUEMsvtIPttcnEfyUHBFBRIPTGlnaHRpbmc='))
local HttpService = game:GetService(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('RMTDOUyTnOWoFkxiSJqRJwPuSIxommVfMdTuipEPbfwXtDYFzGvAPkrSHR0cFNlcnZpY2U='))
local TeleportService = game:GetService(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('TyELlrhHphqcvwyYnAEedtYtIWHcGtrUKocwgnLvmJFHBrnwGUrHzAYVGVsZXBvcnRTZXJ2aWNl'))
local LocalPlayer = Players.LocalPlayer

local existing = CoreGui:FindFirstChild(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('RdzkKsvwzRkPYJQcjKhEMXmeQtjRjNAdeWfJBaKRukVNOSJLzlXCrcYVm9pZEh1YlN5c3RlbQ=='))
if existing then existing:Destroy() end

local voidHubSystem = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('OoycEJJQYVrhYGYBHOQIGDrtdskqkaNYqutgNNIzsLzIgHVNeusMeShU2NyZWVuR3Vp'))
voidHubSystem.Name = iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('IqCghyIcgytGxForeKLqBIAArzYTWOGfBeiLrbCKMYLihiOSQZzIfRSVm9pZEh1YlN5c3RlbQ==')
voidHubSystem.ResetOnSpawn = false
voidHubSystem.Parent = CoreGui

local purpleColor = Color3.fromRGB(140, 40, 220)
local DISCORD_LINK = iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('MQkBoAimNACKyOWFYcrsPtYAdnbngiLBFvGDcfPzTsYsxNMaVZaGDwHaHR0cHM6Ly9kaXNjb3JkLmdnL3Jrd2U3ZXVuOA==')

local function getDeviceIdentifier()
    local id = nil
    pcall(function()
        local service = game:GetService(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('WRKxnxDGTpIdTxxgvjlQyOpowuZfMSncbmmUTwefqMPEHECXtrAPFSHUmJ4QW5hbHl0aWNzU2VydmljZQ=='))
        if service and service.GetClientId then
            id = service:GetClientId()
        end
    end)
    if not id or id == iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('sggDXlLLoWjjWixLxTTdnjWvEJNvGikysmmxoYqHOqLTejCUzUtAEBw') then
        pcall(function()
            id = HttpService:GetUserAgent()
        end)
    end
    if not id or id == iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('kUUaXeuVQRoBXkEgAxDmSuBsZubBnTKfioIJohAhiCcLRQjhncIiAmh') then
        id = tostring(LocalPlayer.UserId) .. iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('EYuqOeLaNBkvbROtdsRuospeZzMvtCFFbFhZZzErTaFbVUVyfbUkyLOXw==') .. tostring(game.PlaceId)
    end
    return id
end

local deviceId = getDeviceIdentifier()

local function generateDeviceKey()
    local str = iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('qBlbuVKaCiSGnZADwOJfUhdpyxXwLGoURdEtqeUfGpCIuERShfJEnXGVk9JREhVQl8=') .. deviceId .. iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('SnCvjJiiGlYEWaaetdXxPgJBAuSunkBAYPhHEJGyWkZqifKjLaEpJbWXw==') .. tostring(LocalPlayer.UserId) .. iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('iBJFfbEXxPbbZWvkbeBCHmHiYvgfwpshfFcwTgOEjcBEadtuudErWuCXw==') .. tostring(game.PlaceId)
    local hash = 0
    for i = 1, #str do
        hash = (hash * 31 + string.byte(str, i)) % 4294967296
    end
    return string.format(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('NcdWrhRdpvtLCjNnJuNSTxrOTbWSCLMzQZZXuqkuqpwwaXSMlbskEFxVkgtJTA4WC0lMDRY'), hash, (hash * 7) % 65536)
end

local deviceKey = generateDeviceKey()

local keyContainer = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('abbNxMYZPbvGlDedbjLYHQuLElcTmEPKEeoympOleKUyoxhZZReQXsDRnJhbWU='), voidHubSystem)
keyContainer.Name = iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('lPmbsBehDxpILFiLjnQXCwamJCjfqirzkNCmqxvtpeQJQwyZrPCERzES2V5Q29udGFpbmVy')
keyContainer.Size = UDim2.new(0, 400, 0, 240)
keyContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
keyContainer.AnchorPoint = Vector2.new(0.5, 0.5)
keyContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
keyContainer.BackgroundTransparency = 0.3
keyContainer.ClipsDescendants = true

Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('RGMKfvYtlllKpFvrXBEVQUUFaidUmCrDlvHaTwogTZhnlOpiIzTpFnqVUlDb3JuZXI='), keyContainer).CornerRadius = UDim.new(0, 28)

local keyBg = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('LkTaOrWtBpUQlEcWOdhUqwJAGSaFSkqbcttPwHFXGNPdXxPxeuIInGQSW1hZ2VMYWJlbA=='), keyContainer)
keyBg.Name = iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('bXNldvPLEQjHqlstVUFaasUzTxxOXtFSqoLwvoRsxuSAwrHWmjnlazlS2V5QmFja2dyb3VuZEltYWdl')
keyBg.Size = UDim2.new(1, 0, 1, 0)
keyBg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
keyBg.BackgroundTransparency = 1
keyBg.Image = iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('LuYvLisTEmEyIztcDkSjShpAtlpmdPdbQoRFkJIJiXvRLIEJQghJddTcmJ4YXNzZXRpZDovLzExMjQ1OTM3NTYwNzcyNA==')
keyBg.ImageTransparency = 0
keyBg.ScaleType = Enum.ScaleType.Crop
keyBg.ZIndex = 0
Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('sWxRckCnkSVFkPDthYCCGIYJpMIrbapLkPyORJIGQYFOFFxtGtZzQbGVUlDb3JuZXI='), keyBg).CornerRadius = UDim.new(0, 28)

local keyStroke = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('DDTpVZgkTrhYkzlcFwFTHuREbXjlRfPOwNCQxMkmpWWIyIRVlmhfpPDVUlTdHJva2U='), keyContainer)
keyStroke.Color = purpleColor
keyStroke.Thickness = 2.5

local titleKey = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('iXhdTfpaKHulZZfydTAnjiSvJyCzOLExpWjyHQkpgHIIhKOcGIdwvGpVGV4dExhYmVs'), keyContainer)
titleKey.Size = UDim2.new(1, 0, 0, 32)
titleKey.Position = UDim2.new(0, 0, 0, 18)
titleKey.BackgroundTransparency = 1
titleKey.Text = iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('RFDqnvOvKsVprLtHiHhOwbSSYIUlRMRrOniRecuJZqDbqZegZddLhCZVk9JRCBIVUI=')
titleKey.Font = Enum.Font.GothamBold
titleKey.TextSize = 20
titleKey.TextColor3 = Color3.fromRGB(255, 255, 255)
titleKey.ZIndex = 3

local subTitleKey = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('drvAYTOqFBgnwfipWOtObwyJYOLqUYrtMyUpccWRKpFsRdOoKfiMTWPVGV4dExhYmVs'), keyContainer)
subTitleKey.Size = UDim2.new(1, 0, 0, 16)
subTitleKey.Position = UDim2.new(0, 0, 0, 48)
subTitleKey.BackgroundTransparency = 1
subTitleKey.Text = iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('ZcJRwsoScnYWPbuJNmhSYTciPRRKIeMSgxeiiQXVyeNMmWFrHYrfaevRGlnaXRlIHN1YSBLZXkgcGFyYSBjb250aW51YXI=')
subTitleKey.Font = Enum.Font.Gotham
subTitleKey.TextSize = 11
subTitleKey.TextColor3 = Color3.fromRGB(180, 160, 200)
subTitleKey.ZIndex = 3

local textBox = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('NjqEmzHPtrPJmsfNLPVNqUjMCqSozNtikeUtEnGvHmrorwjLDZzeIcTVGV4dEJveA=='), keyContainer)
textBox.Size = UDim2.new(0, 340, 0, 40)
textBox.Position = UDim2.new(0.5, -170, 0, 78)
textBox.BackgroundColor3 = Color3.fromRGB(15, 10, 25)
textBox.BackgroundTransparency = 0.4
textBox.PlaceholderText = iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('tZkrapIxWmYgGJaBhNqKlhWCrrUgaloUDJKHITroAacmccewxBCrqDdRGlnaXRlIHN1YSBLZXkuLi4=')
textBox.PlaceholderColor3 = Color3.fromRGB(140, 120, 160)
textBox.Text = iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('xhmojbzMpbhmoblTmKqonTYlJFQckLdikPaNLvUMuwCGSuqqONnbAIb')
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.Font = Enum.Font.Gotham
textBox.TextSize = 13
Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('lvcDbUYOpZLJlKvdNNTqyuhtDBkxGwNFQCYOkyeQFsczuyWRTZtvvmAVUlDb3JuZXI='), textBox).CornerRadius = UDim.new(0, 10)
textBox.ZIndex = 3

local validateBtn = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('EVziCFtpCFxPAaXYjkTnqWDqoAzcJToCaflccNvmsaYtRTUZrOsJJKKVGV4dEJ1dHRvbg=='), keyContainer)
validateBtn.Size = UDim2.new(0, 165, 0, 40)
validateBtn.Position = UDim2.new(0, 30, 0, 130)
validateBtn.BackgroundColor3 = purpleColor
validateBtn.BackgroundTransparency = 0.2
validateBtn.Text = iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('SuFFmgoCgwamsZXSvoMKyvJxOJEJpEqqanYoylGCzQjjRjkwXONQuorVmVyaWZpY2Fy')
validateBtn.Font = Enum.Font.GothamBold
validateBtn.TextSize = 13
validateBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
validateBtn.AutoButtonColor = false
Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('zTwoOZkAelgkToWFUzSuUXqbMIJvNGaCRuLzWKKVcMZlIYUdiFGErHBVUlDb3JuZXI='), validateBtn).CornerRadius = UDim.new(0, 10)
validateBtn.ZIndex = 3

local getKeyBtn = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('pbkfuvpFvcliuDrZSalTyrhLVDMlCadiMcNYOuLIMJurowgyQUfKkDGVGV4dEJ1dHRvbg=='), keyContainer)
getKeyBtn.Size = UDim2.new(0, 165, 0, 40)
getKeyBtn.Position = UDim2.new(1, -195, 0, 130)
getKeyBtn.BackgroundColor3 = Color3.fromRGB(20, 15, 30)
getKeyBtn.BackgroundTransparency = 0.4
getKeyBtn.Text = iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('bzaVNvyatRoATQnKqpGQICblDhBcQcDmwJuWrZLUAtpQyNCVnthFJfZT2J0ZXIgS2V5')
getKeyBtn.Font = Enum.Font.GothamBold
getKeyBtn.TextSize = 13
getKeyBtn.TextColor3 = Color3.fromRGB(220, 180, 255)
getKeyBtn.AutoButtonColor = false
Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('SsAbDhpPUzSuEmsCJpSWDlmVheSYYEKkdXZaBJgFCjbTsGGuwcJeQFHVUlDb3JuZXI='), getKeyBtn).CornerRadius = UDim.new(0, 10)
getKeyBtn.ZIndex = 3
local getKeyStroke = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('kmfxqbNAcvpWjduFNBzdmKorkIDBEvcCzgTpRlatcNWyfCYvTXXBviyVUlTdHJva2U='), getKeyBtn)
getKeyStroke.Color = purpleColor
getKeyStroke.Thickness = 1.5

local discordLink = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('pyhxUhwXfkGLTEInVrFaHppaQlgCmaANULGnLSdMJGdoxzbHpHAroxTVGV4dExhYmVs'), keyContainer)
discordLink.Size = UDim2.new(1, 0, 0, 18)
discordLink.Position = UDim2.new(0, 0, 0, 188)
discordLink.BackgroundTransparency = 1
discordLink.Text = iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('wRudhObDQVZemSSdObSLKxUsZHLcYeBRaQbstmKJkMiVMGkGTzaeDxcZGlzY29yZC5nZy9ya3dlN2V1bjg=')
discordLink.Font = Enum.Font.GothamBold
discordLink.TextSize = 11
discordLink.TextColor3 = Color3.fromRGB(180, 150, 220)
discordLink.ZIndex = 3

getKeyBtn.MouseButton1Click:Connect(function()
    if setclipboard then setclipboard(deviceKey) end
    
    local notif = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('roiISZkklksVPElDNIPesGbVfhjXNWWkbOtIRZGvcxrrpCleWDYBoTEVGV4dExhYmVs'), voidHubSystem)
    notif.Size = UDim2.new(0, 320, 0, 50)
    notif.Position = UDim2.new(0.5, -160, 0, 20)
    notif.BackgroundColor3 = Color3.fromRGB(20, 15, 30)
    notif.BackgroundTransparency = 0.1
    notif.TextColor3 = Color3.fromRGB(255, 255, 255)
    notif.Text = iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('AIhAgXFirSKPrEQmBMpKoVPHsaXomepaWbbtnIinqOvCUWUPmAWkabgU3VhIEtleTog') .. deviceKey .. iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('JdBsKTzwfdKAOJBxaPyCSMOiaOCbKpxoUMEFQapPiynyeyahaNPPzveXG4oQ29waWFkYSBwYXJhIGEgw6FyZWEgZGUgdHJhbnNmZXLDqm5jaWEp')
    notif.Font = Enum.Font.GothamBold
    notif.TextSize = 11
    notif.TextWrapped = true
    notif.ZIndex = 20
    notif.Parent = voidHubSystem
    Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('KtGnDHemOvgjHEOACdWPyBTKSFkNSPEtflWQCRfGHXWjWADSAKFLkJoVUlDb3JuZXI='), notif).CornerRadius = UDim.new(0, 8)
    local st = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('clhqwCHxTuXBbziNnNoQqhKTlOJWtAUMnUtZQdFyqzQHQhOUFqxnDfSVUlTdHJva2U='), notif)
    st.Color = purpleColor
    st.Thickness = 1.5
    
    task.delay(5, function()
        if notif and notif.Parent then notif:Destroy() end
    end)
end)

local voidHubMain = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('XacOfQfphJIniAbCjNvBcGLbExFptYTeDMiseCvboyGnkMsZQzjmmJvRnJhbWU='), voidHubSystem)
voidHubMain.Name = iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('bzIcrboErtjxNMXndanFbCczpNzktnpJwGAgobemTBljGYGpXinitliVm9pZEh1Yk1haW4=')
voidHubMain.Size = UDim2.new(0, 360, 0, 400)
voidHubMain.Position = UDim2.new(0.5, 0, 0.3, 0)
voidHubMain.AnchorPoint = Vector2.new(0.5, 0)
voidHubMain.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
voidHubMain.BackgroundTransparency = 0.6
voidHubMain.ClipsDescendants = true
voidHubMain.Visible = false

Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('rdRLJwpAhOVWXoxBpXvqYsYtBSbGRnwJYaVcwrcGbCAPbzJQKAOeHEJVUlDb3JuZXI='), voidHubMain).CornerRadius = UDim.new(0, 28)
local mainStroke = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('ZVDqUSzabZJCkNCddHNWJUetxnnJzHpZjhwYPKmgGcTXHlluGGFFBwaVUlTdHJva2U='), voidHubMain)
mainStroke.Color = purpleColor
mainStroke.Thickness = 2.5

local mainBg = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('FfByBtGDHuUoIEgBWMpEiqrxgKgdciHyHOpDuoLvIZDFIzMAxjtDraoSW1hZ2VMYWJlbA=='), voidHubMain)
mainBg.Name = iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('twXIrpTuSNKDMMPznWUAiVtqfYvNxYOZVzWbRYEXETnmBzFzNPtRaOWQmFja2dyb3VuZEltYWdl')
mainBg.Size = UDim2.new(1, 0, 1, 0)
mainBg.Position = UDim2.new(0, 0, 0, 0)
mainBg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainBg.BackgroundTransparency = 1
mainBg.Image = iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('TZKaNPwjSvNPugyZOSkHAjEOsXhfGGNcrImInmfyAPRMAEEcESEoiblcmJ4YXNzZXRpZDovLzExMjQ1OTM3NTYwNzcyNA==')
mainBg.ImageTransparency = 0
mainBg.ScaleType = Enum.ScaleType.Crop
mainBg.ZIndex = 0
Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('kytvtaMFAPjsESjkgCWQnSWoHUWSGvRjkqJrAPKMJEbHdelGNqJrbglVUlDb3JuZXI='), mainBg).CornerRadius = UDim.new(0, 28)

local mainTitle = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('CZdNVIUlTJbLIUYQxSYCiUoWzcdXiPzKaWKgwvSRFcPQjmIRZrRsghlVGV4dExhYmVs'), voidHubMain)
mainTitle.Size = UDim2.new(1, -100, 0, 25)
mainTitle.Position = UDim2.new(0.5, 0, 0, 12)
mainTitle.AnchorPoint = Vector2.new(0.5, 0)
mainTitle.BackgroundTransparency = 1
mainTitle.Text = iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('kVmsnVSEcFgFAYJORdWyxUQLroTbLFkupXDOSUdeyYfCeIAZKaIOOxqVm9pZCBIdWI=')
mainTitle.Font = Enum.Font.GothamBold
mainTitle.TextSize = 20
mainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
mainTitle.ZIndex = 3

local subTitle = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('jPKugmfFjRiBXqMpooOOVaelulsPxkTNmsSxDrhlEDJYPuWMZrsLYOEVGV4dExhYmVs'), voidHubMain)
subTitle.Size = UDim2.new(1, 0, 0, 15)
subTitle.Position = UDim2.new(0.5, 0, 0, 38)
subTitle.AnchorPoint = Vector2.new(0.5, 0)
subTitle.BackgroundTransparency = 1
subTitle.Text = iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('NbElVHWMbhDlqvotECrbHjevZgUwgLXYeqJGthwXUERzUqIYEgWCCGyVGhlIGJlc3Qgc2NyaXB0')
subTitle.Font = Enum.Font.GothamBold
subTitle.TextSize = 10
subTitle.TextColor3 = Color3.fromRGB(210, 150, 255)
subTitle.ZIndex = 3

local minimizeBtn = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('NMrOgisqhgyTxGcuZTCHSzBziXtRjbFfdoensVNkrJNcneZUsvNQcbMVGV4dEJ1dHRvbg=='), voidHubMain)
minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
minimizeBtn.Position = UDim2.new(0, 12, 0, 12)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(20, 15, 30)
minimizeBtn.BackgroundTransparency = 0.5
minimizeBtn.Text = iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('kmfjawqSANmKMWRGhUwBlEJhoqyAVeipCVhCDIXSoAPmsQNXtzmhzlBLQ==')
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 20
minimizeBtn.TextColor3 = purpleColor
minimizeBtn.ZIndex = 5
Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('BadCWfHNvzjuZQytSlOFQALUGcXZJOEdUGZnpMrdJxfXcZVDSuYMkdeVUlDb3JuZXI='), minimizeBtn).CornerRadius = UDim.new(0, 9)

local lockBtn = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('SRTLezNGaJlhgXwGLMOJtOGErDfAnuZMvscOiPwzpVCkkUJYTnQsivYVGV4dEJ1dHRvbg=='), voidHubMain)
lockBtn.Size = UDim2.new(0, 30, 0, 30)
lockBtn.Position = UDim2.new(1, -42, 0, 12)
lockBtn.BackgroundColor3 = Color3.fromRGB(20, 15, 30)
lockBtn.BackgroundTransparency = 0.5
lockBtn.Text = iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('eVkTRDwVuRuyieqnAnjFSFUCOPTqkQanlhQUvayhKqBHpPsCYJhxVsF8J+Ukw==')
lockBtn.Font = Enum.Font.Gotham
lockBtn.TextSize = 14
lockBtn.ZIndex = 5
Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('EGrtOsVVmEiAnrugLLujsDgaRSXnckMgxVIMoJyTEiEGNoBdrBkYnWTVUlDb3JuZXI='), lockBtn).CornerRadius = UDim.new(0, 9)

local bodyContainer = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('vpIrkYeQCPBUmctvWuhmNNyxeBdXMEdYEnpFcNnauKSqzpsnIDgYaXZRnJhbWU='), voidHubMain)
bodyContainer.Name = iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('wTMTjDGlkOgISWgnSwipekCDvsWoeOSjaUTfhjsJaWNLSuPWEqSRksgQm9keUNvbnRhaW5lcg==')
bodyContainer.Size = UDim2.new(1, 0, 1, -55)
bodyContainer.Position = UDim2.new(0, 0, 0, 55)
bodyContainer.BackgroundTransparency = 1
bodyContainer.ClipsDescendants = true
bodyContainer.ZIndex = 3

local statusFrame = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('lWmNvgBwsgcRUUpiTXBusVtQLoijkcaffpYKeBnOmOneoRklsqHMAlzRnJhbWU='), bodyContainer)
statusFrame.Size = UDim2.new(0, 300, 0, 24)
statusFrame.Position = UDim2.new(0.5, -150, 0, 8)
statusFrame.BackgroundColor3 = Color3.fromRGB(15, 10, 25)
statusFrame.BackgroundTransparency = 0.6
statusFrame.ZIndex = 3
Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('zjNhazJykwQCIVFjNnnCjiqBnfIaCmopzTvUrgkOMNFeTeXfPiryKprVUlDb3JuZXI='), statusFrame).CornerRadius = UDim.new(0, 7)

local statusLabel = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('qtfshaFCcBJebvPXKqRMaaUtrQrOpEsZfOljIWxlgpGSEZnejnMJJZFVGV4dExhYmVs'), statusFrame)
statusLabel.Size = UDim2.new(1, -10, 1, 0)
statusLabel.Position = UDim2.new(0, 5, 0, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('iyIUUMQTAwqSkBLCJqYfQHyXKyqZOiPsOLBXmxSwTZPmcmGwEwSzNcjU3RhdHVzOiBOYWRhIGF0aXZv')
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 11
statusLabel.TextColor3 = Color3.fromRGB(190, 170, 220)
statusLabel.ZIndex = 4

local contentArea = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('tjwNnoPUkHaGBJwDtzbeJfWnElVsiEzOzqYVEYyUbijKljiwJWvyIWZU2Nyb2xsaW5nRnJhbWU='), bodyContainer)
contentArea.Size = UDim2.new(1, -20, 1, -50)
contentArea.Position = UDim2.new(0, 10, 0, 42)
contentArea.BackgroundTransparency = 1
contentArea.CanvasSize = UDim2.new(0, 0, 0, 500)
contentArea.ScrollBarThickness = 3
contentArea.ZIndex = 4

local extrasArea = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('ogXlgSLFjkpAspxfXDOzoqXTMMURyceYOwBPHstkJdLUEmxrVXHcyMUU2Nyb2xsaW5nRnJhbWU='), bodyContainer)
extrasArea.Size = UDim2.new(1, -20, 1, -50)
extrasArea.Position = UDim2.new(0, 10, 0, 42)
extrasArea.BackgroundTransparency = 1
extrasArea.CanvasSize = UDim2.new(0, 0, 0, 550)
extrasArea.ScrollBarThickness = 3
extrasArea.Visible = false
extrasArea.ZIndex = 4

local scriptsArea = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('PglBXyqsvgrewUMiPROlSiXnVeADexUeRHaXIMIGrCvmgLQoJqiKJVCU2Nyb2xsaW5nRnJhbWU='), bodyContainer)
scriptsArea.Size = UDim2.new(1, -20, 1, -50)
scriptsArea.Position = UDim2.new(0, 10, 0, 42)
scriptsArea.BackgroundTransparency = 1
scriptsArea.CanvasSize = UDim2.new(0, 0, 0, 400)
scriptsArea.ScrollBarThickness = 3
scriptsArea.Visible = false
scriptsArea.ZIndex = 4

local function createButton(parent, name, label, yPos)
    local btn = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('RcwJORuRYpxddQFPqaKxcqvMDlufNCFlNGglJMOozbrkaOLTMdypCIjVGV4dEJ1dHRvbg=='), parent)
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
    Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('NUffMLlsxTLxRHwbGzhlLniJTkuBYcxnSLPqOtMgwdoifNoRGDAuMSeVUlDb3JuZXI='), btn).CornerRadius = UDim.new(0, 10)
    local st = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('FCeFKGxRXoZUribtHIYvMQvjaSMtcTfyyGyroWzAqZIEzxIStKWdxAKVUlTdHJva2U='), btn)
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
        statusLabel.Text = iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('PaTpzXcECXRbWBTrzsufOEgiLxJbCKNVwFsMxRYExFeadvdQqFMQthkU3RhdHVzOiBOYWRhIGF0aXZv')
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
        statusLabel.Text = iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('crcIHLwukuhzDrUaMzsQflQiIjbEakpkxrPZVYrUNUefkhoFSSmsObtU3RhdHVzOiA=') .. name .. iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('AOOwqlLKPwWNUErVKSZqnssoImtdffXZvKKuYhYTPehBgHJzikajDkqIGF0aXZv')
    end
end

local killAllActive = false
local killAllRemotes = {}

local function cacheRemotesDeDano()
    killAllRemotes = {}
    local rs = game:GetService(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('tGfGTpTkwfahcuGPxEelzInVfisrwGCSlwxLnyjSOMPWJvwoTwoBUzeUmVwbGljYXRlZFN0b3JhZ2U='))
    local palavras = {iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('bkENKCAqoeyBqDnvMhedBeZHGpJAkvPJhfjbqURgymymdEATasJYlcMZGFtYWdl'), iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('MPHDHwZhsmKtrawShIGOIujIddoZHjXTyryPObxvBMZvGkZSdbpfKvZaGl0'), iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('WRvidZnxmDwCYqmICvBSxoiLfvhRFancKYXEQBCUONVyYMQMrHJlZqBYXR0YWNr'), iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('GBKqoiwhxPLMbKTnVnSQCAVQhDVwLwEbXEAXuXJKTBISridUCRWUJuca2lsbA=='), iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('KjELftnPgTrsVreemlkDaAYbfgtYAoaselfpVWNYgoiYHehIVwPGtdEZGVhbA=='), iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('vTnfbVKpUJeDfXGzgUalTqwrEpcZYjqueuYWSBnMIGPlZAXlrPSmQSFcHVuY2g='), iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('AcNWreXODOiZVDurhyfiUOtUAavnJNOLoLbwgAvxCoLeaiVXAeZHYgkc2xhc2g='), iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('TvFCRDBszpCGSNJtAKqZURLKGbteNjrMbqHjAiHrcDzvOhgMFuZTEATc3dvcmQ='), iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('BjlpxvYkFRLZwPmEuuGqODljjLXFDvBuQJemHEZDUTeSWbaYBDPuHOYY29tYmF0'), iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('tlYbODSwuinKzxZGJSUVtlJvqqFlhBeurkqcnsYnIhfRQsNCcYHdGtfdG91Y2g=')}
    for _, obj in ipairs(rs:GetDescendants()) do
        if obj:IsA(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('VyOTkxkGtbUQEarLTxBsDYSviPETGUQJQAYgSxhzLKDUYmZSbfZvcXXUmVtb3RlRXZlbnQ=')) then
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
                local myRoot = myChar and myChar:FindFirstChild(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('WUGNDnMzvCLLdQCKLLXARznkhhZKzMCDPmQvqKSDnlTkFJjmrOrgcaySHVtYW5vaWRSb290UGFydA=='))
                local myHum = myChar and myChar:FindFirstChildOfClass(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('DXzzZCfbhtEWzavBjMlbaHAkjPLYtVNGwSBHoPMkSuVspVkPXzkyZENSHVtYW5vaWQ='))
                if not myRoot or not myHum or myHum.Health <= 0 then
                    return
                end

                local tool = myChar:FindFirstChildOfClass(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('AyIQNNtIcaMKJEXNMlKkrKTNjheoXryGEwgctKjENVpmJxeDLaeRDRRVG9vbA=='))
                if not tool and LocalPlayer.Backpack then
                    local bt = LocalPlayer.Backpack:FindFirstChildOfClass(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('NLVhMJIiHzXuNyOSBLtQfqNMQDwtHUlSdkNWJcSfqVrEajKDluNixAZVG9vbA=='))
                    if bt then
                        bt.Parent = myChar
                        tool = bt
                    end
                end

                for _, player in ipairs(Players:GetPlayers()) do
                    if not killAllActive then break end
                    if player ~= LocalPlayer and player.Character then
                        local tHum = player.Character:FindFirstChildOfClass(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('LsIDIXCaHienRWLXJFvtUsQATrAYSkmGFdhEKySetNXDdIBpKoUHcWqSHVtYW5vaWQ='))
                        local tRoot = player.Character:FindFirstChild(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('maBMrIkLvBdsgXZZzfxShshccPIizylPPkyoshXvuCOatvEuwIMtkmgSHVtYW5vaWRSb290UGFydA=='))
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
    flyGui = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('tjKmsHkcIqycyHUihhghqytRHJSrQSiAnwkNEpSLQFtcaTkGHQQGkWtU2NyZWVuR3Vp'), CoreGui)
    flyGui.Name = iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('ZqbXhOhdOuIvBYCVVxdnfRzLEieGqmoKXnVgMYqEOMadGQhdgrCboGwVm9pZEZseUd1aQ==')
    flyGui.ResetOnSpawn = false
    local function criarBotaoFly(parent, txt, pos, setDir)
        local b = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('TwywPuwUkKsJvlCOedzmpozmMWqCmbNLSUGgNpRAoOdibekAdhotkDDVGV4dEJ1dHRvbg=='), parent)
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
        Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('SdELsKAZxxFRCfweWJfqyFvwehXqIJfPmiCzHKvziZScOuKPobbeddvVUlDb3JuZXI='), b).CornerRadius = UDim.new(0, 8)
        local st = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('amDNJjPZRbifowyiiTEiSLdyEuutzuSGJBPMECykalWBVBkoUUVBwvDVUlTdHJva2U='), b)
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
    local leftPanel = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('kMhxpyAYVExbIiERxjdoerouwKuiaXeuLWGkTYJPSNvGsgIGwTlbyJHRnJhbWU='), flyGui)
    leftPanel.Size = UDim2.new(0, 150, 0, 150)
    leftPanel.Position = UDim2.new(0, 20, 0.55, 0)
    leftPanel.BackgroundTransparency = 1
    criarBotaoFly(leftPanel, iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('WqeYMSyPBoySRfCJTwqMotULiVjFslCsNvPNRTFdHCuqdUgFUALxJKi4pay'), UDim2.new(0.5, -22, 0, 0), Vector3.new(0, 0, -1))
    criarBotaoFly(leftPanel, iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('RhLczUrhqphvVRvfGzEcDcXNkcJPNuetOVhjinlmqCfBjAOluXdoWuV4peE'), UDim2.new(0, 0, 0.5, -22), Vector3.new(-1, 0, 0))
    criarBotaoFly(leftPanel, iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('BqeiBLDhOXUzXZqlrvukgyYuIYcnuYrQZHykGmJsAyMPsOOSYQcpBSy4pa6'), UDim2.new(1, -45, 0.5, -22), Vector3.new(1, 0, 0))
    criarBotaoFly(leftPanel, iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('SCydlhhncUyvQpgJMWOKkLuLTREMdndNrUJZSjwaLXTcqjPFHhmDQpM4pa8'), UDim2.new(0.5, -22, 1, -45), Vector3.new(0, 0, 1))
    local rightPanel = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('jzzzNvPXmumiquGZwcCdTgvFmHyGSPDPOWGMSSFpcuMUzTXLbqoIzysRnJhbWU='), flyGui)
    rightPanel.Size = UDim2.new(0, 45, 0, 100)
    rightPanel.Position = UDim2.new(1, -65, 0.55, 0)
    rightPanel.BackgroundTransparency = 1
    criarBotaoFly(rightPanel, iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('XguQaIseEiueTxniCeLWdElVvinpqfYctaVBiCniSFQrrwOUScCWQzz4qyG'), UDim2.new(0, 0, 0, 0), Vector3.new(0, 1, 0))
    criarBotaoFly(rightPanel, iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('CwdkvqaQSSubdrsnvZcIywfQghdXJWLLYMPXZRpOhnokewmfOHttHEW4qyH'), UDim2.new(0, 0, 1, -45), Vector3.new(0, -1, 0))
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('RXozaBHQCxNgMJxTHQFcqsddFbZtYpSRLnKfTVvDMHlQHVxXHjDbkMmSHVtYW5vaWRSb290UGFydA=='))
    if hrp then
        flyBV = Instance.new(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('yctpXECwlsUSMDjOXPwHaGLjtFRzsOcxauxOYSOIiwsJwxxsPmyJIGRQm9keVZlbG9jaXR5'))
        flyBV.Name = iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('qoiHoLzgvgouHzoFmQtjxwwflvhljfUIOeXkpWgvOpmbuZHddpvjWvaVm9pZEZseUJW')
        flyBV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        flyBV.Velocity = Vector3.zero
        flyBV.Parent = hrp
    end
    task.spawn(function()
        while flyActive do
            pcall(function()
                local c = LocalPlayer.Character
                local r = c and c:FindFirstChild(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('JvtxxVpJLxZgCTWCCuEdtibILbbBTvLTQIkzDGfZXEuVVdTjIRcWuhPSHVtYW5vaWRSb290UGFydA=='))
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
            local hrp = p.Character:FindFirstChild(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('JLEAioUwDRxZLnJWFlRUgxIFudNvLeRuLnQhQWkdlevuDqXDODHtePuSHVtYW5vaWRSb290UGFydA=='))
            local hum = p.Character:FindFirstChildOfClass(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('GUJRXwiwUudAvfdhNUeIqZrClelsCyNafiWMRybjwxgURkOqGMHrUlWSHVtYW5vaWQ='))
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
    local hum = char and char:FindFirstChildOfClass(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('eCfkaocvSpQvfIfZsHygEKkKzSsbeNkVpneMFwTzrXXwXNlcthLNORSSHVtYW5vaWQ='))
    local hrp = char and char:FindFirstChild(iBLlSiksmJLZQWtlUUNQsgHNlGxHflkDqhJXuZGUSjPBbiXxEgkXu('UYbFUMNYRtTUjGtWNFJCcEwcKfeBcuKbLPTLbdstXJwBvsIDRaUmuuRSHVtYW5vaWRSb290UGFydA=='))
    if not hum or not hrp then return end

    local colisoes = {}
    for _, part in ipairs(char:GetDescendants()) do
        if pa    
