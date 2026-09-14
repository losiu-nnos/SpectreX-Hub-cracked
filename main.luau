-- [[ @ dsc.gg/6vms | by leakd cuhh ]]
-- This Fіlе Wаs Deоbfuѕсatеԁ Вy LeaκD
-- https://leakd.vercel.app

local starterGui = game:GetService("StarterGui")
local coreGui = game:GetService("CoreGui")
local players = game:GetService("Players")
local runService = game:GetService("RunService")
local virtualInputManager = game:GetService("VirtualInputManager")
local userInputService = game:GetService("UserInputService")

pcall(function()
  if coreGui:FindFirstChild("Rayfield") then
    coreGui:FindFirstChild("Rayfield"):Destroy()
  end

  if players.LocalPlayer.PlayerGui:FindFirstChild("Rayfield") then
    players.LocalPlayer.PlayerGui:FindFirstChild("Rayfield"):Destroy()
  end
end)

local rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local window = rayfield:CreateWindow({
  Name = "YBA script by SpectrX_Hub Fixed",
  LoadingTitle = "Loading SpectrX Hub...",
  LoadingSubtitle = "YBA Edition",
  ConfigurationSaving = { Enabled = true, FileName = "SpectrX_Config_Final_v7" },
  KeySystem = false,
  KeySettings = {
    Title = "SpectrX Hub - Key System",
    Subtitle = "Enter your activation key",
    Note = "Join our Telegram for key: t.me/SpectreX_hub",
    FileName = "SpectrX_Key_Final_v7",
    SaveKey = true,
    GrabKeyFromSite = false,
    Key = { "SPX_F7*3JQ&%c" },
  },
})

local localPlayer = players.LocalPlayer
local v1 = false
local v2 = {}

local v3 = {
  ["Mysterious Arrow"] = 25,
  Rokakaka = 25,
  ["Pure Rokakaka"] = 10,
  ["Lucky Arrow"] = 10,
  ["Ancient Scroll"] = 10,
  ["Quinton's Glove"] = 10,
  Diamond = 30,
  ["Steel Ball"] = 10,
  ["Stone Mask"] = 10,
  ["Dio's Diary"] = 10,
  Clackers = 10,
  ["Rib Cage of the Saint's Corpse"] = 20,
  ["Pelvis of the Saint's Corpse"] = 20,
  ["Left Arm of the Saint's Corpse"] = 20,
  ["Heart of the Saint's Corpse"] = 20,
  ["DIO's Bone"] = 10,
  ["Gold Coin"] = 45,
  ["Quinton's Headband"] = 10,
  ["Requiem Arrow"] = 4,
}

local function f1()
  return localPlayer.Character
end

local function f2(p1)
  local count = 0
  local backpack = localPlayer:FindFirstChild("Backpack")
  local v4 = f1()

  if backpack then
    for key, value in pairs(backpack:GetChildren()) do
      if value.Name == p1 then
        count = count + 1
      end
    end
  end

  if v4 then
    for key2, value2 in pairs(v4:GetChildren()) do
      if value2.Name == p1 then
        count = count + 1
      end
    end
  end

  return count
end

local function f3()
  return f1() and f1():FindFirstChild("HumanoidRootPart")
end

local function f4(p2, p3, p4)
  local v5 = f3()

  if not v5 then
    return
  else
    local v6 = p4 and 550 or math.random(150, 300)

    while v1 and p3 and p3.Parent and (v5.Position - p2).Magnitude > 1.5 do
      local position = v5.Position

      v5.Velocity = Vector3.zero
      v5.CFrame = CFrame.new(v5.Position + (p2 - position).Unit * v6 * task.wait(), p2)

      for key3, value3 in pairs(f1():GetDescendants()) do
        if value3:IsA("BasePart") then
          value3.CanCollide = false
        end
      end
    end

    return
  end
end

local function f5(p5)
  local dialogues = workspace:FindFirstChild("Dialogues")

  local shiftPloxTheTravellingMerchant = dialogues
    and (dialogues:FindFirstChild("ShiftPlox, The Travelling Merchant")
      or dialogues:FindFirstChild("ShiftPlox"))

  if not shiftPloxTheTravellingMerchant then
    return
  else
    f4(
      shiftPloxTheTravellingMerchant:GetPivot().Position, shiftPloxTheTravellingMerchant, false
    )

    task.wait(0.5)
    local v7 = f1()
    local remoteEvent = v7 and v7:FindFirstChild("RemoteEvent")
    local v8 = f2(p5)

    if remoteEvent and v8 > 0 then
      local findFirstChild = localPlayer.Backpack:FindFirstChild(p5) or v7:FindFirstChild(p5)

      if findFirstChild then
        v7.Humanoid:EquipTool(findFirstChild)
        task.wait(0.3)
      end

      remoteEvent:FireServer("DialogueInteracted", {
        DialogueName = "Merchant",
        Speaker = "ShiftPlox, The Travelling Merchant",
      })

      for i = 1, v8 do
        remoteEvent:FireServer("EndDialogue", {
          Option = "Option2",
          Dialogue = "Dialogue5",
          NPC = "Merchant",
        })

        task.wait(0.1)
      end
    end

    return
  end
