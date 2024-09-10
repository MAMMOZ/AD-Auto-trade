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