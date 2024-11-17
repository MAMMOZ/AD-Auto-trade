getgenv().key = "key"

getgenv().Check = false

local host = 'https://cm0obybgw0000mnbsdcdfu7qi.iservkmitl.tech'

function jsonencode(data) 
    return game:GetService("HttpService"):JSONEncode(data)
end

function jsondecode(data)
    return game:GetService("HttpService"):JSONDecode(data)
end

function post(url, data)
    return request({
        Url = url,
        Headers = {
            ["content-type"] = "application/json"
        },
        Method = "POST",
        Body = jsonencode(data),
    })
end

repeat task.wait() until game:IsLoaded()
pcall(function()
    spawn(function()
        local lobbyCount = 0 
        local maxLobbyCount = 2

        while true do
            local Map 
            local IntroGui = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MatchIntroGui")
            if IntroGui then
                Map = "In Game"

                spawn(function()
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/MAMMOZ/AD-Auto-trade/main/xenon.lua"))()                 
                end)

                function getRR()
                    for i,v in pairs(inventory().Items) do
                        if i == "Trait Crystal" then
                            return v
                        end
                    end
                    return 0
                end

                function inventory()
                    return game:GetService("ReplicatedStorage").Remotes.GetInventory:InvokeServer()
                end

                local data = {
                    ["key"] = getgenv().key,
                    ["bot"] = game.Players.LocalPlayer.Name,
                    ["gem"] = inventory().Currencies.Gems,
                    ["rr"] = getRR(),
                }
        
                local getmammoz = post(host..'/addstatus', data)
        
                if getmammoz.StatusCode == 200 then
                    print("Add Online")
                end
                        
                break
            else 
                Map = "In Lobby"
                lobbyCount = lobbyCount + 1 
            end
            
            print("สถานะปัจจุบัน: " .. Map)
            print("จำนวนครั้งที่เจอ 'In Lobby': " .. lobbyCount)
            
            if lobbyCount >= maxLobbyCount then
                print("เจอ 'In Lobby' ครบ ".. lobbyCount .. " ครั้ง ออกจากลูป")

                local player = game:GetService("Players").LocalPlayer
                local playerGui = player:FindFirstChild("PlayerGui")
                if playerGui then
                    local pages = playerGui:FindFirstChild("PAGES")
                    if pages then
                        if pages.Enabled then
                            print("PAGES is enabled")
                            getgenv().Check = true

                            local UnitData = require(game:GetService("ReplicatedStorage").Modules.Bins.UnitData)
                            local Values = require(game:GetService("ReplicatedStorage").Values) 
                            -- 17490500437 -- trade
                            -- 17764698696 - 17017769292 -- lobby
                            local az = game:GetService("ReplicatedStorage").Actions
                            local v1 = cloneref(game:GetService("ReplicatedStorage"))
                            local v_u_1 = cloneref(game:GetService("HttpService"))
                            local v_u_9 = require(v1.Actions)
                            local v_u_10 = require(game:GetService("ReplicatedStorage").Modules.Bitbuf)
                            local v_u_2 = cloneref(game:GetService("RunService"))
                            local v_u_3 = require(game.ReplicatedStorage.Values)
                            local p63 = v_u_9
                            local tickz = tick()
                            local plr = game.Players.LocalPlayer
                            function letfkinggo(p63, ...)
                                local a = {...}
                                if a[1] == "NormalLobby" then
                                    wait(3)
                                    print("dcm where?")
                                end
                                -- print(typeof(a[1]),a[1])
                                -- print(typeof(a[2]),a[2])
                                -- print(typeof(a[3]),a[3])
                                if p63.isReplicated then
                                    local v73 = v_u_1:JSONEncode({ p63.name, ... })
                                    local v74 = v_u_10.new()
                                    local v75 = math.random(42, 48)
                                    if (v75 + 9 + 19) % 8 == 0 then
                                        v75 = v75 + math.random(1, 4)
                                    end
                                    v74:writeUnit(9, v75)
                                    local v76 = workspace:GetServerTimeNow()
                                    v74:WriteUint(v75, (math.floor(v76)))
                                    v74:writeUnit(19, #v73)
                                    v74:WriteBytes(v73)
                                    v74:writeUnit(math.random(5, 10), math.random(1, 31))
                                    az.Action:FireServer(v74:String())
                                end
                            end

                            function getremote(adsadasd)
                                for i,v in pairs(v_u_9) do
                                    if i == adsadasd then
                                        return v.name
                                    end
                                end
                                return false
                            end

                            function inventory()
                                return game:GetService("ReplicatedStorage").Remotes.GetInventory:InvokeServer()
                            end

                            --ขายของ
                            function scaninbooth(name)
                                local allbooth = {}
                                local Values = require(game:GetService("ReplicatedStorage").Values) 
                                for i,v in pairs(Values['ON_SALE_ITEMS' .. tostring(name)].value.Units) do
                                    allbooth[i] = v
                                end
                                return allbooth
                            end

                            function scaninbooth2(name)
                                local allbooth = {}
                                local Values = require(game:GetService("ReplicatedStorage").Values) 
                                for i,v in pairs(Values['ON_SALE_ITEMS' .. tostring(name)].value.Units) do
                                    table.insert(allbooth, i)
                                end
                                return allbooth
                            end

                            function checkOnSale(name, price)
                                local Values = require(game:GetService("ReplicatedStorage").Values) 
                                for i,v in pairs(Values['ON_SALE_ITEMS' .. tostring(name)].value.Units) do
                                    if v.OnSale ~= price then
                                        return true
                                    end
                                end
                                return false
                            end

                            -- ทำการวาป ไปที่บูส
                            function scanbooth(path)
                                for i,v in pairs(game:GetService("Workspace").Folder:GetChildren()) do
                                    if v:FindFirstChild("PromptHolderPart") then
                                        if (path.Position - v.PromptHolderPart.Position).Magnitude < 5 then
                                            return true
                                        end
                                    end
                                end
                                return false
                            end

                            function havebooth()
                                for i,v in pairs(game:GetService("Workspace").Folder:GetChildren()) do
                                    if v.Root.SurfaceGui.PlayerName.Text == "Your Booth" then
                                        return true
                                    end
                                end
                                return false
                            end

                            function checkBack()
                                local playerGui = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui")
                                local PromptGui = playerGui and playerGui:FindFirstChild("PromptGui")
                                local PromptDefault = PromptGui and PromptGui:FindFirstChild("PromptDefault")
                                local Holder = PromptDefault and PromptDefault:FindFirstChild("Holder")
                                local Options = Holder and Holder:FindFirstChild("Options")
                                local Back = Options and Options:FindFirstChild("Back")

                                if Back then
                                    print("Back exists")
                                    return true
                                else
                                    return false
                                end
                            end


                            function dectectinven()
                                local wtf = {}
                                for i,v in pairs(inventory().Units) do
                                    if (v.Type == "Electric Cyborg" or v.Type == "Legion Veteran" or v.Type == "Legion Assassin") then
                                        table.insert(wtf, i)
                                    end
                                end
                                return wtf
                            end

                            -- ดูจำนวนบูสที่ตั้งขายได้ เช่น 4
                            local function getTradeLimit()
                                if type(v_u_3.TRADE_LIMITS) == "table" and type(v_u_3.TRADE_LIMITS.Get) == "function" then
                                    local tradeLimits = v_u_3.TRADE_LIMITS:Get()
                                    if type(tradeLimits.Sales) == "number" then
                                        return tradeLimits.Sales
                                    end
                                end
                                return tonumber(string.match(game:GetService("Players").LocalPlayer.PlayerGui.HUD.TradeLimitHUDMobile.TextLabel.Text, "%d+"))
                            end

                            local function sendTradeRequest(userId)
                                print(v_u_9.TRADE_SEND_REQUEST:Invoke(userId, true, true))
                            end

                            function getRR()
                                for i,v in pairs(inventory().Items) do
                                    if i == "Trait Crystal" then
                                        return v
                                    end
                                end
                                return 0
                            end

                            function addLog()
                                local data = {
                                    ["key"] = getgenv().key,
                                    ["bot"] = plr.Name,
                                    ["gem"] = inventory().Currencies.Gems,
                                    ["rr"] = getRR(),
                                }

                                local getmammoz = post(host..'/addlog', data)

                                if getmammoz.StatusCode == 200 then
                                    return "update status bot suceess"
                                else
                                    return "error bot update status"
                                end
                            end

                            function UpdateStatusMammozTP(bot)
                                local data = {
                                    ["key"] = getgenv().key,
                                    ["bot"] = bot,
                                    ["status"] = 1
                                }

                                local getmammoz = post(host..'/updatestatusmammoz', data)

                                if getmammoz.StatusCode == 200 then
                                    return "update status bot suceess"
                                else
                                    return "error bot update status"
                                end
                            end

                            function UpdateStatusMammoz(newstatus)
                                local data = {
                                    ["key"] = getgenv().key,
                                    ["bot"] = plr.Name,
                                    ["trade"] = getTradeLimit(),
                                    ["map"] = game.PlaceId,
                                    ["status"] = newstatus
                                }

                                local getmammoz = post(host..'/updatemammoz', data)

                                if getmammoz.StatusCode == 200 then
                                    return "update status bot suceess"
                                else
                                    return "error bot update status"
                                end
                            end

                            function SellMammoz()
                                local stop = true
                                while stop do
                                    print("sell")

                                    if havebooth() == false then
                                        for i,v in pairs(game:GetService("Workspace").BoothLocations:GetChildren()) do
                                            if scanbooth(v) == false and havebooth() == false then
                                                plr.Character.HumanoidRootPart.CFrame = v.CFrame
                                                wait(3)
                                                local tickn = tick()
                                                repeat task.wait()
                                                    spawn(function()
                                                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 101, false, game)
                                                    end)
                                                until tick() - tickn >= 5
                                            end
                                        end
                                    else
                                        for i,v in pairs(scaninbooth2(game.Players.LocalPlayer.UserId)) do
                                            if i > 1 then
                                                local args = {
                                                    [1] = getremote("REMOVE_BOOTH_ITEM"),
                                                    [2] = v
                                                }
                                                letfkinggo(p63.REMOVE_BOOTH_ITEM, args[2])
                                                wait(5)
                                            end
                                        end 
                                    end

                                    --ทำการวาป ไปที่บูส (Server)
                                    local data = {
                                        ["key"] = getgenv().key,
                                        ["mammoz"] = plr.Name
                                    }
                                
                                    local getmammoz = post(host..'/mammoztradebot', data)

                                    local response = jsondecode(getmammoz.Body)  -- แทนที่ด้วยตัวแปรเพื่อใช้งานซ้ำ
                                    print(response.status)
                            
                                    if response.status == 1 then  -- ตรวจสอบว่า status ถูกต้อง
                                        -- ขายของ
                                        for i,v in pairs(inventory().Units) do
                                            if v.Type == "Electric Cyborg" or v.Type == "Legion Veteran" or v.Type == "Legion Assassin" then
                                                if scaninbooth(game.Players.LocalPlayer.UserId)[i] == nil then
                                                    if #scaninbooth2(game:GetService("Players"):GetUserIdFromNameAsync(plr.Name)) < 5 then
                                                        local args = {
                                                            [1] = getremote("SELL_BOOTH_ITEMS"),
                                                            [2] = {
                                                                ["Items"] = {
                                                                    [tostring(i)] = {
                                                                        ["Class"] = "Units"
                                                                    }
                                                                },
                                                                ["Price"] = tonumber(jsondecode(getmammoz.Body).gem) -- ใช้ statusm.gem แทน getmammoz.Body
                                                            }
                                                        }
                                                        letfkinggo(p63.SELL_BOOTH_ITEMS, args[2])

                                                        getgenv().autotrademammoz = true
                                                    end
                                                end
                                            end
                                        end
                                        if getgenv().autotrademammoz then
                                            stop = false
                                            UpdateStatusMammoz(2)
                                            TradeMammoz()
                                            break
                                        end
                                    elseif response.status == 2 then
                                        stop = false
                                        UpdateStatusMammoz(2)
                                        TradeMammoz()
                                        break
                                    else
                                        print("Status is not 0, trying again in 15 seconds...")
                                        wait(45)
                                        UpdateStatusMammoz(0)
                                    end
                                end
                            end

                            getgenv().autotrademammoz = false

                            function TradeMammoz()
                                --กดเทรด (Server)
                                local exit = true

                                function Check()
                                    local data = {
                                        ["key"] = getgenv().key,
                                        ["bot"] = plr.Name
                                    }
                                
                                    local getmammoz = post(host..'/check', data)
                                
                                    if getmammoz.StatusCode == 200 then
                                        
                                        checkk = jsondecode(getmammoz.Body)
                                        
                                        if checkk.goto == "Mammoz" then
                                            print("Mammoz")
                                            print(checkk.data.status)
                                
                                            -- ดูจำนวนบูสที่ตั้งขายได้ เช่น 4
                                            local function getTradeLimit()
                                                if type(v_u_3.TRADE_LIMITS) == "table" and type(v_u_3.TRADE_LIMITS.Get) == "function" then
                                                    local tradeLimits = v_u_3.TRADE_LIMITS:Get()
                                                    if type(tradeLimits.Sales) == "number" then
                                                        return tradeLimits.Sales
                                                    end
                                                end
                                                return tonumber(string.match(game:GetService("Players").LocalPlayer.PlayerGui.HUD.TradeLimitHUDMobile.TextLabel.Text, "%d+"))
                                            end
                                
                                            function UpdateStatusMammoz(newstatus)
                                                local data = {
                                                    ["key"] = getgenv().key,
                                                    ["bot"] = plr.Name,
                                                    ["trade"] = getTradeLimit(),
                                                    ["map"] = game.PlaceId,
                                                    ["status"] = newstatus
                                                }
                                            
                                                local getmammoz = post(host..'/updatemammoz', data)
                                            
                                                if getmammoz.StatusCode == 200 then
                                                    return "update status bot suceess"
                                                else
                                                    return "error bot update status"
                                                end
                                            end
                                                    
                                            if game.PlaceId ~= 17490500437 then
                                                letfkinggo(p63.GAME_MODE_SELECTED_CTS, "TradingLobby")
                                                UpdateStatusMammoz(0)
                                            else
                                                if tonumber(checkk.data.status) == 0 then
                                                    if game.PlaceId ~= 17490500437 then
                                                        letfkinggo(p63.GAME_MODE_SELECTED_CTS, "TradingLobby")
                                                    else
                                                        UpdateStatusMammoz(1)
                                                        SellMammoz()
                                                    end
                                                    UpdateStatusMammoz(1)
                                                elseif tonumber(checkk.data.status) == 1 then
                                                    -- Go Sell Mammoz
                                                    SellMammoz()
                                                elseif tonumber(checkk.data.status) == 2 then
                                                    -- Go Trade Mammoz
                                                    TradeMammoz()
                                                end
                                            end
                                        end
                                    end
                                end

                                function dmm()

                                    wait(30)

                                    local data = {
                                        ["key"] = getgenv().key,
                                        ["mammoz"] = plr.Name
                                    }
                                
                                    local getmammoz = post(host..'/mammoztradebot', data)
                                    local decodedBody = nil
                                
                                    repeat
                                        local success, err = pcall(function()
                                            if getmammoz and getmammoz.Body then
                                                decodedBody = jsondecode(getmammoz.Body)
                                            else
                                                print("Error: Invalid response from API")
                                            end
                                        end)
                                    
                                        if not success then
                                            print("Error decoding JSON: ", err)
                                        end

                                        wait(10)
                                    until decodedBody and decodedBody.status

                                    print("decodedBody.status:", decodedBody.status)

                                    if decodedBody.status == 2 then
                                        -- กดยืนยันเทรด
                                        local args = {
                                            [1] = "TRADE_LOCK",
                                            [4] = true
                                        }
                                        letfkinggo(p63.TRADE_UPDATE_CONTENTS, unpack(args))

                                        print("ACCCCCCC")

                                        wait(20)

                                        exit = false

                                        -- เปลี่ยนเป็นพร้อมเทรด
                                        UpdateStatusMammoz(0)

                                        if checkBack() then
                                            print("Have Back")
                                            exit = false
                                            getgenv().autotrademammoz =false
                                        end

                                        Check()
                                                
                                    end
                                end

                                spawn(function()
                                    if game.PlaceId == 17490500437 then

                                        local TradeRemotes = game.ReplicatedStorage:WaitForChild("TradeRemotes")
                                        TradeRemotes.TradeUpdated.OnClientEvent:Connect(function(p27, p28)
                                            print(p27, p28)
                                            local playerData = p28 and p28[tostring(plr.UserId)]

                                            if p27 == "Requesting" then
                                                spawn(function()
                                                    exit = false
                                                    dmm()
                                                end)
                                            elseif p27 == "Active" then
                                            elseif p27 == "Cancelled" or p27 == "Completed" then
                                            end
                                        end)
                                    end

                                    while exit do wait(15)
                                        if exit then
                                            local data = {
                                                ["key"] = getgenv().key,
                                                ["mammoz"] = plr.Name
                                            }
                                        
                                            local getmammoz = post(host..'/mammoztradebot', data)
                                            local response = jsondecode(getmammoz.Body)
                                            print(response.status)

                                            if response.status == 2 then
                                                print("autotradeMammoz()")
                                                --สแปม trade
                                                local player = game:GetService("Players"):FindFirstChild(response.bot)
                                                if player then
                                                    print(player.UserId)
                                                    v_u_9.TRADE_SEND_REQUEST:Invoke(game:GetService("Players")[response.bot].UserId, false, true)
                                                else
                                                    print("Player not found.")
                                                end
                                            end
                                        end
                                    end
                                end)
                            end

                            function UpdateStatusBot(newstatus)

                                local data = {
                                    ["key"] = getgenv().key,
                                    ["bot"] = plr.Name,
                                    ["status"] = newstatus
                                }

                                local getmammoz = post(host..'/updatetrade', data)

                                if getmammoz.StatusCode == 200 then
                                    return "update status bot suceess"
                                else
                                    return "error bot update status"
                                end

                            end

                            function TradeBot(name)
                                local shouldStop = true
                                local stop = true

                                function acc()
                                    --กดยืนยัน
                                    while shouldStop do
                                        pcall(function()

                                            local args = {
                                                [1] = "TRADE_LOCK",
                                                [4] = true
                                            }
                                            letfkinggo(p63.TRADE_UPDATE_CONTENTS, unpack(args))

                                            wait(20)

                                            if getRR() == 0 then

                                                local data = {
                                                    ["key"] = getgenv().key,
                                                    ["bot"] = plr.Name
                                                }
                                            
                                                local getmammoz = post(host..'/deletrade', data)
                                            
                                                if getmammoz.StatusCode == 200 then
                                                    print("dele trade bot suceess")
                                                else
                                                    print("error bot dele trade")
                                                end

                                                -- update status trade
                                                -- UpdateStatusBot(3)

                                                shouldStop = false

                                                if checkBack() then
                                                    print("Have Back")
                                                    letfkinggo(p63.GAME_MODE_SELECTED_CTS, "NormalLobby")
                                                    exit = false
                                                end

                                                exit = false
                                                letfkinggo(p63.GAME_MODE_SELECTED_CTS, "NormalLobby")
                                            end

                                            wait(30)

                                        end)
                                    end

                                    print("Exit acc")
                                end

                                --กดเทรด rr fb rd Units (BOT)
                                function dmm()
                                    wait(5)
                                    for i, v in pairs(dectectinven()) do
                                        wait(2)
                                        letfkinggo(v_u_9.TRADE_UPDATE_CONTENTS, v, "Units", 1, true)
                                    end
                                    wait(2)
                                    letfkinggo(v_u_9.TRADE_UPDATE_CONTENTS, "Frost Bind", "Items", inventory().Items["Frost Bind"], true)        
                                    wait(2)
                                    letfkinggo(v_u_9.TRADE_UPDATE_CONTENTS, "Trait Crystal", "Items", inventory().Items["Trait Crystal"], true)
                                    wait(2)
                                    letfkinggo(v_u_9.TRADE_UPDATE_CONTENTS, "Risky Dice", "Items", inventory().Items["Risky Dice"], true)
                                    wait(2)
                                    -- getgenv().autolock = true
                                end

                                spawn(function()
                                    local player = game:GetService("Players"):FindFirstChild(name.mammoz)
                                    if player then
                                        if game.PlaceId == 17490500437 then

                                            local TradeRemotes = game.ReplicatedStorage:WaitForChild("TradeRemotes")
                                            TradeRemotes.TradeUpdated.OnClientEvent:Connect(function(p27, p28)
                                                print(p27, p28)
                                                local playerData = p28 and p28[tostring(plr.UserId)]

                                                if p27 == "Requesting" then
                                                    spawn(function()
                                                        stop = false
                                                        dmm()
                                                        acc()
                                                    end)
                                                elseif p27 == "Active" then
                                                elseif p27 == "Cancelled" or p27 == "Completed" then
                                                end
                                            end)
                                        end

                                        while stop do wait(10)
                                            print("autoteadeBot()")
                                            print(name.mammoz)
                                            v_u_9.TRADE_SEND_REQUEST:Invoke(game:GetService("Players")[name.mammoz].UserId, false, true)
                                        end
                                    else
                                        letfkinggo(p63.GAME_MODE_SELECTED_CTS, "NormalLobby")
                                        print("Player not found. autoTradeBot")
                                    end
                                end)
                            end

                            function BuyBot(data)
                                local stop = true
                                while stop do

                                    local player = game:GetService("Players"):FindFirstChild(data.mammoz)
                                    if player then
                                        print("autoBuyBot : "..data.mammoz)
                                        print(inventory().Currencies.Gems)
                                        print(tonumber(data.gem))
                                        print(data.bot)
                                        print(plr.Name)
                                        
                                        if tonumber(inventory().Currencies.Gems) >= tonumber(data.gem) and data.bot == plr.Name then

                                            local dataa = {
                                                ["key"] = getgenv().key,
                                                ["bot"] = plr.Name,
                                                ["gem"] = inventory().Currencies.Gems,
                                                ["rr"] = getRR(),
                                            }
                                        
                                            local getmammoz = post(host..'/addlog', dataa)
                                            if getmammoz.StatusCode == 200 then
                                                print("add log bot suceess")
                                            else
                                                print("error bot add log")
                                            end


                                            -- กดซื้อ (BOT)
                                            for i,v in pairs(scaninbooth2(game:GetService("Players"):GetUserIdFromNameAsync(data.mammoz))) do
                                                local args = { -- buy -- BUY_BOOTH_ITEM
                                                [1] = getremote("BUY_BOOTH_ITEM"),
                                                [2] = game:GetService("Players"):GetUserIdFromNameAsync(data.mammoz),
                                                [3] = v
                                            }
                                            letfkinggo(p63.BUY_BOOTH_ITEM, args[2],args[3])
                                            
                                            wait(8)
                                            
                                            if tonumber(inventory().Currencies.Gems) >= 0 then
                                                -- Update Status Mammoz 1
                                                    UpdateStatusBot(2)
                                                    TradeBot(data)
                                                    stop = false
                                                end
                                            end
                                        end
                                    else
                                        letfkinggo(p63.GAME_MODE_SELECTED_CTS, "NormalLobby")
                                        print("Player not found. autoBuyBot")
                                    end
                                    wait(20)
                                end
                            end

                            function AddBot(status)

                                local data = {
                                    ["key"] = getgenv().key,
                                    ["bot"] = plr.Name,
                                    ["gem"] = inventory().Currencies.Gems,
                                    ["rr"] = getRR(),
                                    ["map"] = game.PlaceId,
                                    ["status"] = status
                                }

                                local getmammoz = post(host..'/addtrade', data)

                                if getmammoz.StatusCode == 200 then
                                    print("add bot suceess")
                                    return "add bot suceess"
                                else
                                    print("error bot add")
                                    return "error bot add"
                                end

                                wait(3)
                            end

                            function Check()

                                while true do

                                    local data = {
                                        ["key"] = getgenv().key,
                                        ["bot"] = plr.Name
                                    }

                                    local getmammoz = post(host..'/check', data)

                                    if getmammoz.StatusCode == 200 then
                                        
                                        checkk = jsondecode(getmammoz.Body)
                                        
                                        if checkk.goto == "Mammoz" then
                                            print("Mammoz")
                                            print(checkk.data.status)

                                                    -- ดูจำนวนบูสที่ตั้งขายได้ เช่น 4
                                            local function getTradeLimit()
                                                if type(v_u_3.TRADE_LIMITS) == "table" and type(v_u_3.TRADE_LIMITS.Get) == "function" then
                                                    local tradeLimits = v_u_3.TRADE_LIMITS:Get()
                                                    if type(tradeLimits.Sales) == "number" then
                                                        return tradeLimits.Sales
                                                    end
                                                end
                                                return tonumber(string.match(game:GetService("Players").LocalPlayer.PlayerGui.HUD.TradeLimitHUDMobile.TextLabel.Text, "%d+"))
                                            end

                                            function UpdateStatusMammoz(newstatus)
                                                local data = {
                                                    ["key"] = getgenv().key,
                                                    ["bot"] = plr.Name,
                                                    ["trade"] = getTradeLimit(),
                                                    ["map"] = game.PlaceId,
                                                    ["status"] = newstatus
                                                }
                                            
                                                local getmammoz = post(host..'/updatemammoz', data)
                                            
                                                if getmammoz.StatusCode == 200 then
                                                    return "update status bot suceess"
                                                else
                                                    return "error bot update status"
                                                end
                                            end
                                                    
                                            if game.PlaceId ~= 17490500437 then
                                                letfkinggo(p63.GAME_MODE_SELECTED_CTS, "TradingLobby")
                                                UpdateStatusMammoz(0)
                                            else
                                                if tonumber(checkk.data.status) == 0 then
                                                    if game.PlaceId ~= 17490500437 then
                                                        letfkinggo(p63.GAME_MODE_SELECTED_CTS, "TradingLobby")
                                                    end
                                                    UpdateStatusMammoz(1)
                                                elseif tonumber(checkk.data.status) == 1 then
                                                    -- Go Sell Mammoz
                                                    SellMammoz()
                                                    break
                                                elseif tonumber(checkk.data.status) == 2 then
                                                    -- Go Trade Mammoz
                                                    --TradeMammoz()
                                                    
                                                    -- fix
                                                    UpdateStatusMammoz(1)
                                                    SellMammoz()
                                                    break
                                                end
                                            end
                                        elseif checkk.goto == "Bot Auto" then
                                            if tonumber(inventory().Currencies.Gems) >= 20000 or tonumber(getRR()) >= 250 then
                                                if checkk.data.bot == plr.Name then
                                                    print("Bot Auto")
                                                    print(tonumber(checkk.data.status))
                                                    if game.PlaceId ~= 17490500437 then
                                                        letfkinggo(p63.GAME_MODE_SELECTED_CTS, "TradingLobby", checkk.data.mammoz)
                                                    end
                                                    wait(5)
                                                    if tonumber(checkk.data.status) == 0 then
                                                        if game.PlaceId ~= 17490500437 then
                                                            letfkinggo(p63.GAME_MODE_SELECTED_CTS, "TradingLobby", checkk.data.mammoz)
                                                        end
                                                        UpdateStatusMammozTP(checkk.data.mammoz)
                                                        UpdateStatusBot(1)
                                                    elseif tonumber(checkk.data.status) == 1 then
                                                        -- Go Buy Bot
                                                        if game.PlaceId == 17490500437 then
                                                            UpdateStatusMammozTP(checkk.data.mammoz)
                                                            BuyBot(checkk.data)
                                                            break
                                                        end
                                                    elseif tonumber(checkk.data.status) == 2 then
                                                        -- Go Trade Bot
                                                        wait(40)
                                                        if game.PlaceId == 17490500437 then
                                                            print(checkk.data)
                                                            TradeBot(checkk.data)
                                                            break
                                                        end
                                                    end
                                                else
                                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/MAMMOZ/AD-Auto-trade/refs/heads/main/Play.lua"))()
                                                end
                                            else
                                                loadstring(game:HttpGet("https://raw.githubusercontent.com/MAMMOZ/AD-Auto-trade/refs/heads/main/Play.lua"))()
                                            end
                                        elseif checkk.goto == "Add Bot Now" then
                                            if tonumber(inventory().Currencies.Gems) >= 20000 then
                                                -- ADD Trade Bot
                                                print("Add Bot Now")
                                                if tonumber(inventory().Currencies.Gems) >= 20000 then
                                                    checkaddbot = AddBot(0)
                                                    if checkaddbot == "error bot add" then
                                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/MAMMOZ/AD-Auto-trade/refs/heads/main/Play.lua"))()
                                                    else
                                                        Check()
                                                        break
                                                    end
                                                elseif tonumber(getRR()) >= 250 then
                                                    checkaddbot = AddBot(2)
                                                    if checkaddbot == "error bot add" then
                                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/MAMMOZ/AD-Auto-trade/refs/heads/main/Play.lua"))()
                                                    else
                                                        Check()
                                                        break
                                                    end
                                                end
                                            else
                                                loadstring(game:HttpGet("https://raw.githubusercontent.com/MAMMOZ/AD-Auto-trade/refs/heads/main/Play.lua"))()
                                            end
                                        end
                                    else
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/MAMMOZ/AD-Auto-trade/refs/heads/main/Play.lua"))()
                                    end
                                    wait(10)
                                end
                            end

                            pcall(function()
                                spawn(function()
                                    if getgenv().Check == true then
                                        print("getgenv().Check")
                                        Check()
                                    end
    
                                end)
                            end)

                            break
                        end
                    else
                        local targetPlaceId = 17017769292
                        if game.PlaceId == targetPlaceId then
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