end

local function f6()
  local v9

  while v1 do
    local items = workspace:FindFirstChild("Item_Spawns") and workspace.Item_Spawns.Items
    local v10 = f3()

    if items and v10 then
      local v11 = false
      local huge = math.huge
      local v12 = nil
      local getChildren = items:GetChildren()

      for key4, value4 in pairs(getChildren) do
        local proximityPrompt = value4:FindFirstChildWhichIsA("ProximityPrompt")

        if proximityPrompt
          and (proximityPrompt.ObjectText == "Lucky Arrow"
            or proximityPrompt.ObjectText == "Pure Rokakaka")
          and not v2[value4] then
          v11 = true
          v12 = value4
          break
        end
      end

      if not v12 then
        for key5, value5 in pairs(getChildren) do
          if value5:FindFirstChildWhichIsA("ProximityPrompt") and not v2[value5] then
            local magnitude = (v10.Position - value5:GetPivot().Position).Magnitude

            if magnitude < huge then
              huge = magnitude
              v12 = value5
            end
          end
        end
      end

      if v12 then
        local proximityPrompt2 = v12:FindFirstChildWhichIsA("ProximityPrompt")
        local objectText = proximityPrompt2.ObjectText
        f4(v12:GetPivot().Position, v12, v11)

        if v12 and v12.Parent and v1 then
          v10.CFrame = v12:GetPivot()
          task.wait(0.2)
          local v13 = f2(objectText)
          fireproximityprompt(proximityPrompt2)
          local v14 = tick()

          if not (f2(objectText) > v13) then
            v165 = not v12.Parent or tick() - v14 > 0.6
          end

          repeat
            task.wait(0.1)
            local v15 = f2(objectText) > v13

            v9 = v15
            v9 = v15 or not v12.Parent or tick() - v14 > 0.6
          until v9

          if v12 and v12.Parent and f2(objectText) == v13 then
            if v13 >= (v3[objectText] or 20) then
              f5(objectText)
            else
              v2[v12] = true
            end
          end
        end
      end
    end

    task.wait(0.1)
  end
end

local v16 = false
local v17 = false
local v18 = { [0] = 35, [1] = 40, [2] = 45 }

local v19 = {
  {
    m = 50,
    x = 101,
    n = { "Heaven Ascension Dio", "The Idol", "DEO Over Heaven", "Joe Part 6" },
  },
  { m = 40, x = 50, n = { "Diavolo", "Pucci", "Vanilla Ice" } },
  { m = 30, x = 40, n = { "Dio", "Jotaro", "Jotaro Kujo" } },
  { m = 25, x = 30, n = { "Bucciarati", "Ghiaccio", "Fugo" } },
  { m = 15, x = 25, n = { "Alpha Thug" } }, { m = 10, x = 15, n = { "Leaky Eye Luca" } },
  { m = 0, x = 10, n = { "Security Guard", "Corrupt Police" } },
}

local function f7(p6)
  local playerStats = localPlayer:FindFirstChild("PlayerStats")
    or localPlayer:FindFirstChild("LoadedData") or localPlayer:FindFirstChild("Data")

  return playerStats and playerStats:FindFirstChild(p6) and playerStats[p6].Value or 0
end

local function f8(p7, p8)
  virtualInputManager:SendKeyEvent(true, p7, false, game)
  task.wait(p8 or 0.05)
  virtualInputManager:SendKeyEvent(false, p7, false, game)
end

local v20

runService.Heartbeat:Connect(function(delta)
  if not v16 or not v20 then
    return
  else
    local v21 = f3()
    local humanoidRootPart = v20:FindFirstChild("HumanoidRootPart")
    local humanoid = v20:FindFirstChild("Humanoid")

    if v21 and humanoidRootPart and humanoid and humanoid.Health > 0
      and humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
      for key6, value6 in pairs(localPlayer.Character:GetDescendants()) do
        if value6:IsA("BasePart") then
          value6.CanCollide = false
        end
      end

      v21.Velocity = Vector3.zero

      if (humanoidRootPart.Position - v21.Position).Magnitude > 8 then
        v21.CFrame = CFrame.lookAt(v21.Position
          + (humanoidRootPart.Position - v21.Position).Unit * 300 * delta, humanoidRootPart.Position)
      else
        v21.CFrame = CFrame.lookAt(humanoidRootPart.Position
          - humanoidRootPart.CFrame.LookVector * 4.5, humanoidRootPart.Position)
      end
    else
      v20 = nil
    end

    return
  end
end)

