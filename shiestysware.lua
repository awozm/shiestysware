local plrs = game["Players"]
local ws = game["Workspace"]
local uis = game["UserInputService"]
local rs = game["RunService"]
local hs = game["HttpService"]
local cgui = game["CoreGui"]
local lighting = game["Lighting"]
local GuiService = game["GuiService"]
local repStorage = game["ReplicatedStorage"]

local plr = plrs.LocalPlayer
local mouse = plr:GetMouse()
local camera = ws.CurrentCamera
local worldToViewportPoint = camera.worldToViewportPoint

local Drawingnew = Drawing.new
local Color3new = Color3.new
local Color3fromRGB = Color3.fromRGB
local Vector3new = Vector3.new
local Vector2new = Vector2.new
local mathhuge = math.huge
local mathfloor = math.floor
local mathceil = math.ceil
local GetGuiInset = GuiService.GetGuiInset
local Raynew = Ray.new
local originalfov = camera.FieldOfView

local oldamb1 = game:GetService("Lighting").Ambient
local oldamb2 = game:GetService("Lighting").OutdoorAmbient
local oldamb3 = game:GetService("Lighting").ColorShift_Bottom
local oldamb4 = game:GetService("Lighting").ColorShift_Top
local oldlight1 = game:GetService("Lighting").Brightness

local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/ghastlytim/modules/main/linoriaedit.lua'))();

local esp = loadstring(game:HttpGet('https://raw.githubusercontent.com/ghastlytim/modules/main/esp.lua'))();

SaveManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/ghastlytim/modules/main/savemanager.lua'))();

local plr = game.Players.LocalPlayer
local TestWindow = Library:CreateWindow('shiestys script lol');

local RunService = game:GetService("RunService")

local TimeFunction = RunService:IsRunning() and time or os.clock

local LastIteration, Start
local FrameUpdateTable = {}

local function HeartbeatUpdate()
	LastIteration = TimeFunction()
	for Index = #FrameUpdateTable, 1, -1 do
		FrameUpdateTable[Index + 1] = FrameUpdateTable[Index] >= LastIteration - 1 and FrameUpdateTable[Index] or nil
	end

	FrameUpdateTable[1] = LastIteration
