local Linux = {}

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LinuxGui"
screenGui.Parent = game.CoreGui
screenGui.ResetOnSpawn = false

local Theme = {
    Name = "Dark",
    Accent = Color3.fromRGB(40, 80, 120),
    Main = Color3.fromRGB(20, 20, 20),
    Border = Color3.fromRGB(50, 50, 50),
    TitleBar = Color3.fromRGB(30, 30, 30),
    Tab = Color3.fromRGB(40, 40, 40),
    Element = Color3.fromRGB(50, 50, 50),
    ElementBorder = Color3.fromRGB(25, 25, 25),
    InElementBorder = Color3.fromRGB(60, 60, 60),
    ElementTransparency = 0,
    ToggleSlider = Color3.fromRGB(40, 40, 40),
    ToggleToggled = Color3.fromRGB(40, 80, 120),
    SliderRail = Color3.fromRGB(60, 60, 60),
    DropdownComponent = Color3.fromRGB(40, 80, 120),
    Input = Color3.fromRGB(70, 70, 70),
    InputFocused = Color3.fromRGB(10, 10, 10),
    InputIndicator = Color3.fromRGB(100, 100, 100),
    Dialog = Color3.fromRGB(30, 30, 30),
    DialogHolder = Color3.fromRGB(25, 25, 25),
    DialogHolderLine = Color3.fromRGB(20, 20, 20),
    DialogButton = Color3.fromRGB(30, 30, 30),
    DialogButtonBorder = Color3.fromRGB(50, 50, 50),
    DialogBorder = Color3.fromRGB(40, 40, 40),
    DialogInput = Color3.fromRGB(35, 35, 35),
    DialogInputLine = Color3.fromRGB(100, 100, 100),
    Text = Color3.fromRGB(200, 200, 200),
    SubText = Color3.fromRGB(150, 150, 150)
}

