local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- 1. Tạo nhanh giao diện UI hiển thị tốc độ
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SpeedometerGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(0, 200, 0, 50)
textLabel.Position = UDim2.new(0.5, -100, 0.85, 0) -- Đặt ở giữa, gần cạnh dưới màn hình
textLabel.BackgroundTransparency = 0.4
textLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
textLabel.TextColor3 = Color3.fromRGB(0, 255, 128) -- Màu xanh neon cho chất game
textLabel.TextSize = 22
textLabel.Font = Enum.Font.RobotoMono -- Font chữ dạng điện tử
textLabel.BorderSizePixel = 0
textLabel.Parent = screenGui

-- Thêm góc bo tròn cho đẹp mắt
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 8)
uiCorner.Parent = textLabel

-- 2. Hàm cập nhật tốc độ mỗi khung hình
local function updateSpeed()
	if humanoidRootPart then
		-- AssemblyLinearVelocity lấy vận tốc vector thực tế của nhân vật
		-- .Magnitude chuyển đổi vector đó thành một con số (độ lớn tốc độ)
		local speed = humanoidRootPart.AssemblyLinearVelocity.Magnitude
		
		-- Làm tròn đến số thập phân thứ nhất cho đỡ rối mắt
		textLabel.Text = string.format("Tốc độ: %.1f s/s", speed)
	end
end

-- Kết nối hàm vào hệ thống render của game
RunService.RenderStepped:Connect(updateSpeed)

-- 3. Cập nhật lại thông tin khi nhân vật bị reset/hồi sinh
player.CharacterAdded:Connect(function(newCharacter)
	character = newCharacter
	humanoidRootPart = character:WaitForChild("HumanoidRootPart")
end)
