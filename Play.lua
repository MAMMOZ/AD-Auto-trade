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
    ['Roll Mythic'] = true,
    ['Roll Method'] = 1,
    ['Auto Feed Mythic'] = false,
    ['Use Auto Sell'] = true,
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