local function f9()
  local level = f7("Level")
  local n = {}

  for key7, value7 in pairs(v19) do
    if level >= value7.m and level < value7.x then
      n = value7.n
      break
    end
  end

  local huge2 = math.huge
  local v22

  for key8, value8 in pairs((workspace:FindFirstChild("Living") or workspace):GetChildren()) do
    for key9, value9 in pairs(n) do
      if string.find(value8.Name, value9) then
        local humanoid2 = value8:FindFirstChild("Humanoid")
        local humanoidRootPart2 = value8:FindFirstChild("HumanoidRootPart")

        if humanoid2 and humanoid2.Health > 0 and humanoidRootPart2
          and humanoid2:GetState() ~= Enum.HumanoidStateType.Dead then
          local v23 = f3()

          if v23 then
            local magnitude2 = (v23.Position - humanoidRootPart2.Position).Magnitude

            if magnitude2 < huge2 then
              v22 = value8
              huge2 = magnitude2
            end
          end
        end
      end
    end
  end

  return v22
end

local f10

local function f11()
  local zero = Vector3.zero
  local v24 = tick()
  task.spawn(f10)

  while v16 and v20 do
    local humanoid3 = v20:FindFirstChild("Humanoid")
    local character = localPlayer.Character
    local humanoidRootPart3 = v20:FindFirstChild("HumanoidRootPart")

    if not character or not v20.Parent or not humanoid3 or humanoid3.Health <= 0
      or humanoid3:GetState() == Enum.HumanoidStateType.Dead then
      break
    elseif humanoidRootPart3 then
      if (humanoidRootPart3.Position - zero).Magnitude > 0.1 then
        zero = humanoidRootPart3.Position
        v24 = tick()
      elseif tick() - v24 > 1.2 then
        break
      end
    end

    local v25 = false

    for key10, value10 in pairs(character:GetChildren()) do
      if value10:IsA("Model") and value10 ~= character then
        v25 = true
        break
      end
    end

    if not v25 then
      f8(Enum.KeyCode.Q, 0.4)
    end

    virtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
    task.wait(0.01)
    virtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)

    if math.random(1, 10) > 8 then
      f8(Enum.KeyCode.Y, 0.05)
    end

    if not v17 then
      task.spawn(function()
        v17 = true
        f8(Enum.KeyCode.E, 4)
        v17 = false
        task.wait(4.1)
      end)
    end

    task.wait(0.05)
  end

  v20 = nil
end

function f10()
  local v26 = {
    Enum.KeyCode.R, Enum.KeyCode.T, Enum.KeyCode.Y, Enum.KeyCode.X, Enum.KeyCode.G,
    Enum.KeyCode.B, Enum.KeyCode.Z,
  }

  while v16 and v20 do
    if not v17 then
      local humanoid4 = localPlayer.Character
        and localPlayer.Character:FindFirstChild("Humanoid")

      if humanoid4 and humanoid4.Health / humanoid4.MaxHealth < 0.5 then
        task.spawn(f8, Enum.KeyCode.H, 0.05)
      end

      for key11, value11 in pairs(v26) do
        if not v16 or not v20 or v17 then
          break
        end

        f8(value11, 0.05)
        task.wait(0.2)
      end
    end

    task.wait(0.1)
  end
end

local function f12()
  while v16 do
    local level2 = f7("Level")
    local prestige = f7("Prestige")

    if v18[prestige] and level2 >= v18[prestige] then
      local findFirstChild2 = workspace:FindFirstChild("Prestige Master Will", true)

      if findFirstChild2 then
        v20 = findFirstChild2
        task.wait(2)

        local remoteEvent2 = localPlayer.Character
          and localPlayer.Character:FindFirstChild("RemoteEvent")

        if remoteEvent2 then
          remoteEvent2:FireServer("DialogueInteracted", {
            DialogueName = "Prestige Master Will",
            Speaker = "Prestige Master Will",
          })

          task.wait(0.5)

          remoteEvent2:FireServer("EndDialogue", {
            Option = "Option1",
            Dialogue = "Dialogue1",
            NPC = "Prestige Master Will",
          })
        end
      end
    elseif not v20
      or not v20.Parent
      or v20:FindFirstChild("Humanoid")
        and (v20.Humanoid.Health <= 0 or v20.Humanoid:GetState() == Enum.HumanoidStateType.Dead) then
      v20 = f9()

      if v20 then
        task.spawn(f11)
      end
    end

    task.wait(0.2)
  end