function Linux:CreateWindow(title)
    local window = {}
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 580, 0, 360)
    mainFrame.Position = UDim2.new(0.5, -290, 0.5, -180)
    mainFrame.BackgroundColor3 = Theme.Main
    mainFrame.BorderSizePixel = 0
    mainFrame.ClipsDescendants = true
    mainFrame.Active = true
    mainFrame.Draggable = true
    mainFrame.Parent = screenGui

    local glow = Instance.new("UIStroke")
    glow.Thickness = 2
    glow.Color = Theme.Border
    glow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    glow.Parent = mainFrame

    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 40)
    titleBar.BackgroundColor3 = Theme.TitleBar
    titleBar.BorderSizePixel = 0
    titleBar.Parent = mainFrame

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -30, 1, 0)
    titleLabel.Position = UDim2.new(0, 5, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Theme.Text
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 18
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = titleBar

    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 20, 0, 20)
    closeButton.Position = UDim2.new(1, -25, 0, 10)
    closeButton.BackgroundTransparency = 1
    closeButton.Text = "X"
    closeButton.TextColor3 = Theme.Text
    closeButton.Font = Enum.Font.GothamBold
    closeButton.TextSize = 18
    closeButton.Parent = titleBar
    closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)

    local tabList = Instance.new("ScrollingFrame")
    tabList.Size = UDim2.new(0, 140, 1, -40)
    tabList.Position = UDim2.new(0, 0, 0, 40)
    tabList.BackgroundColor3 = Theme.ElementBorder
    tabList.BorderSizePixel = 0
    tabList.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabList.ScrollBarThickness = 0
    tabList.Parent = mainFrame

    local tabContent = Instance.new("ScrollingFrame")
    tabContent.Size = UDim2.new(1, -140, 1, -40)
    tabContent.Position = UDim2.new(0, 140, 0, 40)
    tabContent.BackgroundTransparency = 1
    tabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabContent.ScrollBarThickness = 0
    tabContent.Parent = mainFrame

    local tabTitleLabel = Instance.new("TextLabel")
    tabTitleLabel.Size = UDim2.new(1, -20, 0, 30)
    tabTitleLabel.Position = UDim2.new(0, 10, 0, 0)
    tabTitleLabel.BackgroundTransparency = 1
    tabTitleLabel.Text = ""
    tabTitleLabel.TextColor3 = Theme.Text
    tabTitleLabel.Font = Enum.Font.GothamBold
    tabTitleLabel.TextSize = 20
    tabTitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    tabTitleLabel.Parent = tabContent

    local tabLayout = Instance.new("UIListLayout")
    tabLayout.Padding = UDim.new(0, 5)
    tabLayout.Parent = tabList

    local tabs = {}
    local currentTab = nil

    function window:AddTab(tabName, iconId)
        local tab = {}
        local tabButton = Instance.new("TextButton")
        tabButton.Size = UDim2.new(1, -10, 0, 40)
        tabButton.BackgroundColor3 = Theme.Tab
        tabButton.Text = ""
        tabButton.Parent = tabList

        if iconId then
            local icon = Instance.new("ImageLabel")
            icon.Size = UDim2.new(0, 20, 0, 20)
            icon.Position = UDim2.new(0, 5, 0, 10)
            icon.BackgroundTransparency = 1
            icon.Image = "rbxassetid://" .. tostring(iconId)
            icon.Parent = tabButton
        end

        local tabLabel = Instance.new("TextLabel")
        tabLabel.Size = UDim2.new(1, iconId and -30 or -5, 1, 0)
        tabLabel.Position = UDim2.new(0, iconId and 30 or 5, 0, 0)
        tabLabel.BackgroundTransparency = 1
        tabLabel.Text = tabName
        tabLabel.TextColor3 = Theme.SubText
        tabLabel.Font = Enum.Font.Gotham
        tabLabel.TextSize = 16
        tabLabel.TextXAlignment = Enum.TextXAlignment.Left
        tabLabel.Parent = tabButton

        local tabFrame = Instance.new("Frame")
        tabFrame.Size = UDim2.new(1, 0, 1, -30)
        tabFrame.Position = UDim2.new(0, 0, 0, 30)
        tabFrame.BackgroundTransparency = 1
        tabFrame.Visible = false
        tabFrame.Parent = tabContent

        local contentLayout = Instance.new("UIListLayout")
        contentLayout.Padding = UDim.new(0, 10)
        contentLayout.Parent = tabFrame

        tabButton.MouseButton1Click:Connect(function()
            if currentTab then
                currentTab.Visible = false
                tabs[currentTab].Button.BackgroundColor3 = Theme.Tab
            end
            tabFrame.Visible = true
            tabButton.BackgroundColor3 = Theme.Accent
            currentTab = tabFrame
            tabTitleLabel.Text = tabName
            tabContent.CanvasSize = UDim2.new(0, 0, 0, contentLayout.AbsoluteContentSize.Y + 30)
        end)

        contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            tabContent.CanvasSize = UDim2.new(0, 0, 0, contentLayout.AbsoluteContentSize.Y + 30)
        end)

        tabs[tabFrame] = {Button = tabButton}
        table.insert(tabs, tabFrame)
        tabList.CanvasSize = UDim2.new(0, 0, 0, tabLayout.AbsoluteContentSize.Y)
        if #tabs == 1 then
            tabFrame.Visible = true
            tabButton.BackgroundColor3 = Theme.Accent
            currentTab = tabFrame
            tabTitleLabel.Text = tabName
            tabContent.CanvasSize = UDim2.new(0, 0, 0, contentLayout.AbsoluteContentSize.Y + 30)
        end

        function tab:AddSection(title)
            local sectionFrame = Instance.new("Frame")
            sectionFrame.Size = UDim2.new(1, -20, 0, 25)
            sectionFrame.BackgroundTransparency = 1
            sectionFrame.Parent = tabFrame

            local sectionLabel = Instance.new("TextLabel")
            sectionLabel.Size = UDim2.new(1, 0, 1, 0)
            sectionLabel.BackgroundTransparency = 1
            sectionLabel.Text = title
            sectionLabel.TextColor3 = Theme.SubText
            sectionLabel.Font = Enum.Font.GothamBold
            sectionLabel.TextSize = 14
            sectionLabel.TextXAlignment = Enum.TextXAlignment.Left
            sectionLabel.Parent = sectionFrame
        end

        function tab:AddButton(config)
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(1, -20, 0, 40)
            button.BackgroundColor3 = Theme.Element
            button.Text = config.Title
            button.TextColor3 = Theme.Text
            button.Font = Enum.Font.Gotham
            button.TextSize = 16
            button.Parent = tabFrame

            button.MouseButton1Click:Connect(function()
                if config.Callback then config.Callback() end
            end)
        end

        function tab:AddDropdown(id, config)
            local dropdown = Instance.new("Frame")
            dropdown.Size = UDim2.new(1, -20, 0, 40)
            dropdown.BackgroundColor3 = Theme.DropdownComponent
            dropdown.Parent = tabFrame

            local button = Instance.new("TextButton")
            button.Size = UDim2.new(1, 0, 1, 0)
            button.BackgroundTransparency = 1
            button.Text = ""
            button.Parent = dropdown

            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, -40, 1, 0)
            label.Position = UDim2.new(0, 10, 0, 0)
            label.BackgroundTransparency = 1
            label.Text = config.Title .. ": " .. (config.Default or "None")
            label.TextColor3 = Theme.Text
            label.Font = Enum.Font.Gotham
            label.TextSize = 16
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.Parent = dropdown

            local arrow = Instance.new("ImageLabel")
            arrow.Size = UDim2.new(0, 20, 0, 20)
            arrow.Position = UDim2.new(1, -30, 0, 10)
            arrow.BackgroundTransparency = 1
            arrow.Image = "rbxassetid://10709790948"
            arrow.ImageColor3 = Theme.SubText
            arrow.Parent = dropdown

            local dropdownFrame = Instance.new("Frame")
            dropdownFrame.Size = UDim2.new(1, -20, 0, 0)
            dropdownFrame.Position = UDim2.new(0, 10, 1, 5)
            dropdownFrame.BackgroundColor3 = Theme.DropdownComponent
            dropdownFrame.ClipsDescendants = true
            dropdownFrame.Visible = false
            dropdownFrame.Parent = tabFrame

            local dropdownLayout = Instance.new("UIListLayout")
            dropdownLayout.Padding = UDim.new(0, 2)
            dropdownLayout.Parent = dropdownFrame

            local values = config.Values or {}
            local selectedValue = config.Default
            local onChanged = config.OnChanged or function() end
            local isOpen = false

            local function updateDropdownFrame()
                for _, child in pairs(dropdownFrame:GetChildren()) do
                    if child:IsA("TextButton") then child:Destroy() end
                end
                for i, value in pairs(values) do
                    local option = Instance.new("TextButton")
                    option.Size = UDim2.new(1, 0, 0, 25)
                    option.BackgroundColor3 = Theme.DropdownComponent
                    option.Text = value
                    option.TextColor3 = Theme.Text
                    option.Font = Enum.Font.Gotham
                    option.TextSize = 14
                    option.Parent = dropdownFrame

                    option.MouseButton1Click:Connect(function()
                        selectedValue = value
                        label.Text = config.Title .. ": " .. value
                        isOpen = false
                        TweenService:Create(dropdownFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(1, -20, 0, 0)}):Play()
                        TweenService:Create(arrow, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Rotation = 0, Image = "rbxassetid://10709790948"}):Play()
                        task.delay(0.3, function() dropdownFrame.Visible = false end)
                        onChanged(value)
                    end)
                end
            end

            updateDropdownFrame()

            button.MouseButton1Click:Connect(function()
                isOpen = not isOpen
                if isOpen then
                    dropdownFrame.Visible = true
                    TweenService:Create(dropdownFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(1, -20, 0, #values * 27)}):Play()
                    TweenService:Create(arrow, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Rotation = 0, Image = "rbxassetid://10709791523"}):Play()
                else
                    TweenService:Create(dropdownFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(1, -20, 0, 0)}):Play()
                    TweenService:Create(arrow, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Rotation = 0, Image = "rbxassetid://10709790948"}):Play()
                    task.delay(0.3, function() dropdownFrame.Visible = false end)
                end
            end)

            return {
                SetValues = function(newValues)
                    values = newValues
                    updateDropdownFrame()
                    if isOpen then
                        dropdownFrame.Size = UDim2.new(1, -20, 0, #values * 27)
                    end
                end,
                SetValue = function(value)
                    selectedValue = value
                    label.Text = config.Title .. ": " .. (value or "None")
                    onChanged(value)
                end
            }
        end

        function tab:AddToggle(id, config)
            local toggle = Instance.new("Frame")
            toggle.Size = UDim2.new(1, -20, 0, 40)
            toggle.BackgroundColor3 = Theme.Element
            toggle.Parent = tabFrame

            local button = Instance.new("TextButton")
            button.Size = UDim2.new(1, 0, 1, 0)
            button.BackgroundTransparency = 1
            button.Text = ""
            button.Parent = toggle

            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, -60, 1, 0)
            label.Position = UDim2.new(0, 10, 0, 0)
            label.BackgroundTransparency = 1
            label.Text = config.Title
            label.TextColor3 = Theme.Text
            label.Font = Enum.Font.Gotham
            label.TextSize = 16
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.Parent = toggle

            local switch = Instance.new("Frame")
            switch.Size = UDim2.new(0, 40, 0, 20)
            switch.Position = UDim2.new(1, -50, 0, 10)
            switch.BackgroundColor3 = config.Default and Theme.ToggleToggled or Theme.ToggleSlider
            switch.Parent = toggle

            local knob = Instance.new("Frame")
            knob.Size = UDim2.new(0, 16, 0, 16)
            knob.Position = config.Default and UDim2.new(1, -18, 0, 2) or UDim2.new(0, 2, 0, 2)
            knob.BackgroundColor3 = Theme.Text
            knob.Parent = switch

            local value = config.Default or false
            local onChanged = config.OnChanged or function() end

            button.MouseButton1Click:Connect(function()
                value = not value
                TweenService:Create(switch, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {BackgroundColor3 = value and Theme.ToggleToggled or Theme.ToggleSlider}):Play()
                TweenService:Create(knob, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Position = value and UDim2.new(1, -18, 0, 2) or UDim2.new(0, 2, 0, 2)}):Play()
                onChanged(value)
            end)

            return {
                SetValue = function(newValue)
                    value = newValue
                    TweenService:Create(switch, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {BackgroundColor3 = value and Theme.ToggleToggled or Theme.ToggleSlider}):Play()
                    TweenService:Create(knob, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Position = value and UDim2.new(1, -18, 0, 2) or UDim2.new(0, 2, 0, 2)}):Play()
                    onChanged(value)
                end,
                GetValue = function() return value end
            }
        end

        function tab:AddSlider(id, config)
            local slider = Instance.new("Frame")
            slider.Size = UDim2.new(1, -20, 0, 40)
            slider.BackgroundColor3 = Theme.Element
            slider.Parent = tabFrame

            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, -60, 0, 20)
            label.Position = UDim2.new(0, 10, 0, 0)
            label.BackgroundTransparency = 1
            label.Text = config.Title .. ": " .. config.Default
            label.TextColor3 = Theme.Text
            label.Font = Enum.Font.Gotham
            label.TextSize = 16
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.Parent = slider

            local track = Instance.new("Frame")
            track.Size = UDim2.new(1, -20, 0, 6)
            track.Position = UDim2.new(0, 10, 1, -10)
            track.BackgroundColor3 = Theme.SliderRail
            track.Parent = slider

            local fill = Instance.new("Frame")
            fill.Size = UDim2.new((config.Default - config.Min) / (config.Max - config.Min), 0, 1, 0)
            fill.BackgroundColor3 = Theme.Accent
            fill.Parent = track

            local value = config.Default or config.Min
            local onChanged = config.OnChanged or function() end
            local dragging = false

            slider.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                end
            end)

            slider.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.Touch then
                    dragging = false
                end
            end)

            slider.InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.Touch then
                    local relativeX = math.clamp((input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
                    value = math.floor(config.Min + (config.Max - config.Min) * relativeX / config.Rounding) * config.Rounding
                    fill.Size = UDim2.new(relativeX, 0, 1, 0)
                    label.Text = config.Title .. ": " .. value
                    onChanged(value)
                end
            end)

            return {
                SetValue = function(newValue)
                    value = math.clamp(newValue, config.Min, config.Max)
                    fill.Size = UDim2.new((value - config.Min) / (config.Max - config.Min), 0, 1, 0)
                    label.Text = config.Title .. ": " .. value
                    onChanged(value)
                end,
                GetValue = function() return value end
            }
        end

        function tab:AddInput(id, config)
            local input = Instance.new("Frame")
            input.Size = UDim2.new(1, -20, 0, 40)
            input.BackgroundColor3 = Theme.Element
            input.Parent = tabFrame

            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(0, 100, 1, 0)
            label.Position = UDim2.new(0, 10, 0, 0)
            label.BackgroundTransparency = 1
            label.Text = config.Title
            label.TextColor3 = Theme.Text
            label.Font = Enum.Font.Gotham
            label.TextSize = 16
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.Parent = input

            local textBox = Instance.new("TextBox")
            textBox.Size = UDim2.new(1, -120, 0, 20)
            textBox.Position = UDim2.new(0, 110, 0, 10)
            textBox.BackgroundColor3 = Theme.Input
            textBox.Text = config.Default or ""
            textBox.TextColor3 = Theme.Text
            textBox.Font = Enum.Font.Gotham
            textBox.TextSize = 14
            textBox.TextTruncate = Enum.TextTruncate.AtEnd
            textBox.ClipsDescendants = true
            textBox.Parent = input

            local value = config.Default or ""
            local onChanged = config.OnChanged or function() end

            textBox:GetPropertyChangedSignal("Text"):Connect(function()
                local textSize = game:GetService("TextService"):GetTextSize(textBox.Text, textBox.TextSize, textBox.Font, Vector2.new(textBox.AbsoluteSize.X, 1000))
                if textSize.X > textBox.AbsoluteSize.X then
                    while textSize.X > textBox.AbsoluteSize.X and #textBox.Text > 0 do
                        textBox.Text = textBox.Text:sub(1, -2)
                        textSize = game:GetService("TextService"):GetTextSize(textBox.Text, textBox.TextSize, textBox.Font, Vector2.new(textBox.AbsoluteSize.X, 1000))
                    end
                end
            end)

            textBox.FocusLost:Connect(function()
                if config.Numeric then
                    value = tonumber(textBox.Text) or value
                    textBox.Text = tostring(value)
                else
                    value = textBox.Text
                end
                onChanged(value)
            end)

            return {
                SetValue = function(newValue)
                    value = newValue
                    textBox.Text = tostring(value)
                    local textSize = game:GetService("TextService"):GetTextSize(textBox.Text, textBox.TextSize, textBox.Font, Vector2.new(textBox.AbsoluteSize.X, 1000))
                    if textSize.X > textBox.AbsoluteSize.X then
                        while textSize.X > textBox.AbsoluteSize.X and #textBox.Text > 0 do
                            textBox.Text = textBox.Text:sub(1, -2)
                            textSize = game:GetService("TextService"):GetTextSize(textBox.Text, textBox.TextSize, textBox.Font, Vector2.new(textBox.AbsoluteSize.X, 1000))
                        end
                    end
                    value = textBox.Text
                    onChanged(value)
                end,
                GetValue = function() return value end
            }
        end

        return tab
    end

    return window
end

return Linux
