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

                            getgenv().Configuration = {
                                ['Enabled'] = true,
                                ['Enabled Challenge'] = false,
                                ['PC Name'] = 'dekonemillionbaht',
                                ['Delay'] = 0,
                                ['Leave Delay'] = 0,
                                ['EquipBest'] = true,
                                ['Leave At Wave'] = 31,
                                ['Leave Method'] = 2, -- 1 = Sell,  2 = Leave
                                ['TradingMode'] = false,
                                ['ClaimBattlepass'] = true,
                                ['Roll Mythic'] = false,
                                ['Roll Method'] = 1,
                                ['Auto Feed Mythic'] = false,
                                ['Use Auto Sell'] = false,
                                ['Game Speed'] = {
                                    Enabled = true,
                                    Speed = 2, -- 1 , 2 ,3
                                },
                                ['Sell Config'] = {
                                    ['Rare'] = false,
                                    ['Epic'] = false,
                                    ['Legendary'] = false,
                                    ['Rare Shiny'] = false,
                                    ['Epic Shiny'] = false,
                                    ['Legendary Shiny'] = false,
                                },
                                ['Placement Distance'] = 25,
                            };
                            getgenv().key = 'bc488106-f328-491d-ae68-e015a4475fe3'
                            loadstring(game:HttpGet('https://raw.githubusercontent.com/Xenon-Trash/Loader/main/Loader.lua'))()
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