end

local perfectBlock = false
local health = 100
local v27 = nil

local function f13()
  if not perfectBlock or not localPlayer.Character then
    return
  else
    local humanoid5 = localPlayer.Character:FindFirstChild("Humanoid")

    if humanoid5 and humanoid5.Health < health then
      virtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)

      if v27 then
        task.cancel(v27)
      end

      v27 = task.delay(0.4, function()
        virtualInputManager:SendKeyEvent(false, Enum.KeyCode.F, false, game)
        v27 = nil
      end)
    end

    if humanoid5 then
      health = humanoid5.Health
    end

    return
  end
end

local v28 = false
local jumpPower = 50

local function f14()
  if not v28 then
    return
  else
    local humanoid6 = localPlayer.Character
      and localPlayer.Character:FindFirstChildOfClass("Humanoid")

    if humanoid6 then
      humanoid6.UseJumpPower = true
      humanoid6.JumpPower = jumpPower
    end

    return
  end
end

local killPlayer = false
local v29 = ""
local v30 = false

local function f15()
  if v29 == "" then
    return nil
  end

  for key12, value12 in pairs(players:GetPlayers()) do
    if value12 ~= localPlayer and string.lower(value12.Name) == string.lower(v29) then
      local character2 = value12.Character

      if character2 and character2:FindFirstChild("Humanoid") and character2.Humanoid.Health > 0
        and character2:FindFirstChild("HumanoidRootPart") then
        return character2
      end
    end
  end

  return nil
end

local speedValue = 50

local function f16()
  local v31 = f3()

  local humanoid7 = localPlayer.Character
    and localPlayer.Character:FindFirstChildOfClass("Humanoid")

  if not v31 or not humanoid7 then
    return
  else
    local moveDirection = humanoid7.MoveDirection

    if moveDirection.Magnitude > 0 then
      local heartbeat = runService.Heartbeat
      v31.CFrame = v31.CFrame + moveDirection * (heartbeat:Wait() * 50 * (speedValue / 16))
      humanoid7.WalkSpeed = 16
    end

    return
  end
end

local v32 = false

local function f17()
  if not v32 or not localPlayer.Character then
    return
  end

  for index, value13 in ipairs(localPlayer.Character:GetDescendants()) do
    local v33 = value13

    if v33:IsA("BasePart") then
      v33.CanCollide = false

      pcall(function()
        for index2, value14 in ipairs((getconnections(v33:GetPropertyChangedSignal("CanCollide")))) do
          value14:Disable()
        end
      end)
    end
  end
end

local v34

local function f18()
  local v35 = {
    Enum.KeyCode.R, Enum.KeyCode.T, Enum.KeyCode.Y, Enum.KeyCode.X, Enum.KeyCode.G,
    Enum.KeyCode.B, Enum.KeyCode.Z,
  }

  while killPlayer and v34 do
    if not v30 then
      local humanoid8 = localPlayer.Character
        and localPlayer.Character:FindFirstChild("Humanoid")

      if humanoid8 and humanoid8.Health / humanoid8.MaxHealth < 0.5 then
        task.spawn(f8, Enum.KeyCode.H, 0.05)
      end

      for key13, value15 in pairs(v35) do
        if not killPlayer or not v34 or v30 then
          break
        end

        f8(value15, 0.05)
        task.wait(0.2)
      end
    end

    task.wait(0.1)
  end
end

local function f19()
  local zero2 = Vector3.zero
  local v36 = tick()
  task.spawn(f18)

  while killPlayer and v34 do
    local character3 = localPlayer.Character
    local v37 = v34

    if not character3 or not v37 then
      break
    else
      local humanoid9 = v37:FindFirstChild("Humanoid")
      local v38 = not humanoid9
      local humanoidRootPart4 = v37:FindFirstChild("HumanoidRootPart")

      if v38 or humanoid9.Health <= 0 or humanoid9:GetState() == Enum.HumanoidStateType.Dead
        or not humanoidRootPart4 then
        break
      elseif (humanoidRootPart4.Position - zero2).Magnitude > 0.1 then
        zero2 = humanoidRootPart4.Position
        v36 = tick()
      elseif tick() - v36 > 1.2 then
        break
      end

      local v39 = false

      for key14, value16 in pairs(character3:GetChildren()) do
        if value16:IsA("Model") and value16 ~= character3 then
          v39 = true
          break
        end
      end

      if not v39 then
        f8(Enum.KeyCode.Q, 0.4)
      end

      virtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
      task.wait(0.01)
      virtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)

      if math.random(1, 10) > 8 then
        f8(Enum.KeyCode.Y, 0.05)
      end

      if not v30 then
        task.spawn(function()
          v30 = true
          f8(Enum.KeyCode.E, 4)
          v30 = false
          task.wait(4.1)
        end)
      end

      task.wait(0.05)
    end
  end

  v34 = nil
