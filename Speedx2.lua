-- NOVA SCRIPTOR v1.0 - SPEED BOOST V3
-- Tăng tốc x2 chính xác, UI đẹp, kéo thả mượt toàn màn hình

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Xóa UI cũ
if playerGui:FindFirstChild("VND_SpeedGUI") then
    playerGui:FindFirstChild("VND_SpeedGUI"):Destroy()
end

-- ====================================================================
-- 1. UI DESIGN (Glassmorphism Premium)
-- ====================================================================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "VND_SpeedGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Khung chính
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 230, 0, 110)
mainFrame.Position = UDim2.new(0.5, -115, 0.4, -55)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
mainFrame.BackgroundTransparency = 0.12
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = false
mainFrame.Parent = screenGui

-- Shadow
local shadow = Instance.new("Frame")
shadow.Size = UDim2.new(1, 4, 1, 4)
shadow.Position = UDim2.new(0, 2, 0, 2)
shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
shadow.BackgroundTransparency = 0.5
shadow.BorderSizePixel = 0
shadow.ZIndex = 0
shadow.Parent = mainFrame

local shadowCorner = Instance.new("UICorner")
shadowCorner.CornerRadius = UDim.new(0, 12)
shadowCorner.Parent = shadow

-- Bo tròn
local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 12)
frameCorner.Parent = mainFrame

-- Viền
local frameStroke = Instance.new("UIStroke")
frameStroke.Color = Color3.fromRGB(60, 65, 85)
frameStroke.Thickness = 1.5
frameStroke.Parent = mainFrame

-- Icon VND
local iconLabel = Instance.new("TextLabel")
iconLabel.Size = UDim2.new(0, 35, 0, 35)
iconLabel.Position = UDim2.new(0, 12, 0, 8)
iconLabel.BackgroundTransparency = 1
iconLabel.Text = "V"
iconLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
iconLabel.TextSize = 28
iconLabel.Font = Enum.Font.GothamBold
iconLabel.TextXAlignment = Enum.TextXAlignment.Center
iconLabel.Parent = mainFrame

-- Brand Label
local brandLabel = Instance.new("TextLabel")
brandLabel.Size = UDim2.new(0, 80, 0, 20)
brandLabel.Position = UDim2.new(0, 50, 0, 16)
brandLabel.BackgroundTransparency = 1
brandLabel.Text = "SPEED BOOST"
brandLabel.TextColor3 = Color3.fromRGB(200, 205, 220)
brandLabel.TextSize = 12
brandLabel.Font = Enum.Font.GothamBold
brandLabel.TextXAlignment = Enum.TextXAlignment.Left
brandLabel.Parent = mainFrame

-- Sub Label
local subLabel = Instance.new("TextLabel")
subLabel.Size = UDim2.new(0, 100, 0, 14)
subLabel.Position = UDim2.new(0, 50, 0, 32)
subLabel.BackgroundTransparency = 1
subLabel.Text = "x2 Speed Boost"
subLabel.TextColor3 = Color3.fromRGB(100, 110, 130)
subLabel.TextSize = 9
subLabel.Font = Enum.Font.Gotham
subLabel.TextXAlignment = Enum.TextXAlignment.Left
subLabel.Parent = mainFrame

-- Divider
local divider = Instance.new("Frame")
divider.Size = UDim2.new(1, -24, 0, 1)
divider.Position = UDim2.new(0, 12, 0, 50)
divider.BackgroundColor3 = Color3.fromRGB(40, 45, 60)
divider.BorderSizePixel = 0
divider.Parent = mainFrame

-- Status Label
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(0, 120, 0, 25)
statusLabel.Position = UDim2.new(0, 12, 0, 62)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "🔴 Speed OFF"
statusLabel.TextColor3 = Color3.fromRGB(200, 70, 70)
statusLabel.TextSize = 13
statusLabel.Font = Enum.Font.GothamSemibold
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.Parent = mainFrame

