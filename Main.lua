-- Function to execute the script
local function executeScript(scriptToExecute)
    if scriptToExecute ~= "" then
        local success, errorMsg = pcall(function()
            loadstring(scriptToExecute)()
        end)
        if not success then
            print("Error executing script:", errorMsg)
        else
            print("Script executed successfully.")
        end
    else
        print("Please enter a script to execute.")
    end
end

-- Main function to create the GUI
local function createGUI()
    local gui = Instance.new("ScreenGui")
    gui.Name = "PizzaHub Executor"
    gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.3, 0, 0.5, 0)
    frame.Position = UDim2.new(0.35, 0, 0.25, 0)
    frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    frame.Parent = gui

    local exitButton = Instance.new("TextButton")
    exitButton.Size = UDim2.new(0.1, 0, 0.05, 0)
    exitButton.Position = UDim2.new(0.9, 0, 0, 0)
    exitButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    exitButton.Text = "Exit"
    exitButton.Parent = frame

    local orb = Instance.new("ImageButton")
    orb.Size = UDim2.new(0.05, 0, 0.05, 0)
    orb.Position = UDim2.new(0.9, 0, 0, 0)
    orb.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
    orb.Parent = frame
    orb.Visible = false

    exitButton.MouseButton1Click:Connect(function()
        frame.Visible = false
        orb.Visible = true
    end)

    orb.MouseButton1Click:Connect(function()
        frame.Visible = true
        orb.Visible = false
    end)

    local scriptTextBox = Instance.new("TextBox")
    scriptTextBox.Size = UDim2.new(0.8, 0, 0.6, 0)
    scriptTextBox.Position = UDim2.new(0.1, 0, 0.1, 0)
    scriptTextBox.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    scriptTextBox.Text = ""
    scriptTextBox.TextWrapped = true
    scriptTextBox.Parent = frame

    local executeButton = Instance.new("TextButton")
    executeButton.Size = UDim2.new(0.3, 0, 0.1, 0)
    executeButton.Position = UDim2.new(0.35, 0, 0.75, 0)
    executeButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    executeButton.Text = "Execute"
    executeButton.Parent = frame

    executeButton.MouseButton1Click:Connect(function()
        executeScript(scriptTextBox.Text)
    end)
end

-- Create the GUI
createGUI()