end

local f20
local connect

local function f21()
  f20()

  while killPlayer do
    if not v34 or not v34.Parent then
      v34 = f15()

      if v34 then
        task.spawn(f19)
      end
    end

    task.wait(0.2)
  end

  if connect then
    connect:Disconnect()
  end
end

function f20()
  if connect then
    connect:Disconnect()
  end

  connect = runService.Heartbeat:Connect(function(delta2)
    if not killPlayer or not v34 then
      return
    else
      local v40 = f3()
      local humanoidRootPart5 = v34:FindFirstChild("HumanoidRootPart")
      local humanoid10 = v34:FindFirstChild("Humanoid")

      if v40 and humanoidRootPart5 and humanoid10 and humanoid10.Health > 0
        and humanoid10:GetState() ~= Enum.HumanoidStateType.Dead then
        for key15, value17 in pairs(localPlayer.Character:GetDescendants()) do
          if value17:IsA("BasePart") then
            value17.CanCollide = false
          end
        end

        v40.Velocity = Vector3.zero

-- https://leakd.vercel.app
        if (humanoidRootPart5.Position - v40.Position).Magnitude > 8 then
          v40.CFrame = CFrame.lookAt(v40.Position
            + (humanoidRootPart5.Position - v40.Position).Unit * 300 * delta2, humanoidRootPart5.Position)
        else
          v40.CFrame = CFrame.lookAt(humanoidRootPart5.Position
            - humanoidRootPart5.CFrame.LookVector * 4.5, humanoidRootPart5.Position)
        end
      else
        v34 = nil
      end

      return
    end
  end)
end

local connect2 = nil

local function f22()
  if connect2 then
    connect2:Disconnect()
  end

  if v27 then
    task.cancel(v27)
  end

  virtualInputManager:SendKeyEvent(false, Enum.KeyCode.F, false, game)
end

local function f23()
  if connect2 then
    connect2:Disconnect()
  end

  health = localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid")
      and localPlayer.Character.Humanoid.Health
    or 100

  connect2 = runService.Heartbeat:Connect(f13)
end

local v41 = false
local fly = false
local v42 = 5

local v43 = {
  W = false,
  A = false,
  S = false,
  D = false,
  Space = false,
  Shift = false,
}

local v44

local function f24()
  if v44 and v44.Parent then
    return
  else
    local flyButtons = Instance.new("ScreenGui")
    flyButtons.Name = "FlyButtons"
    flyButtons.ResetOnSpawn = false
    flyButtons.Parent = coreGui

    local textButton = Instance.new("TextButton")
    textButton.Size = UDim2.new(0, 80, 0, 80)
    textButton.Position = UDim2.new(0.5, -100, 1, -90)
    textButton.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    textButton.Text = "⬆"
    textButton.TextSize = 30
    textButton.Font = Enum.Font.GothamBold
    textButton.TextColor3 = Color3.new(1, 1, 1)
    textButton.Parent = flyButtons

    local textButton2 = Instance.new("TextButton")
    textButton2.Size = UDim2.new(0, 80, 0, 80)
    textButton2.Position = UDim2.new(0.5, 20, 1, -90)
    textButton2.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
    textButton2.Text = "⬇"
    textButton2.TextSize = 30
    textButton2.Font = Enum.Font.GothamBold
    textButton2.TextColor3 = Color3.new(1, 1, 1)
    textButton2.Parent = flyButtons

    textButton.MouseButton1Down:Connect(function() v43.Space = true end)
    textButton.MouseButton1Up:Connect(function() v43.Space = false end)

    textButton2.MouseButton1Down:Connect(function() v43.Shift = true end)
    textButton2.MouseButton1Up:Connect(function() v43.Shift = false end)

    textButton.TouchLongPress:Connect(function() v43.Space = true end)
    textButton.TouchEnded:Connect(function() v43.Space = false end)

    textButton2.TouchLongPress:Connect(function() v43.Shift = true end)
    textButton2.TouchEnded:Connect(function() v43.Shift = false end)

    v44 = flyButtons
    return
  end
end

local function f25()
  if v44 then
    v44:Destroy()
    v44 = nil
  end
end

local bodyVelocity, connect3

local function f26()
  if connect3 then
    connect3:Disconnect()
    connect3 = nil
  end

  if bodyVelocity then
    bodyVelocity:Destroy()
    bodyVelocity = nil
  end

  f25()