-- ====================================================================
-- 2. TOGGLE SWITCH (Premium)
-- ====================================================================
local toggleBg = Instance.new("Frame")
toggleBg.Size = UDim2.new(0, 46, 0, 24)
toggleBg.Position = UDim2.new(1, -58, 0, 62)
toggleBg.BackgroundColor3 = Color3.fromRGB(45, 45, 58)
toggleBg.BorderSizePixel = 0
toggleBg.Parent = mainFrame

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(1, 0)
toggleCorner.Parent = toggleBg

-- Glow
local glow = Instance.new("Frame")
glow.Size = UDim2.new(1, 8, 1, 8)
glow.Position = UDim2.new(0, -4, 0, -4)
glow.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
glow.BackgroundTransparency = 0.8
glow.BorderSizePixel = 0
glow.Visible = false
glow.ZIndex = 0
glow.Parent = toggleBg

local glowCorner = Instance.new("UICorner")
glowCorner.CornerRadius = UDim.new(1, 0)
glowCorner.Parent = glow

-- Ball
local toggleBall = Instance.new("Frame")
toggleBall.Size = UDim2.new(0, 19, 0, 19)
toggleBall.Position = UDim2.new(0, 3, 0.5, -9.5)
toggleBall.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
toggleBall.BorderSizePixel = 0
toggleBall.Parent = toggleBg

local ballCorner = Instance.new("UICorner")
ballCorner.CornerRadius = UDim.new(1, 0)
ballCorner.Parent = toggleBall

-- Ball Shadow
local ballShadow = Instance.new("Frame")
ballShadow.Size = UDim2.new(1, 2, 1, 2)
ballShadow.Position = UDim2.new(0, 1, 0, 1)
ballShadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ballShadow.BackgroundTransparency = 0.3
ballShadow.BorderSizePixel = 0
ballShadow.ZIndex = 0
ballShadow.Parent = toggleBall

local ballShadowCorner = Instance.new("UICorner")
ballShadowCorner.CornerRadius = UDim.new(1, 0)
ballShadowCorner.Parent = ballShadow

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(1, 0, 1, 0)
toggleButton.BackgroundTransparency = 1
toggleButton.Text = ""
toggleButton.Parent = toggleBg

-- ====================================================================
-- 3. DRAGGING SYSTEM (Đã sửa lỗi giới hạn góc màn hình - Siêu mượt)
-- ====================================================================
local isDragging = false
local dragStart = nil
local frameStart = nil

-- Tạo thanh kéo ở trên cùng
local dragBar = Instance.new("Frame")
dragBar.Size = UDim2.new(1, 0, 0, 30)
dragBar.Position = UDim2.new(0, 0, 0, 0)
dragBar.BackgroundTransparency = 1
dragBar.Parent = mainFrame

-- Thêm TextLabel để hiển thị khu vực kéo
local dragHint = Instance.new("TextLabel")
dragHint.Size = UDim2.new(1, -12, 1, 0)
dragHint.Position = UDim2.new(0, 0, 0, 0)
dragHint.BackgroundTransparency = 1
dragHint.Text = "⠿"
dragHint.TextColor3 = Color3.fromRGB(255, 255, 255)
dragHint.TextSize = 14
dragHint.TextTransparency = 0.4
dragHint.Font = Enum.Font.Gotham
dragHint.TextXAlignment = Enum.TextXAlignment.Right
dragHint.TextYAlignment = Enum.TextYAlignment.Center
dragHint.Parent = dragBar

-- Xử lý kéo thả chuẩn xác theo AbsolutePosition
local function startDrag(input)
    isDragging = true
    dragStart = input.Position
    frameStart = mainFrame.AbsolutePosition -- Lấy vị trí pixel thực tế
    
    TweenService:Create(mainFrame, TweenInfo.new(0.15), {
        BackgroundTransparency = 0.08
    }):Play()
end

