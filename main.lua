local v0 = game:GetService("Players")
local v1 = game:GetService("TweenService")
local v2 = game:GetService("UserInputService")
local v3 = v0.LocalPlayer
local v4 = v3:WaitForChild("PlayerGui")

local v5 = Instance.new("ScreenGui")
v5.Name = "KeySystemGUI"
v5.ResetOnSpawn = false
v5.Parent = v4

local v9 = Instance.new("Frame")
v9.Name = "MainFrame"
v9.Size = UDim2.new(0, 520, 0, 320)
v9.Position = UDim2.new(0.5, -260, 0.5, -160)
v9.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
v9.BorderSizePixel = 0
v9.Active = true
v9.Parent = v5

local v17 = Instance.new("UICorner")
v17.CornerRadius = UDim.new(0, 16)
v17.Parent = v9

local v20 = Instance.new("UIStroke")
v20.Color = Color3.fromRGB(80, 120, 255)
v20.Thickness = 2
v20.Parent = v9

local v24 = Instance.new("TextLabel")
v24.Name = "Title"
v24.Size = UDim2.new(1, 0, 0, 60)
v24.BackgroundTransparency = 1
v24.Text = "KRYOHUB KEY SYSTEM"
v24.TextColor3 = Color3.fromRGB(255, 255, 255)
v24.TextScaled = true
v24.Font = Enum.Font.GothamBold
v24.Parent = v9

local v34 = Instance.new("UIGradient")
v34.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 180, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 100, 255))
})
v34.Parent = v24

local v37 = Instance.new("Frame")
v37.Size = UDim2.new(0.5, -20, 1, -90)
v37.Position = UDim2.new(0, 20, 0, 70)
v37.BackgroundTransparency = 1
v37.Parent = v9

local v42 = Instance.new("Frame")
v42.Size = UDim2.new(0.5, -20, 1, -90)
v42.Position = UDim2.new(0.5, 10, 0, 70)
v42.BackgroundTransparency = 1
v42.Parent = v9

local v47 = Instance.new("TextBox")
v47.Size = UDim2.new(1, 0, 0, 50)
v47.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
v47.PlaceholderText = "Enter your key here..."
v47.Text = ""
v47.TextColor3 = Color3.fromRGB(255, 255, 255)
v47.TextScaled = true
v47.Font = Enum.Font.Gotham
v47.Parent = v37
Instance.new("UICorner", v47).CornerRadius = UDim.new(0, 12)

local v58 = Instance.new("TextButton")
v58.Size = UDim2.new(1, 0, 0, 60)
v58.Position = UDim2.new(0, 0, 0, 65)
v58.BackgroundColor3 = Color3.fromRGB(70, 130, 255)
v58.Text = "CHECK KEY"
v58.TextColor3 = Color3.fromRGB(255, 255, 255)
v58.TextScaled = true
v58.Font = Enum.Font.GothamBold
v58.Parent = v37
Instance.new("UICorner", v58).CornerRadius = UDim.new(0, 12)

local v68 = Instance.new("TextLabel")
v68.Size = UDim2.new(1, 0, 0, 40)
v68.BackgroundTransparency = 1
v68.Text = "Get Key"
v68.TextColor3 = Color3.fromRGB(180, 180, 200)
v68.TextScaled = true
v68.Font = Enum.Font.GothamSemibold
v68.Parent = v42

local v77 = Instance.new("TextButton")
v77.Size = UDim2.new(1, 0, 0, 80)
v77.Position = UDim2.new(0, 0, 0, 50)
v77.BackgroundColor3 = Color3.fromRGB(100, 220, 120)
v77.Text = "COPY LINK"
v77.TextColor3 = Color3.fromRGB(255, 255, 255)
v77.TextScaled = true
v77.Font = Enum.Font.GothamBold
v77.Parent = v42
Instance.new("UICorner", v77).CornerRadius = UDim.new(0, 12)

local v87 = Instance.new("TextLabel")
v87.Size = UDim2.new(1, -40, 0, 30)
v87.Position = UDim2.new(0, 20, 1, -45)
v87.BackgroundTransparency = 1
v87.Text = "Status: Ready"
v87.TextColor3 = Color3.fromRGB(160, 160, 170)
v87.TextScaled = true
v87.Font = Enum.Font.Gotham
v87.Parent = v9

-- ✅ Enlace actualizado
local v96 = "https://www.roblox.com.ml/communities/464208770333/KRYOHUB"

local function v97(v103, v104, v105)
    v103.MouseEnter:Connect(function()
        v1:Create(v103, TweenInfo.new(0.2), {BackgroundColor3 = v105}):Play()
    end)
    v103.MouseLeave:Connect(function()
        v1:Create(v103, TweenInfo.new(0.2), {BackgroundColor3 = v104}):Play()
    end)
end

v97(v58, Color3.fromRGB(70, 130, 255), Color3.fromRGB(90, 150, 255))
v97(v77, Color3.fromRGB(100, 220, 120), Color3.fromRGB(120, 240, 140))

v77.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(v96)
        v87.Text = "✅ Link copied!"
        v87.TextColor3 = Color3.fromRGB(100, 255, 140)
    else
        v87.Text = "❌ setclipboard not available"
        v87.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
    task.delay(2, function()
        v87.Text = "Status: Ready"
        v87.TextColor3 = Color3.fromRGB(160, 160, 170)
    end)
end)

local function v98(v106)
    local v107 = {"KRYO-TEST-KEY", "OTRA-CLAVE-AQUI"}
    for v117, v118 in ipairs(v107) do
        if v106 == v118 then
            return true
        end
    end
    return false
end

v58.MouseButton1Click:Connect(function()
    local v108 = v47.Text:upper():gsub("%s+", "")
    if v108 == "" then
        v87.Text = "❌ Please enter a key!"
        v87.TextColor3 = Color3.fromRGB(255, 100, 100)
        return
    end
    v87.Text = "🔄 Checking..."
    v87.TextColor3 = Color3.fromRGB(255, 200, 100)
    task.wait(0.8)
    if v98(v108) then
        v87.Text = "✅ Success! Loading..."
        v87.TextColor3 = Color3.fromRGB(100, 255, 140)
        task.delay(1.5, function()
            v5:Destroy()
        end)
    else
        v87.Text = "❌ Invalid Key"
        v87.TextColor3 = Color3.fromRGB(255, 80, 80)
    end
end)

-- Drag functionality
local v99 = false
local v100, v101, v102

v24.InputBegan:Connect(function(v111)
    if v111.UserInputType == Enum.UserInputType.MouseButton1 then
        v99 = true
        v101 = v111.Position
        v102 = v9.Position
    end
end)

v24.InputChanged:Connect(function(v112)
    if v112.UserInputType == Enum.UserInputType.MouseMovement then
        v100 = v112
    end
end)

v2.InputChanged:Connect(function(v113)
    if v99 and (v113 == v100) then
        local v131 = v113.Position - v101
        v9.Position = UDim2.new(
            v102.X.Scale,
            v102.X.Offset + v131.X,
            v2.Y.Scale,
            v102.Y.Offset + v131.Y
        )
    end
end)

v2.InputEnded:Connect(function(v114)
    if v114.UserInputType == Enum.UserInputType.MouseButton1 then
        v99 = false
    end
end)

print("✅ KRYOHUB Key System GUI Loaded Correctly!")