end

local function f27()
  local v45 = f3()

  if not v45 then
    return
  end

  if bodyVelocity then
    bodyVelocity:Destroy()
  end

  bodyVelocity = Instance.new("BodyVelocity")
  bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
  bodyVelocity.Parent = v45

  for key16 in pairs(v43) do
    v43[key16] = false
  end

  if userInputService.TouchEnabled then
    f24()
  end

  connect3 = runService.Heartbeat:Connect(function()
    if not fly or not localPlayer.Character then
      if bodyVelocity then
        bodyVelocity:Destroy()
      end

      return
    else
      local v46 = f3()

      local humanoid11 = localPlayer.Character
        and localPlayer.Character:FindFirstChildOfClass("Humanoid")

      if not v46 or not humanoid11 then
        return
      else
        local cframe = workspace.CurrentCamera.CFrame
        local vectorToObjectSpace = cframe:VectorToObjectSpace(humanoid11.MoveDirection)

        local v47 = cframe.RightVector * vectorToObjectSpace.X
          - cframe.LookVector * vectorToObjectSpace.Z

        local v48 = 0

        if v43.Space then
          v48 = v48 + 1
        end

        if v43.Shift then
          v48 = v48 - 1
        end

        bodyVelocity.Velocity = v47 * 50 * v42 + Vector3.new(0, v48 * 50 * v42, 0)
        return
      end
    end
  end)
end

local esp = false
local espRadius = 200
local color = Color3.fromRGB(255, 0, 0)
local v49 = {}

local function f28(p9)
  if p9 == localPlayer then
    return
  else
    local character4 = p9.Character

    if not character4 then
      return
    else
      local humanoidRootPart6 = character4:FindFirstChild("HumanoidRootPart")
        or character4:FindFirstChild("Torso") or character4:FindFirstChild("UpperTorso")

      if not humanoidRootPart6 then
        return
      else
        if v49[p9] then
          for index3, value18 in ipairs(v49[p9]) do
            local v50 = value18
            pcall(function() v50:Destroy() end)
          end

          v49[p9] = nil
        end

        local v51 = {}

        local highlight = Instance.new("Highlight")
        highlight.Adornee = character4
        highlight.FillColor = color
        highlight.FillTransparency = 0.7
        highlight.OutlineColor = color
        highlight.OutlineTransparency = 0
        highlight.Parent = character4

        table.insert(v51, highlight)

        local billboardGui = Instance.new("BillboardGui")
        billboardGui.Size = UDim2.new(0, 200, 0, 60)
        billboardGui.AlwaysOnTop = true
        billboardGui.ClipsDescendants = false
        billboardGui.MaxDistance = espRadius
        billboardGui.Adornee = humanoidRootPart6
        billboardGui.StudsOffset = Vector3.new(0, 3, 0)
        billboardGui.Parent = character4

        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BackgroundTransparency = 1
        frame.Parent = billboardGui

        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = p9.Name .. "\n[0]"
        textLabel.TextColor3 = color
        textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        textLabel.TextStrokeTransparency = 0
        textLabel.TextSize = 16
        textLabel.Font = Enum.Font.GothamBold
        textLabel.TextWrapped = true
        textLabel.Parent = frame

        table.insert(v51, billboardGui)
        v49[p9] = v51
        return
      end
    end
  end
end

local rgbESP = false
local connect4, connect5, connect6

local function f29()
  if connect4 then
    connect4:Disconnect()
  end

  if connect5 then
    connect5:Disconnect()
  end

  if connect6 then
    connect6:Disconnect()
  end

  for key17, value19 in pairs(v49) do
  end

  v49 = {}
end

local v52 = 0

local function f30()
  if rgbESP then
    v52 = (v52 + 0.005) % 1
    color = Color3.fromHSV(v52, 1, 1)
  end

  for key18, value20 in pairs(v49) do
    for index4, value21 in ipairs(value20) do
      if value21:IsA("Highlight") then
        value21.FillColor = color
        value21.OutlineColor = color
      elseif value21:IsA("BillboardGui") then
        local textLabel2 = value21.Frame and value21.Frame.TextLabel

        if textLabel2 then
          textLabel2.TextColor3 = color
        end
      end
    end
  end
end