local function updateDrag(input)
    if not isDragging then return end
    
    local delta = input.Position - dragStart
    local screenSize = screenGui.AbsoluteSize
    
    -- Tính vị trí pixel mới
    local newX = frameStart.X + delta.X
    local newY = frameStart.Y + delta.Y
    
    -- Giới hạn chuẩn không cho tràn ra ngoài cạnh màn hình
    newX = math.clamp(newX, 0, screenSize.X - mainFrame.AbsoluteSize.X)
    newY = math.clamp(newY, 0, screenSize.Y - mainFrame.AbsoluteSize.Y)
    
    -- Áp dụng bằng Offset thuần túy để tránh lỗi góc cố định
    mainFrame.Position = UDim2.new(0, newX, 0, newY)
end

local function endDrag()
    if isDragging then
        isDragging = false
        
        TweenService:Create(mainFrame, TweenInfo.new(0.15), {
            BackgroundTransparency = 0.12
        }):Play()
    end
end

dragBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or 
       input.UserInputType == Enum.UserInputType.Touch then
        startDrag(input)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or 
       input.UserInputType == Enum.UserInputType.Touch then
        updateDrag(input)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or 
       input.UserInputType == Enum.UserInputType.Touch then
        endDrag()
    end
end)

-- ====================================================================
-- 4. SPEED BOOST ENGINE (x2 chính xác)
-- ====================================================================
local isToggled = false
_G.PvpSpeedActive = false

local function handleSpeedBoost()
    local char = player.Character
    if not char then return end
    
    local hum = char:FindFirstChildOfClass("Humanoid")
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hum or not hrp then return end
    
    if _G.PvpSpeedActive and hum.MoveDirection.Magnitude > 0 then
        local targetSpeed = 32
        local currentSpeed = hum.WalkSpeed
        local addPerFrame = (targetSpeed - currentSpeed) / 60
        hrp.CFrame = hrp.CFrame + (hum.MoveDirection * addPerFrame)
    end
end

RunService.Heartbeat:Connect(handleSpeedBoost)

-- ====================================================================
-- 5. TOGGLE HANDLER
-- ====================================================================
local function toggleSpeed()
    isToggled = not isToggled
    _G.PvpSpeedActive = isToggled
    
    local ballPos = isToggled and UDim2.new(1, -22, 0.5, -9.5) or UDim2.new(0, 3, 0.5, -9.5)
    local bgColor = isToggled and Color3.fromRGB(0, 180, 255) or Color3.fromRGB(45, 45, 58)
    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    TweenService:Create(toggleBall, tweenInfo, {Position = ballPos}):Play()
    TweenService:Create(toggleBg, tweenInfo, {BackgroundColor3 = bgColor}):Play()
    
    glow.Visible = isToggled
    if isToggled then
        TweenService:Create(glow, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
            BackgroundTransparency = 0.5
        }):Play()
    end
    
    if isToggled then
        statusLabel.Text = "🟢 Speed ON (x2)"
        statusLabel.TextColor3 = Color3.fromRGB(0, 200, 100)
    else
        statusLabel.Text = "🔴 Speed OFF"
        statusLabel.TextColor3 = Color3.fromRGB(200, 70, 70)
    end
    
    print("[VND] Speed Boost:", isToggled and "ON" or "OFF")
end

toggleButton.MouseButton1Click:Connect(toggleSpeed)

-- ====================================================================
-- 6. KEYBIND (Phím V)
-- ====================================================================
UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.V then
        toggleSpeed()
    end
end)

-- ====================================================================
-- 7. TỰ ĐỘNG TẮT KHI RESPAWN
-- ====================================================================
player.CharacterAdded:Connect(function()
    if isToggled then
        task.wait(0.5)
        _G.PvpSpeedActive = true
    end
end)

-- ====================================================================
-- 8. DEBUG
-- ====================================================================
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━")
print("🚀 VND SPEED BOOST V3")
print("⚡ Toggle: Click or Press V")
print("🎯 Speed x2 chính xác")
print("✅ Đã FIX lỗi kéo thả full màn hình!")
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━")
