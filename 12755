-- autogarden.lua (upload this to GitHub or Pastebin RAW)
local player = game.Players.LocalPlayer
local replicatedStorage = game:GetService("ReplicatedStorage")

-- Infinite money
local function giveInfiniteMoney()
    local stats = player:WaitForChild("leaderstats")
    if stats and stats:FindFirstChild("Money") then
        stats.Money.Value = math.huge
    end
end

-- Planting function
local function plantFlower()
    local plantEvent = replicatedStorage:FindFirstChild("PlantFlower")
    if plantEvent then
        plantEvent:FireServer("Sunflower")
    end
end

-- UI setup
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "InfiniteGarden"

local button = Instance.new("TextButton", gui)
button.Size = UDim2.new(0, 200, 0, 50)
button.Position = UDim2.new(0.5, -100, 0.9, 0)
button.Text = "🌻 Plant Flower (∞ Money)"
button.BackgroundColor3 = Color3.fromRGB(85, 170, 85)
button.TextScaled = true
button.Font = Enum.Font.FredokaOne
button.TextColor3 = Color3.new(1, 1, 1)

button.MouseButton1Click:Connect(function()
    giveInfiniteMoney()
    plantFlower()
end)

-- Optional: auto farm toggle
local toggle = false
local auto = Instance.new("TextButton", gui)
auto.Size = UDim2.new(0, 200, 0, 40)
auto.Position = UDim2.new(0.5, -100, 0.85, 0)
auto.Text = "🚀 Toggle Auto-Farm: OFF"
auto.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
auto.TextScaled = true
auto.Font = Enum.Font.FredokaOne
auto.TextColor3 = Color3.new(1, 1, 1)

auto.MouseButton1Click:Connect(function()
    toggle = not toggle
    auto.Text = toggle and "🚀 Toggle Auto-Farm: ON" or "🚀 Toggle Auto-Farm: OFF"
end)

-- Auto loop
task.spawn(function()
    while true do
        if toggle then
            giveInfiniteMoney()
            plantFlower()
        end
        wait(0.2)
    end
end)
