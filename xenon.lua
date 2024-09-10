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


getgenv().key = "key"

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

local data = {
    ["key"] = getgenv().key,
    ["bot"] = plr.Name
}

local getmammoz = post(host..'/addstatus', data)

if getmammoz.StatusCode == 200 then
    print("Add Online")
end