if Flags.Watermark.Value == true then 
	Library:SetWatermark('shiestys script lol | Universal | User: '..plr.DisplayName..' | FPS: '..tostring(math.floor(TimeFunction() - Start >= 1 and #FrameUpdateTable or #FrameUpdateTable / (TimeFunction() - Start)))..' | Ping: '..game.Players.LocalPlayer:GetNetworkPing() * 1000);
else
Library:SetWatermarkVisibility(Flags.Watermark.Value);
end
end

Start = TimeFunction()
RunService.Heartbeat:Connect(HeartbeatUpdate)

local Fonts = {};
for Font, _ in next, Drawing.Fonts do
	table.insert(Fonts, Font);
end;



local LegitTab = TestWindow:AddTab('Combat');
local LegitTabbox1 = LegitTab:AddLeftTabbox('Aimbot');
local lAimbot1 = LegitTabbox1:AddTab('Aimbot');
lAimbot1:AddToggle('Aimbot', { Text = 'Aimbot' });
lAimbot1:AddToggle('Tchek', { Text = 'Team Check' });
lAimbot1:AddDropdown('Aimpart', { Text = 'Aimpart', Default = "Head", Values = {"Head","HumanoidRootPart"} });
lAimbot1:AddToggle('AimF', { Text = 'Draw FOV' }):AddColorPicker('AFColor', { Default = Color3.new(1, 1, 1) });
lAimbot1:AddSlider('AimFRad', { Text = 'Fov Radius', Default = 10, Min = 0, Max = 1000, Rounding = 1 });
lAimbot1:AddToggle('Snapline', { Text = 'Snapline' }):AddColorPicker('SLColor', { Default = Color3.new(1, 1, 1) });

local LegitTabbox2 = LegitTab:AddRightTabbox('SilentAim');
local lAimbot2 = LegitTabbox2:AddTab('SilentAim');

lAimbot2:AddToggle('Silentaim', { Text = 'Enable' });
lAimbot2:AddToggle('Tchek2', { Text = 'Team Check' });
lAimbot2:AddDropdown('AimpartS', { Text = 'Aimpart', Default = "Head", Values = {"Head","HumanoidRootPart"} });
lAimbot2:AddToggle('AimFS', { Text = 'Draw FOV' }):AddColorPicker('AFSColor', { Default = Color3.new(1, 1, 1) });
lAimbot2:AddSlider('AimFRadS', { Text = 'Fov Radius', Default = 10, Min = 0, Max = 1000, Rounding = 1 });
lAimbot2:AddToggle('SnaplineS', { Text = 'Snapline' }):AddColorPicker('SLSColor', { Default = Color3.new(1, 1, 1) });



local VisualsTab = TestWindow:AddTab('Visuals');

local ESP = VisualsTab:AddLeftTabbox();
local EnemyESP = ESP:AddTab('Player ESP');
EnemyESP:AddToggle('esp_Enabled', { Text = 'Enable' });
EnemyESP:AddToggle('esp_Box', { Text = 'Box' }):AddColorPicker('BOColor', { Default = Color3.new(1, 1, 1) });
EnemyESP:AddToggle('esp_BoxFill', { Text = 'BoxFill' }):AddColorPicker('BFILLColor', { Default = Color3.new(1, 1, 1) });
EnemyESP:AddToggle('esp_HealthBar', { Text = 'HealthBar' });
EnemyESP:AddDropdown('Helthbarpos', { Text = 'HealthBarPosition', Default = "left", Values = {"top","bottom","right","left"} });
EnemyESP:AddToggle('esp_Name', { Text = 'Name' }):AddColorPicker('NAMColor', { Default = Color3.new(1, 1, 1) });
EnemyESP:AddToggle('esp_Distance', { Text = 'Distance' }):AddColorPicker('DISColor', { Default = Color3.new(1, 1, 1) });
EnemyESP:AddToggle('esp_Health', { Text = 'Health' });
EnemyESP:AddToggle('esp_Chams', { Text = 'Chams' }):AddColorPicker('ChamColor', { Default = Color3.new(1, 1, 1) });
EnemyESP:AddToggle('esp_Arrows', { Text = 'Arrows' }):AddColorPicker('ArrowColor', { Default = Color3.new(1, 1, 1) });


local ESPp = VisualsTab:AddRightTabbox();
local ESPcustom = ESPp:AddTab('ESP Customization');
ESPcustom:AddDropdown('Namepos', { Text = 'Name Position', Default = "top", Values = {"top","bottom","right","left"} });
ESPcustom:AddDropdown('Distancepos', { Text = 'Distance Position', Default = "bottom", Values = {"top","bottom","right","left"} });
ESPcustom:AddDropdown('Helthpos', { Text = 'Health Position', Default = "left", Values = {"top","bottom","right","left"} });
ESPcustom:AddSlider('Arrowrad', { Text = 'Arrow Radius', Default = 300, Min = 0, Max = 1000, Rounding = 0, Suffix = '' });
ESPcustom:AddToggle('esp_limdis', { Text = 'Limit Distance' });
ESPcustom:AddSlider('DrawDistance', { Text = 'Draw Distance', Default = 2500, Min = 100, Max = 3000, Rounding = 0, Suffix = 'm' });
ESPcustom:AddToggle('esp_TeamCheck', { Text = 'TeamCheck' });

local wrldVisualsTab = TestWindow:AddTab('WorldVisuals');

local LightingLLLL = wrldVisualsTab:AddLeftTabbox();
local wporldtabsa = LightingLLLL:AddTab('World');
local LightingLLLLL = wrldVisualsTab:AddLeftTabbox();
local Lightingtabsa = LightingLLLLL:AddTab('Lighting');
local LightingLLLLLL = wrldVisualsTab:AddRightTabbox();
local skytabsa = LightingLLLLLL:AddTab('Skybox Changer');

skytabsa:AddToggle('Skychanger', { Text = 'Enable' });
skytabsa:AddDropdown('skyboxes', { Text = 'skybox', Default = "none", Values = {"none","amongus","sonic","nebula","vaporwave","clouds","twilight"} });

local function MakeSky()
s = Instance.new("Sky")
s.Name = "skullsky"
s.Parent = game.Lighting
s.SkyboxBk = "http://www.roblox.com/asset/?id=0"
s.SkyboxDn = "http://www.roblox.com/asset/?id=0"
s.SkyboxFt = "http://www.roblox.com/asset/?id=0"
s.SkyboxLf = "http://www.roblox.com/asset/?id=0"
s.SkyboxRt = "http://www.roblox.com/asset/?id=0"
s.SkyboxUp = "http://www.roblox.com/asset/?id=0"
end

RunService.RenderStepped:Connect(function()
if Flags.Skychanger.Value == true then
if Flags.skyboxes.Value == "none" then

if game.Lighting.skullsky then
s:Destroy()
end

elseif Flags.skyboxes.Value == "amongus"  then


MakeSky()
s.SkyboxBk = "http://www.roblox.com/asset/?id=5850251189"
s.SkyboxDn = "http://www.roblox.com/asset/?id=5850251189"
s.SkyboxFt = "http://www.roblox.com/asset/?id=5850251189"
s.SkyboxLf = "http://www.roblox.com/asset/?id=5850251189"
s.SkyboxRt = "http://www.roblox.com/asset/?id=5850251189"
s.SkyboxUp = "http://www.roblox.com/asset/?id=411367386"

elseif Flags.skyboxes.Value == "sonic" then

MakeSky()
s.SkyboxBk = "http://www.roblox.com/asset/?id=70923389"
s.SkyboxDn = "http://www.roblox.com/asset/?id=70963424"
s.SkyboxFt = "http://www.roblox.com/asset/?id=77698114"
s.SkyboxLf = "http://www.roblox.com/asset/?id=70922981"
s.SkyboxRt = "http://www.roblox.com/asset/?id=70923264"
s.SkyboxUp = "http://www.roblox.com/asset/?id=55195525"

elseif Flags.skyboxes.Value == "nebula" then


MakeSky()
s.SkyboxLf = "rbxassetid://159454286" 
s.SkyboxBk = "rbxassetid://159454299"
s.SkyboxDn = "rbxassetid://159454296" 
s.SkyboxFt = "rbxassetid://159454293" 
s.SkyboxLf = "rbxassetid://159454286"
s.SkyboxRt = "rbxassetid://159454300" 
s.SkyboxUp = "rbxassetid://159454288"

elseif Flags.skyboxes.Value == "vaporwave" then


MakeSky()
s.SkyboxLf = "rbxassetid://1417494402"
s.SkyboxBk = "rbxassetid://1417494030"
s.SkyboxDn = "rbxassetid://1417494146" 
s.SkyboxFt = "rbxassetid://1417494253" 
s.SkyboxLf = "rbxassetid://1417494402" 
s.SkyboxRt = "rbxassetid://1417494499" 
s.SkyboxUp = "rbxassetid://1417494643"

elseif Flags.skyboxes.Value == "clouds" then

MakeSky()
s.SkyboxLf = "rbxassetid://570557620" 
s.SkyboxBk = "rbxassetid://570557514" 
s.SkyboxDn = "rbxassetid://570557775" 
s.SkyboxFt = "rbxassetid://570557559"
s.SkyboxLf = "rbxassetid://570557620"
s.SkyboxRt = "rbxassetid://570557672"
s.SkyboxUp = "rbxassetid://570557727"

elseif Flags.skyboxes.Value == "twilight" then


MakeSky()
s.SkyboxLf = "rbxassetid://264909758" 
s.SkyboxBk = "rbxassetid://264908339" 
s.SkyboxDn = "rbxassetid://264907909" 
s.SkyboxFt = "rbxassetid://264909420" 
s.SkyboxLf = "rbxassetid://264909758" 
s.SkyboxRt = "rbxassetid://264908886" 
s.SkyboxUp = "rbxassetid://264907379"

end
else
if game.Lighting.skullsky then
s:Destroy()
end
end
end)

wporldtabsa:AddToggle('grassremove', { Text = 'Remove Grass [Syn only]' });


Lightingtabsa:AddToggle('wrldEnable', { Text = 'Enable' });
Lightingtabsa:AddToggle('wrldambient', { Text = 'Ambient' }):AddColorPicker('Ambient1', { Default = Color3.new(1, 1, 1) }):AddColorPicker('Ambient2', { Default = Color3.new(1, 1, 1) });
Lightingtabsa:AddToggle('wrldcolorshift', { Text = 'Color Shift' }):AddColorPicker('colorshift1', { Default = Color3.new(1, 1, 1) }):AddColorPicker('colorshift2', { Default = Color3.new(1, 1, 1) });
Lightingtabsa:AddToggle('wrldtimechanger', { Text = 'Time Changer' });
Lightingtabsa:AddSlider('wrldtime', { Text = 'Time', Default = 10, Min = 0, Max = 24, Rounding = 0, Suffix = '' });
Lightingtabsa:AddToggle('fullbright', { Text = 'Fullbright' });

RunService.RenderStepped:Connect(function()
if Flags.wrldEnable.Value == true then

if Flags.wrldambient.Value == true then
game:GetService("Lighting").Ambient = Flags.Ambient1.Value
game:GetService("Lighting").OutdoorAmbient = Flags.Ambient2.Value
else
game:GetService("Lighting").Ambient = oldamb1
game:GetService("Lighting").OutdoorAmbient = oldamb2
end

if Flags.wrldcolorshift.Value == true then
game:GetService("Lighting").ColorShift_Bottom = Flags.colorshift1.Value
game:GetService("Lighting").ColorShift_Top = Flags.colorshift2.Value
else
game:GetService("Lighting").ColorShift_Bottom = oldamb3
game:GetService("Lighting").ColorShift_Top = oldamb4
end

if Flags.wrldtimechanger.Value == true then
game:GetService("Lighting").TimeOfDay = Flags.wrldtime.Value
end

if Flags.fullbright.Value == true then
game:GetService("Lighting").Brightness = 100
else
game:GetService("Lighting").Brightness = oldlight1
end

end
if Flags.grassremove.Value == true then
sethiddenprop(workspace.Terrain, "Decoration", false)
else
sethiddenprop(workspace.Terrain, "Decoration", true)
end
end)

local MiscTab = TestWindow:AddTab('Misc');

local MiscL = MiscTab:AddLeftTabbox();
local MiscPP = MiscL:AddTab('localPlayer');

MiscPP:AddToggle('InfJump', { Text = 'Inf Jump' });
MiscPP:AddToggle('walk', { Text = 'Walk Speed' });
MiscPP:AddSlider('Speed', { Text = 'walkspeed', Default = 16, Min = 0, Max = 45, Rounding = 0, Suffix = '' });
MiscPP:AddToggle('jump', { Text = 'Jump Power' });
MiscPP:AddSlider('Jpower', { Text = 'jumpower', Default = 50, Min = 0 , Max = 500, Rounding = 0, Suffix = '' });
MiscPP:AddToggle('plrFov', { Text = 'Fov Changer' });
MiscPP:AddSlider('Plrvalf', { Text = 'Fov', Default = 70, Min = 70 , Max = 200, Rounding = 0, Suffix = '' });


RunService.RenderStepped:Connect(function()
if Flags.walk.Value == true then
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.WalkSpeed = Flags.Speed.Value
        end
    end

    if Flags.jump.Value == true then
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.JumpPower = Flags.Jpower.Value
        end
    end

if Flags.plrFov.Value == true then
camera.FieldOfView = Flags.Plrvalf.Value
else 
camera.FieldOfView = originalfov 
end

end)

mouse.KeyDown:connect(function(key)
    if Flags.InfJump.Value == true and key == " " then
        plr.Character.Humanoid:ChangeState(3)
        wait()
    end
end)



local SettingsTab = TestWindow:AddTab('Settings');

local function UpdateTheme()
    Library.BackgroundColor = Flags.BackgroundColor.Value;
    Library.MainColor = Flags.MainColor.Value;
    Library.AccentColor = Flags.AccentColor.Value;
    Library.AccentColorDark = Library:GetDarkerColor(Library.AccentColor);
    Library.OutlineColor = Flags.OutlineColor.Value;
    Library.FontColor = Flags.FontColor.Value;

    Library:UpdateColorsUsingRegistry();
end;

local cheatthemes = {"Default","TokyoNight","NekoRed","NekoBlue","Fatality","GameSense","Twitch"}

local function SetThemes()
if Flags.Selectedtheme.Value == "Default" then
    Flags.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
    Flags.MainColor:SetValueRGB(Color3.fromRGB(35,35,35));
    Flags.BackgroundColor:SetValueRGB(Color3.fromRGB(17,17,17));
    Flags.AccentColor:SetValueRGB(Color3.fromRGB(255,255,255));
    Flags.OutlineColor:SetValueRGB(Color3.fromRGB(47,47,47));
    Flags.Rainbow:SetValue(false);
    UpdateTheme();
elseif Flags.Selectedtheme.Value == "TokyoNight" then
    Flags.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
    Flags.MainColor:SetValueRGB(Color3.fromRGB(24,25,37));
    Flags.BackgroundColor:SetValueRGB(Color3.fromRGB(22,22,31));
    Flags.AccentColor:SetValueRGB(Color3.fromRGB(103,89,179));
    Flags.OutlineColor:SetValueRGB(Color3.fromRGB(50, 50, 50));
    Flags.Rainbow:SetValue(false);
    UpdateTheme();
elseif Flags.Selectedtheme.Value == "NekoRed" then
    Flags.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
    Flags.MainColor:SetValueRGB(Color3.fromRGB(23,23,23));
    Flags.BackgroundColor:SetValueRGB(Color3.fromRGB(18,18,18));
    Flags.AccentColor:SetValueRGB(Color3.fromRGB(226, 30, 112));
    Flags.OutlineColor:SetValueRGB(Color3.fromRGB(60, 60, 60));
    Flags.Rainbow:SetValue(false);
    UpdateTheme();
elseif Flags.Selectedtheme.Value == "NekoBlue" then
    Flags.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
    Flags.MainColor:SetValueRGB(Color3.fromRGB(23,23,23));
    Flags.BackgroundColor:SetValueRGB(Color3.fromRGB(18,18,18));
    Flags.AccentColor:SetValueRGB(Color3.fromRGB(0, 247, 255));
    Flags.OutlineColor:SetValueRGB(Color3.fromRGB(60, 60, 60));
    Flags.Rainbow:SetValue(false);
    UpdateTheme();
elseif Flags.Selectedtheme.Value == "Fatality" then
    Flags.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
    Flags.MainColor:SetValueRGB(Color3.fromRGB(29,23,66));
    Flags.BackgroundColor:SetValueRGB(Color3.fromRGB(25,19,53));
    Flags.AccentColor:SetValueRGB(Color3.fromRGB(197,7,83));
    Flags.OutlineColor:SetValueRGB(Color3.fromRGB(29,23,66));
    Flags.Rainbow:SetValue(false);
    UpdateTheme();
elseif Flags.Selectedtheme.Value == "GameSense" then
    Flags.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
    Flags.MainColor:SetValueRGB(Color3.fromRGB(35,35,35));
    Flags.BackgroundColor:SetValueRGB(Color3.fromRGB(17,17,17));
    Flags.AccentColor:SetValueRGB(Color3.fromRGB(147,184,26));
    Flags.OutlineColor:SetValueRGB(Color3.fromRGB(47,47,47));
    Flags.Rainbow:SetValue(false);
    UpdateTheme();
elseif Flags.Selectedtheme.Value == "Twitch" then
    Flags.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
    Flags.MainColor:SetValueRGB(Color3.fromRGB(24,24,27));
    Flags.BackgroundColor:SetValueRGB(Color3.fromRGB(14,14,14));
    Flags.AccentColor:SetValueRGB(Color3.fromRGB(169,112,255));
    Flags.OutlineColor:SetValueRGB(Color3.fromRGB(45,45,45));
    Flags.Rainbow:SetValue(false);
    UpdateTheme();
end
end;

local Theme = SettingsTab:AddLeftGroupbox('Theme');
Theme:AddLabel('Background Color'):AddColorPicker('BackgroundColor', { Default =  Color3.fromRGB(17,17,17) });
Theme:AddLabel('Main Color'):AddColorPicker('MainColor', { Default =  Color3.fromRGB(35,35,35) });
Theme:AddLabel('Accent Color'):AddColorPicker('AccentColor', { Default =  Color3.fromRGB(255,255,255) });
Theme:AddToggle('Rainbow', { Text = 'Rainbow Accent Color' });
Theme:AddLabel('Outline Color'):AddColorPicker('OutlineColor', { Default =  Color3.fromRGB(47, 47, 47) });
Theme:AddLabel('Font Color'):AddColorPicker('FontColor', { Default = Library.FontColor });
Theme:AddDropdown('Selectedtheme', { Text = 'Theme', Default = 1, Values = cheatthemes }):OnChanged(function()
   SetThemes(); 
end);
Theme:AddToggle('Keybinds', { Text = 'Show Keybinds Menu', Default = false }):OnChanged(function()
    Library.KeybindFrame.Visible = Flags.Keybinds.Value;
end);
Theme:AddToggle('Watermark', { Text = 'Show Watermark', Default = true }):OnChanged(function()
    Library:SetWatermarkVisibility(Flags.Watermark.Value);
end);

local universal = SettingsTab:AddLeftGroupbox('Universal');

universal:AddButton('Rejoin', function()
local ts = game:GetService("TeleportService")

local p = game:GetService("Players").LocalPlayer

 

ts:Teleport(game.PlaceId, p)
end)

SaveManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager. 
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings() 

-- Adds our MenuKeybind to the ignore list 
-- (do you want each config to have a different menu key? probably not.)
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 

-- use case for doing it this way: 
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
SaveManager:SetFolder('shiestys script/Universal')

-- Builds our config menu on the right side of our tab

		local section = SettingsTab:AddRightGroupbox('Configuration')

		section:AddDropdown('SaveManager_ConfigList', { Text = 'Config list', Values = SaveManager:RefreshConfigList(), AllowNull = true })
		section:AddInput('SaveManager_ConfigName',    { Text = 'Config name' })

	

		section:AddButton('Create config', function()
			local name = Flags.SaveManager_ConfigName.Value

			if name:gsub(' ', '') == '' then 
				return Library:Notify('Invalid config name (empty)', 2)
			end

			local success, err = SaveManager:Save(name)
			if not success then
				return Library:Notify('Failed to save config: ' .. err)
			end

			Library:Notify(string.format('Created config %q', name))

			Flags.SaveManager_ConfigList.Values = SaveManager:RefreshConfigList()
			Flags.SaveManager_ConfigList:SetValues()
			Flags.SaveManager_ConfigList:SetValue(nil)
		end)
		section:AddButton('Load config', function()
			local name = Flags.SaveManager_ConfigList.Value

			local success, err = SaveManager:Load(name)
			if not success then
				return Library:Notify('Failed to load config: ' .. err)
			end

			Library:Notify(string.format('Loaded config %q', name))
                        SetThemes()
		end)

		section:AddButton('Overwrite config', function()
			local name = Flags.SaveManager_ConfigList.Value

			local success, err = SaveManager:Save(name)
			if not success then
				return Library:Notify('Failed to overwrite config: ' .. err)
			end

			Library:Notify(string.format('Overwrote config %q', name))
		end)
		
		section:AddButton('Autoload config', function()
			local name = Flags.SaveManager_ConfigList.Value
			writefile('shiestys script/settings/autoload.txt', name)
			SaveManager.AutoloadLabel:SetText('Current autoload config: ' .. name)
			Library:Notify(string.format('Set %q to auto load', name))
		end)

		section:AddButton('Refresh config list', function()
			Flags.SaveManager_ConfigList.Values = SaveManager:RefreshConfigList()
			Flags.SaveManager_ConfigList:SetValues()
			Flags.SaveManager_ConfigList:SetValue(nil)
		end)

		SaveManager.AutoloadLabel = section:AddLabel('Current autoload config: none', true)

		if isfile('shiestys script/settings/autoload.txt') then
			local name = readfile( 'shiestys script/settings/autoload.txt')
			SaveManager.AutoloadLabel:SetText('Current autoload config: ' .. name)
		end

		SaveManager:SetIgnoreIndexes({ 'SaveManager_ConfigList', 'SaveManager_ConfigName' })

task.spawn(function()
    while game:GetService('RunService').RenderStepped:Wait() do
        if Flags.Rainbow.Value then
            local Registry = TestWindow.Holder.Visible and Library.Registry or Library.HudRegistry;

            for Idx, Object in next, Registry do
                for Property, ColorIdx in next, Object.Properties do
                    if ColorIdx == 'AccentColor' or ColorIdx == 'AccentColorDark' then
                        local Instance = Object.Instance;
                        local yPos = Instance.AbsolutePosition.Y;

                        local Mapped = Library:MapValue(yPos, 0, 1080, 0, 0.5) * 1.5;
                        local Color = Color3.fromHSV((Library.CurrentRainbowHue - Mapped) % 1, 0.8, 1);

                        if ColorIdx == 'AccentColorDark' then
                            Color = Library:GetDarkerColor(Color);
                        end;

                        Instance[Property] = Color;
                    end;
                end;
            end;
        end;
    end;
end);

Flags.Rainbow:OnChanged(function()
    if not Flags.Rainbow.Value then
        UpdateTheme();
    end;
end);

Flags.BackgroundColor:OnChanged(UpdateTheme);
Flags.MainColor:OnChanged(UpdateTheme);
Flags.AccentColor:OnChanged(UpdateTheme);
Flags.OutlineColor:OnChanged(UpdateTheme);
Flags.FontColor:OnChanged(UpdateTheme);
wait(1)
Library:Notify('Loaded UI!');
wait(1)

RunService.RenderStepped:Connect(function()
wait(0.5)
    esp.enabled = Flags.esp_Enabled.Value;
    esp.textlayout.name = {pos = Flags.Namepos.Value, enabled = Flags.esp_Name.Value, color = Flags.NAMColor.Value, transparency = 1};
    esp.textlayout.distance = {pos = Flags.Distancepos.Value, enabled = Flags.esp_Distance.Value, suffix = ' m', color = Flags.DISColor.Value, transparency = 1};
    esp.textlayout.health = {pos = Flags.Helthpos.Value, enabled = Flags.esp_Health.Value, color = Color3.new(0,1,0), transparency = 1}
    esp.barlayout.health = {pos = Flags.Helthbarpos.Value, enabled = Flags.esp_HealthBar.Value, color1 = Color3.new(0,1,0), color2 = Color3.new(0,1,0), transparency = 1};
    esp.teamcheck = Flags.esp_TeamCheck.Value;
    esp.limitdistance = Flags.esp_limdis.Value;
    esp.displaynames = false;
    esp.maxdistance = Flags.DrawDistance.Value;
    esp.arrowradius = Flags.Arrowrad.Value;
    esp.textsize = 13;
    esp.textfont = 2;
    esp.targetcolor = Color3.new(1,.15,.15);
    esp.chams = {Flags.esp_Chams.Value, Flags.ChamColor.Value, Color3.new(0,0,0), .25, 0};
    esp.box = {Flags.esp_Box.Value, Flags.BOColor.Value};
    esp.boxfill = {Flags.esp_BoxFill.Value, Flags.BFILLColor.Value, .25};
    esp.arrow = {Flags.esp_Arrows.Value, Flags.ArrowColor.Value};
    esp.angle = {false, Color3.new(1,1,1)};
    esp.tracer = {false, Color3.new(1,1,1)};
    esp.skeleton = {false, Color3.new(1,1,1)};
    esp.outline = {true, Color3.new(0,0,0)};
end)
esp:init();

Library:Notify('Loaded ESP!');
wait(1)


Library:Notify('Loaded Aim Module!');

local dwCamera = workspace.CurrentCamera
local dwRunService = game:GetService("RunService")
local dwUIS = game:GetService("UserInputService")
local dwEntities = game:GetService("Players")
local dwLocalPlayer = dwEntities.LocalPlayer
local dwMouse = dwLocalPlayer:GetMouse()

local settings = {
    Aimbot = true,
    Aiming = false,
    Aimbot_AimPart = "Head",
    Aimbot_TeamCheck = false,
    Aimbot_Draw_FOV = true,
    Aimbot_FOV_Radius = 200,
    Aimbot_FOV_Color = Color3.fromRGB(255,255,255)
}

local fovcircle = Drawing.new("Circle")
fovcircle.Visible = settings.Aimbot_Draw_FOV
fovcircle.Radius = settings.Aimbot_FOV_Radius
fovcircle.Color = settings.Aimbot_FOV_Color
fovcircle.Thickness = 1
fovcircle.Filled = false
fovcircle.Transparency = 1

fovcircle.Position = Vector2.new(dwCamera.ViewportSize.X / 2, dwCamera.ViewportSize.Y / 2)

dwRunService.RenderStepped:Connect(function()
fovcircle.Visible = settings.Aimbot_Draw_FOV
fovcircle.Radius = settings.Aimbot_FOV_Radius
fovcircle.Color = settings.Aimbot_FOV_Color
settings.Aimbot = Flags.Aimbot.Value
settings.Aimbot_AimPart = Flags.Aimpart.Value
settings.Aimbot_TeamCheck = Flags.Tchek.Value
settings.Aimbot_Draw_FOV = Flags.AimF.Value
settings.Aimbot_FOV_Radius = Flags.AimFRad.Value
settings.Aimbot_FOV_Color = Flags.AFColor.Value
end)

dwUIS.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton2 then
        settings.Aiming = true
    end
end)

dwUIS.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton2 then
        settings.Aiming = false
    end
end)

dwRunService.RenderStepped:Connect(function()
    
    local dist = math.huge
    local closest_char = nil

    if settings.Aiming and Flags.Aimbot.Value == true then

        for i,v in next, dwEntities:GetChildren() do 

            if v ~= dwLocalPlayer and
            v.Character and
            v.Character:FindFirstChild("HumanoidRootPart") and
            v.Character:FindFirstChild("Humanoid") and
            v.Character:FindFirstChild("Humanoid").Health > 0 then

                if settings.Aimbot_TeamCheck == true and
                v.Team ~= dwLocalPlayer.Team or
                settings.Aimbot_TeamCheck == false then

                    local char = v.Character
                    local char_part_pos, is_onscreen = dwCamera:WorldToViewportPoint(char[settings.Aimbot_AimPart].Position)

                    if is_onscreen then

                        local mag = (Vector2.new(dwMouse.X, dwMouse.Y) - Vector2.new(char_part_pos.X, char_part_pos.Y)).Magnitude

                        if mag < dist and mag < settings.Aimbot_FOV_Radius then

                            dist = mag
                            closest_char = char

                        end
                    end
                end
            end
        end

        if closest_char ~= nil and
        closest_char:FindFirstChild("HumanoidRootPart") and
        closest_char:FindFirstChild("Humanoid") and
        closest_char:FindFirstChild("Humanoid").Health > 0 then

            dwCamera.CFrame = CFrame.new(dwCamera.CFrame.Position, closest_char[settings.Aimbot_AimPart].Position)
        end
    end
end)




 
local Snapline_Line = Drawingnew("Line")
Snapline_Line.Visible = true
Snapline_Line.Thickness = 1
Snapline_Line.Transparency = 1
Snapline_Line.From = Vector2new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
Snapline_Line.To = Vector2new(camera.ViewportSize.X /  2, camera.ViewportSize.Y / 2)
Snapline_Line.Color = Color3fromRGB(255, 255, 255)

function Snapline_Closest()
    local target = nil
    local maxDist = mathhuge

    for _,v in ipairs(plrs:GetPlayers()) do
        if v ~= plr and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") then
            local pos, onScreen = camera:WorldToViewportPoint(v.Character[settings.Aimbot_AimPart].Position)
            if onScreen then
                local dist = (Vector2new(pos.X, pos.Y - GetGuiInset(GuiService).Y) - Vector2new(mouse.X, mouse.Y)).Magnitude
                if dist <= maxDist then
                    maxDist = dist 
                    target = v 
                end
            end
        end
    end
    return target
end
 
 
local mainLoop = game:GetService("RunService").RenderStepped:Connect(function()
 local ClosestPlayer = Snapline_Closest()
Snapline_Line.Color = Flags.SLColor.Value
        
        if Flags.Snapline.Value == true and Flags.Aimbot.Value == true and ClosestPlayer ~= nil and ClosestPlayer.Character and ClosestPlayer.Character:FindFirstChild("HumanoidRootPart") and ClosestPlayer.Character:FindFirstChild("Head") then
            local snapVector, snapOnScreen = camera:worldToViewportPoint(ClosestPlayer.Character[settings.Aimbot_AimPart].Position)
            if snapOnScreen then
                Snapline_Line.From = Vector2new(uis:GetMouseLocation().X, uis:GetMouseLocation().Y)
                Snapline_Line.To = Vector2new(snapVector.X, snapVector.Y)
                Snapline_Line.Visible = true
            else
                Snapline_Line.Visible = false
            end
        else
            Snapline_Line.Visible = false
        end
end)     
