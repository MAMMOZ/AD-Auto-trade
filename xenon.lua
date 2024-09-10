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