local function f31()
  local position2 = localPlayer.Character
    and localPlayer.Character:FindFirstChild("HumanoidRootPart")
    and localPlayer.Character.HumanoidRootPart.Position

  if not position2 then
    return
  end

  for key19, value22 in pairs(v49) do
    local character5 = key19.Character

    if not character5 then
      for index5, value23 in ipairs(value22) do
      end

      v49[key19] = nil
    else
      local humanoidRootPart7 = character5:FindFirstChild("HumanoidRootPart")
        or character5:FindFirstChild("Torso") or character5:FindFirstChild("UpperTorso")

      if not humanoidRootPart7 then
        for index6, value24 in ipairs(value22) do
          value24.Enabled = false
        end
      else
        local magnitude3 = (position2 - humanoidRootPart7.Position).Magnitude
        local v53 = magnitude3 <= espRadius

        for index7, value25 in ipairs(value22) do
          value25.Enabled = v53
        end

        if v53 then
          local v54 = value22[2]

          if v54 and v54:IsA("BillboardGui") then
            local textLabel3 = v54.Frame and v54.Frame.TextLabel

            if textLabel3 then
              textLabel3.Text = key19.Name .. "\n[" .. math.floor(magnitude3) .. "]"
            end
          end
        end
      end
    end
  end

  if rgbESP then
    f30()
  end
end

local function f32()
  if connect4 then
    connect4:Disconnect()
  end

  for index8, value26 in ipairs(players:GetPlayers()) do
    f28(value26)
  end

  if connect5 then
    connect5:Disconnect()
  end

  connect5 = players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
      if esp then
        f28(player)
      end
    end)

    if player.Character and esp then
      f28(player)
    end
  end)

  if connect6 then
    connect6:Disconnect()
  end

  connect6 = players.PlayerRemoving:Connect(function(player2)
    if v49[player2] then
      for index9, value27 in ipairs(v49[player2]) do
        local v55 = value27
        pcall(function() v55:Destroy() end)
      end

      v49[player2] = nil
    end
  end)

  connect4 = runService.Heartbeat:Connect(f31)
end

local mainTab = window:CreateTab("Main")
mainTab:CreateSection("Auto Farm + Auto Sell")

mainTab:CreateToggle({
  Name = "Auto Farm + Auto Sell",
  CurrentValue = false,
  Callback = function(value28)
    v1 = value28

    if value28 then
      v2 = {}
      task.spawn(f6)
    end
  end,
})

mainTab:CreateSection("Auto Prestige 3")

mainTab:CreateToggle({
  Name = "Auto Prestige 3",
  CurrentValue = false,
  Callback = function(value29)
    v16 = value29

    if value29 then
      v20 = nil
      task.spawn(f12)
    else
      v20 = nil
    end
  end,
})

mainTab:CreateSection("Kill Player")

mainTab:CreateInput({
  Name = "Target Player Name",
  PlaceholderText = "Enter player name",
  Callback = function(value30) v29 = value30 end,
})

mainTab:CreateToggle({
  Name = "Kill Player",
  CurrentValue = false,
  Callback = function(value31)
    killPlayer = value31

    if value31 then
      v34 = nil
      task.spawn(f21)
    else
      v34 = nil
    end
  end,
})

mainTab:CreateSection("Perfect Block")

mainTab:CreateToggle({
  Name = "Perfect Block",
  CurrentValue = false,
  Callback = function(value32)
    perfectBlock = value32

    if value32 then
      f23()
    else
      f22()
    end
  end,
})

local movementTab = window:CreateTab("Movement")
movementTab:CreateSection("Walkspeed Bypass")

local connect7

movementTab:CreateToggle({
  Name = "Walkspeed Bypass",
  CurrentValue = false,
  Callback = function(value33)
    if value33 then
      if connect7 then
        connect7:Disconnect()
      end

      connect7 = runService.Heartbeat:Connect(f16)
    else
      if connect7 then
        connect7:Disconnect()
        connect7 = nil
      end

      local character6 = localPlayer.Character

      local humanoid12 = character6
      humanoid12 = character6 and localPlayer.Character:FindFirstChildOfClass("Humanoid")

      if humanoid12 then
        humanoid12.WalkSpeed = 16
      end
    end
  end,
})

movementTab:CreateSlider({
  Name = "Speed Value",
  Range = { 1, 100 },
  Increment = 1,
  Suffix = " speed",
  CurrentValue = 50,
  Callback = function(value34) speedValue = value34 end,
})

movementTab:CreateSection("Jump Power")

local connect8

movementTab:CreateToggle({
  Name = "Jump Power",
  CurrentValue = false,
  Callback = function(value35)
    v28 = value35

    if value35 then
      f14()

      if connect8 then
        connect8:Disconnect()
      end

      connect8 = runService.Heartbeat:Connect(f14)
    else
      if connect8 then
        connect8:Disconnect()
        connect8 = nil
      end

      local character7 = localPlayer.Character

      local humanoid13 = character7
      humanoid13 = character7 and localPlayer.Character:FindFirstChildOfClass("Humanoid")

      if humanoid13 then
        humanoid13.JumpPower = 50
      end
    end
  end,
})

