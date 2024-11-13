local names = {
    "yE6LGF", "Zu0tJ8", "mbaOYx", "XkYnAu", "VSiria4", "yt0ROn", "IFVYy2",
    "AXWldb", "PIswcF", "2KWgVS", "bwo37r", "JDMQCy", "eK43ZA", "y6RSb6",
    "WrzgE1", "JcPBKR", "2jXlu8", "HzOa8X", "CRNjnQ", "viQD91", "GnKu8I",
    "npsqFl", "FLNTGV", "Z7Oecg", "I6MnYe", "rGBalK", "c01hyH", "qiDdjx2",
    "M24yBG", "LxaQx4", "eb8QTp", "QKYXKr", "tE7AM7", "mhXdUW", "Co9hxC",
    "xiDWel", "uhYbIL", "tAAN9M", "w2qv3u", "bDvqas", "EvOyLc", "mKt6Ew",
    "poslYO9", "qL6KHi", "h6jTSw", "QxrgSE", "wmrKr5", "2pQ3YH", "0rQChH",
    "PqsgWy", "uFDkiE_2", "6VWSuf", "r6rQYw", "7m3C0C", "WgGQJe", "XFZ1JB",
    "nzQSka", "sJZROP", "MW3Y2y", "sWCeiJ4"
}

local function checkName(name)
    if table.find(names, name) then
        return true
    else
        return false
    end
end

spawn(function()
    local check = checkName(game.Players.LocalPlayer.Name)
    if check then
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
        
        getgenv().Key = "MARU-Q2P5-69DAP-W3ZU-NBQMT-1YP4"
        getgenv().id = "1085195490976616470"
        getgenv().Script_Mode = "Kaitun_Script"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/MaruBitkub/main/Mobile.lua"))()       
    else
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
                Speed = 1, -- 1 , 2 ,3
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
        getgenv().key = '1a9a8b51-c3ee-4c5c-bb21-36f4ee05a56c'
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Xenon-Trash/Loader/main/Loader.lua'))()  
    end
end)




-- wait(60*3)

-- local lobbyCount = 0 
-- local maxLobbyCount = 20

-- while true do
--     local Map 
--     local IntroGui = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MatchIntroGui")
--     if IntroGui then
--         Map = "In Game"
--     else 
--         Map = "In Lobby"
--         lobbyCount = lobbyCount + 1
--     end

--     if lobbyCount >= maxLobbyCount then
--         player:Kick("BUG SEVER by Sanbux")
--     end
-- end
