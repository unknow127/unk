-- AutoGarden Script for Grow a Garden
local player = game.Players.LocalPlayer
local replicatedStorage = game:GetService("ReplicatedStorage")

-- 🛠 Setup leaderstats and Money (optional but useful in test places)
local function setupLeaderstats()
    local stats = player:FindFirstChild("leaderstats")
    if not stats then
        stats = Instance.new("Folder")
        stats.Name = "leaderstats"
        stats.Parent = player
    end

    if not stats:FindFirstChild("Money") then
        local money = Instance.new("IntValue")
        money.Name = "Money"
        money.Value = 0
        money.Parent = stats
    end
end

setupLeaderstats()

-- 💰 Infinite money function
local function giveInfiniteMoney()
    local stats = player:FindFirstChild("leaderstats")
    if stats and stats:FindFirstChild("Money") then
        stats.Money.Value = math.huge
        print("💰 Infinite money applied.")
    else
        warn("⚠️ 'Money' stat not found under leaderstats.")
    end
end

-- 🌻 Planting function
local function plantFlower()
    local plantEvent = replicatedStorage:FindFirstChild("PlantFlower")
    if plantEvent then
        plantEvent:FireServer("Sunflower")
    end
end

-- 🖼 UI Setup
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "InfiniteGarden"

-- 🌻 Plant Button
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

-- 🚀 Auto-Farm Toggle
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

-- ❌ Close Button
local close = Instance.new("TextButton", gui)
close.Size = UDim2.new(0, 200, 0, 40)
close.Position = UDim2.new(0.5, -100, 0.8, 0)
close.Text = "❌ Close UI"
close.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
close.TextScaled = true
close.Font = Enum.Font.FredokaOne
close.TextColor3 = Color3.new(1, 1, 1)

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- 🔁 Auto-Farming Loop
task.spawn(function()
    while true do
        if toggle then
            giveInfiniteMoney()
            plantFlower()
        end
        wait(0.2)
    end
end)
