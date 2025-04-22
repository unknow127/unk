local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- GUI Setup
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "InfiniteShekelsGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 160, 0, 50)
button.Position = UDim2.new(0, 10, 0, 20) -- moved higher
button.Text = "💰 +100K Shekels"
button.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
button.TextScaled = true
button.Font = Enum.Font.GothamBold
button.TextColor3 = Color3.new(0, 0, 0)
button.Parent = screenGui

-- Dragging Function
local dragging = false
local dragStart, startPos

UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 and input.UserInputState == Enum.UserInputState.Begin then
        local mousePos = UserInputService:GetMouseLocation()
        local buttonPos = button.AbsolutePosition
        local buttonSize = button.AbsoluteSize
        if mousePos.X >= buttonPos.X and mousePos.X <= buttonPos.X + buttonSize.X and
           mousePos.Y >= buttonPos.Y and mousePos.Y <= buttonPos.Y + buttonSize.Y then
            dragging = true
            dragStart = input.Position
            startPos = button.Position
        end
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        button.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Add Shekels on Click
local function addShekels(amount)
    local stats = player:FindFirstChild("leaderstats")
    if stats and stats:FindFirstChild("Shekels") then
        stats.Shekels.Value += amount
    else
        warn("Shekels stat not found")
    end
end

button.MouseButton1Click:Connect(function()
    addShekels(100000)
end)

