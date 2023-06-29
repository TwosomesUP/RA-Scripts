// Zen: Intergalactic Ninja - Leaderboards
// #ID = 4213

gameState = byte(0xdee0)

gameState_Title = 0x02
gameState_InGame = 0x06
gameState_GameOver = 0x07
gameState_StageClear = 0x07
gameState_Bonus = 0x08
gameState_BonusFailed = 0x0a
gameState_Ending = 0x0b

function inGame() => gameState == gameState_InGame

//
gameScene = byte(0xdee1)

gameScene_Title = 0x02

gameScene_InGame_Start = 0x00
gameScene_InGame_InLevel = 0x01
gameScene_InGame_PreBoss = 0x02
gameScene_InGame_Boss = 0x03
gameScene_InGame_Continue = 0x04

gameScene_GameOver = 0x08

gameScene_StageClear = 0x00

gameScene_Bonus_Start = 0x01
gameScene_Bonus_InLevel = 0x02
gameScene_Bonus_Success = 0x04
gameScene_Bonus_Score = 0x08

gameScene_BonusFailed = 0x03
gameScene_BonusFailed_Score = 0x05

gameScene_Ending = 0x00

//
gameArea = byte(0xdef1)

gameArea_DustArea = 0x00
gameArea_DamArea = 0x01
gameArea_SmogArea = 0x02
gameArea_OilArea = 0x03
gameArea_FinalArea = 0x04

function startedArea(area) => gameArea == area && gameState == gameState_InGame && prev(gameScene) == gameScene_InGame_Start && gameScene == gameScene_InGame_InLevel
function finishedArea(area) => gameArea == area && (prev(gameState) == gameState_InGame && prev(gameScene) == gameScene_InGame_Boss) && (gameState == gameState_StageClear && gameScene == gameScene_StageClear)

//Oil Area - Speedrun

//Dam Area - Speedrun

//Dust Area - Speedrun

//Smog Area - Speedrun

//Final Area - Speedrun

//Complete Game - Speedrun