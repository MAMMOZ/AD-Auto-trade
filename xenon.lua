local lobbyCount = 0 
local maxLobbyCount = 60 

repeat task.wait() until game:IsLoaded()
pcall(function()
    spawn(function()
        while true do
            local Map 
            local IntroGui = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MatchIntroGui")
            if IntroGui then
                Map = "In Game"
                repeat task.wait() until game:IsLoaded()
                _G.Webhook  = {['WebhookLink'] = 'Link', ['SendWebhookReward'] = true}
                _G.SettingsAD = {
                    ["LeaveAtWave"] = 31,
                    ["DelayStartLobby"] = 20,
                    ["MethodLeave"] = "Sell",
                    ["ReplayInStoryMode"] = false,
                    ["BlackScreen"] = true,
                    ["EquipBest"] = true,
                    ["SpeedModifier"] = 1
                }

                getgenv().Key = "MARU-ADIG-JM3XH-PQI7-82ZVQ-MWMB"
                getgenv().id = "969581952531316827"
                getgenv().Script_Mode = "Kaitun_Script"
                loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/MaruBitkub/main/Mobile.lua"))()
                break
            else 
                Map = "In Lobby"
                lobbyCount = lobbyCount + 1 
            end
            
            print("สถานะปัจจุบัน: " .. Map)
            print("จำนวนครั้งที่เจอ 'In Lobby': " .. lobbyCount)
            
            if lobbyCount >= maxLobbyCount then
                print("เจอ 'In Lobby' ครบ 60 ครั้ง ออกจากลูป")

                local player = game:GetService("Players").LocalPlayer
                local playerGui = player:FindFirstChild("PlayerGui")
                if playerGui then
                    local pages = playerGui:FindFirstChild("PAGES")
                    if pages then
                        if pages.Enabled then
                            print("PAGES is enabled")

                            repeat task.wait() until game:IsLoaded()
                            _G.Webhook  = {['WebhookLink'] = 'Link', ['SendWebhookReward'] = true}
                            _G.SettingsAD = {
                                ["LeaveAtWave"] = 31,
                                ["DelayStartLobby"] = 20,
                                ["MethodLeave"] = "Sell",
                                ["ReplayInStoryMode"] = false,
                                ["BlackScreen"] = true,
                                ["EquipBest"] = true,
                                ["SpeedModifier"] = 1
                            }

                            getgenv().Key = "MARU-ADIG-JM3XH-PQI7-82ZVQ-MWMB"
                            getgenv().id = "969581952531316827"
                            getgenv().Script_Mode = "Kaitun_Script"
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/MaruBitkub/main/Mobile.lua"))()

                        end
                    else
                        local targetPlaceId = 17017769292
                        if game.PlaceId == targetPlaceId then
                            wait(5)
                            local Players = game:GetService("Players")
                            local player = Players.LocalPlayer
        
                            if player then
                                player:Kick("BUG SEVER by Sanbux")
                            end
                        end
                        print("PAGES does not exist")
                    end
                else
                    print("PlayerGui does not exist")
                end
                break 
            end
            
            wait(1)
        end
    end)
end)