movementTab:CreateSlider({
  Name = "Jump Power Value",
  Range = { 1, 100 },
  Increment = 1,
  Suffix = " power",
  CurrentValue = 50,
  Callback = function(value36)
    jumpPower = value36

    if v28 then
      f14()
    end
  end,
})

movementTab:CreateSection("Infinite Jump")

local connect9

movementTab:CreateToggle({
  Name = "Infinite Jump",
  CurrentValue = false,
  Callback = function(value37)
    v41 = value37

    if value37 then
      if connect9 then
        connect9:Disconnect()
      end

      connect9 = userInputService.JumpRequest:Connect(function()
        if v41 then
          local humanoid14 = localPlayer.Character
            and localPlayer.Character:FindFirstChildOfClass("Humanoid")

          if humanoid14 then
            humanoid14:ChangeState("Jumping")
          end
        end
      end)
    elseif connect9 then
      connect9:Disconnect()
      connect9 = nil
    end
  end,
})

movementTab:CreateSection("Noclip")

local connect10

movementTab:CreateToggle({
  Name = "Noclip",
  CurrentValue = false,
  Callback = function(value38)
    v32 = value38

    if value38 then
      f17()

      if connect10 then
        connect10:Disconnect()
      end

      connect10 = runService.Stepped:Connect(f17)
    else
      if connect10 then
        connect10:Disconnect()
        connect10 = nil
      end

      if localPlayer.Character then
        for index10, value39 in ipairs(localPlayer.Character:GetDescendants()) do
          if value39:IsA("BasePart") then
            value39.CanCollide = true
          end
        end
      end
    end
  end,
})

movementTab:CreateSection("Fly")

movementTab:CreateToggle({
  Name = "Fly",
  CurrentValue = false,
  Callback = function(value40)
    fly = value40

    if value40 then
      f27()
    else
      f26()
    end
  end,
})

movementTab:CreateSlider({
  Name = "Fly Speed Multiplier",
  Range = { 1, 10 },
  Increment = 1,
  Suffix = "x",
  CurrentValue = 5,
  Callback = function(value41) v42 = value41 end,
})

local visualsTab = window:CreateTab("Visuals")
visualsTab:CreateSection("ESP")

visualsTab:CreateToggle({
  Name = "ESP",
  CurrentValue = false,
  Callback = function(value42)
    esp = value42

    if value42 then
      f32()
    else
      f29()
    end
  end,
})

visualsTab:CreateSlider({
  Name = "ESP Radius",
  Range = { 50, 500 },
  Increment = 10,
  Suffix = " studs",
  CurrentValue = espRadius,
  Callback = function(value43)
    espRadius = value43

    for key20, value44 in pairs(v49) do
      for index11, value45 in ipairs(value44) do
        if value45:IsA("BillboardGui") then
          value45.MaxDistance = espRadius
        end
      end
    end
  end,
})

visualsTab:CreateColorPicker({
  Name = "ESP Color",
  Color = color,
  Callback = function(value46)
    color = value46

    if not rgbESP then
      f30()
    end
  end,
})

visualsTab:CreateToggle({
  Name = "RGB ESP",
  CurrentValue = false,
  Callback = function(value47)
    rgbESP = value47

    if rgbESP then
      v52 = 0
      f30()
    else
      f30()
    end
  end,
})

local infoTab = window:CreateTab("Info")
infoTab:CreateSection("How to use")
infoTab:CreateLabel("Auto Farm + Auto Sell - автоматический сбор и продажа предметов.")
infoTab:CreateLabel("Auto Prestige 3 - фарм NPC и автоматическое повышение престижа.")
infoTab:CreateLabel("Kill Player - введите имя игрока, скрипт будет преследовать и атаковать его.")
infoTab:CreateLabel("Perfect Block - мгновенный блок при получении урона.")
infoTab:CreateLabel("Movement - настройки скорости, прыжка, ноклипа, полёта.")
infoTab:CreateLabel("Visuals - ESP с настройками цвета и радиуса.")
infoTab:CreateLabel("Telegram: t.me/SpectreX_hub")

local creditsTab = window:CreateTab("Credits")
creditsTab:CreateLabel("Special for my subscribers SpectrX_Hub")

creditsTab:CreateButton({
  Name = "Copy Telegram Link",
  Callback = function()
    pcall(function() setclipboard("t.me/SpectreX_hub") end)
    rayfield:Notify({ Title = "Telegram", Content = "Link copied!", Duration = 8 })
  end,
})

-- https://leakd.vercel.app
