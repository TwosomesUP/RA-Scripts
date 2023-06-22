// Zen: Intergalactic Ninja
// #ID = 4213

//Memory Accessors

//Screen Coordinates
playerYCoordinate = byte(0xc00f)
playerXCoordinate = byte(0xc014)

//Health and Lives
playerHealth = byte(0xc089)
playerLives = byte(0xdeda)
bossHealth = byte(0xc605)

//Player Score
score = word_be(0xc38e)

//Player Attacks
chargedShotState = byte(0xc101)

chargedShotState_EnemyHit = 0x01

//Game State - Base state for each scene in the game
gameState = byte(0xdee0)

gameState_Title = 0x02
gameState_InGame = 0x06
gameState_GameOver = 0x07
gameState_StageClear = 0x07
gameState_Bonus = 0x08
gameState_BonusFailed = 0x0a
gameState_Ending = 0x0b

//Game Scenes - Paired with gameState for complete scene
gameScene = byte(0xdee1)

gameScene_Title = 0x02

gameScene_InGame_Start = 0x00
gameScene_InGame_InLevel = 0x01
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

//Game Areas
gameArea = byte(0xdef1)

gameArea_DustArea = 0x00
gameArea_DamArea = 0x01
gameArea_SmogArea = 0x02
gameArea_OilArea = 0x03
gameArea_FinalArea = 0x04

//Area Sections
areaSection = byte(0xdd40)

areaSection_DustArea_Beginning = 0x00
areaSection_DustArea_AvalancheDecent = 0x01
areaSection_DustArea_SpikePresses = 0x02
areaSection_DustArea_JunkAscent = 0x03
areaSection_DustArea_Cranes = 0x04
areaSection_DustArea_Boss = 0x05

areaSection_DamArea_Beginning = 0x00
areaSection_DamArea_FallingBridge = 0x01
areaSection_DamArea_WaterFalls = 0x02
areaSection_DamArea_WaterFallLasers = 0x03
areaSection_DamArea_WaterFallAscent = 0x04
areaSection_DamArea_Boss = 0x05

areaSection_SmogArea_Beginning = 0x00
areaSection_SmogArea_AcidRain = 0x01
areaSection_SmogArea_AcidRainEnd = 0x02
areaSection_SmogArea_TreeAscent = 0x03
areaSection_SmogArea_Rooftop = 0x04
areaSection_SmogArea_Boss = 0x05

areaSection_OilArea_Beginning = 0x00
areaSection_OilArea_PipeDecent = 0x01
areaSection_OilArea_Barrels = 0x02
areaSection_OilArea_Boss = 0x03

areaSection_FinalArea_Beginning = 0x00
areaSection_FinalArea_Flames = 0x01
areaSection_FinalArea_RockFallDecent = 0x02
areaSection_FinalArea_Skulls = 0x03
areaSection_FinalArea_Boss = 0x04

//Collected Items
itemArrayBegin = 0xc180
itemArrayCount = 7

//Invincibility Frames
invincibility = byte(0xc006)

invincibility_none = 0x00
invincibility_damaged = 0x48
invincibility_powercrystal = 0xc8

//Boss States
bossState = byte(0xc020)

bossState_DustArea_Defeated = 0x06

bossState_DamArea_Defeated = 0x04

bossState_SmogArea_Defeated = 0x05

bossState_OilArea_InFloor = 0x00
bossState_OilArea_Bouncing = 0x01
bossState_OilArea_Dropping = 0x02
bossState_OilArea_Standing = 0x03
bossState_OilArea_Ceiling = 0x04
bossState_OilArea_Defeated = 0x05

bossState_FinalArea_Defeated = 0x05

bossStateByArea_Defeated = 
[
    bossState_DustArea_Defeated, 
    bossState_DamArea_Defeated, 
    bossState_SmogArea_Defeated, 
    bossState_OilArea_Defeated, 
    bossState_FinalArea_Defeated
]

//Functions
function inGame() => gameState == gameState_InGame
function inBonus() => gameState == gameState_Bonus

function playingLevel() => inGame() && gameScene == gameScene_InGame_InLevel
function fightingBoss() => inGame() && gameScene == gameScene_InGame_Boss
function startedLevel() => tally(1, inGame() && prev(gameScene) == gameScene_InGame_Start && gameScene == gameScene_InGame_InLevel)
function completedLevel() => (prev(gameState) == gameState_InGame && prev(gameScene) == gameScene_InGame_Boss) && (gameState == gameState_StageClear && gameScene == gameScene_StageClear)
function completedFinalLevel() => (prev(gameState) == gameState_InGame && prev(gameScene) == gameScene_InGame_Boss) && (gameState == gameState_Ending && gameScene == gameScene_Ending) 

function playingBonus() => inBonus() && gameScene == gameScene_Bonus_InLevel
function startedBonus() => tally(1, inBonus() && prev(gameScene) == gameScene_Bonus_Start && gameScene == gameScene_Bonus_InLevel)
function completedBonus() => inBonus() && gameScene == gameScene_Bonus_Success

function highScoreReached(target){
    return 
        (prev(score) <= target && score > target) &&
        (
            (startedLevel() && (playingLevel() || fightingBoss())) ||
            (startedBonus() && (playingBonus() || completedBonus()))
        ) &&
        never(!inGame() && !inBonus())
}

function playingArea(area){
    return 
        playingLevel() &&
        gameArea == area
}

function completedArea(area){
    return 
        completedLevel() &&
        gameArea == area
}

function completedGame(){
    return
        completedFinalLevel() &&
        gameArea == gameArea_FinalArea
}

function completedAreaNoDeath(area){
    return 
        startedLevel() &&
        gameArea == area &&
        prev(gameState) == gameState_InGame && prev(gameScene) == gameScene_InGame_Boss && 
        trigger_when(gameState == gameState_StageClear && gameScene == gameScene_StageClear) &&
        disable_when(lostLives(), gameState != gameState_InGame)
}

function completedGameNoDeath(){
    return 
        startedLevel() &&
        gameArea == gameArea_FinalArea &&
        prev(gameState) == gameState_InGame && prev(gameScene) == gameScene_InGame_Boss && 
        trigger_when(gameState == gameState_Ending && gameScene == gameScene_Ending) &&
        disable_when(lostLives(), gameState != gameState_InGame)
}

function playingAreaBonus(area){
    return
        playingBonus() &&
        gameArea == area
}

function fightingAreaBoss(area){
    return 
        fightingBoss() &&
        gameArea == area
}

function defeatedAreaBossMeleeOnly(area){
    return 
        fightingBoss() &&
        gameArea == area &&
        prev(bossState) != bossStateByArea_Defeated[area] && 
        trigger_when(bossState == bossStateByArea_Defeated[area]) &&
        disable_when(chargeDamage(), !fightingBoss())
}

function oilSlickPhaseChallenge(){
    return 
        fightingBoss() &&
        gameArea == gameArea_OilArea &&
        trigger_when(repeated(3, chargeDamage())) &&
        (
            never(!(fightingBoss() && gameArea == gameArea_OilArea)) || 
            never(bossState == bossState_OilArea_Bouncing || bossState == bossState_OilArea_Defeated)
        )
}

function chargeDamage(){
    return 
        prev(bossHealth) > bossHealth &&
        chargedShotState == chargedShotState_EnemyHit
}

function itemCollected(){
    return any_of(range(0, 7), itemCheck)
}

function itemCheck(index){
    return prev(byte(itemArrayBegin + index)) < byte(itemArrayBegin + index)
}

function noDamage() => prev(playerHealth) == playerHealth
function gainedHealth() => prev(playerHealth) < playerHealth
function lostHealth() => prev(playerHealth) > playerHealth

function gotPowerCrystal() => noDamage() && prev(invincibility) == invincibility_none && invincibility == invincibility_powercrystal

function gainedLives() => prev(playerLives) < playerLives
function lostLives() => prev(playerLives) > playerLives

//Achievements

//High Score >= 30000
//  - level started and in level || bonus started and in bonus or bonus completed
//  - score >= 30000 && delta(score) < 30000
achievement(
    title = "High Score > 30000",
    points = 3,
    description = "Achieve a high score greater than 30000",
    trigger = highScoreReached(0x300)  
)

//High Score >= 120000
//  - in level or fighting boss || in bonus or on bonus complete
//  - score >= 120000 && delta(score) < 120000
//  - requires no continues and perfect bonus completions
achievement(
    title = "High Score > 120000",
    points = 10,
    description = "Achieve a high score greater than 120000",
    trigger = highScoreReached(0x1200)    
)

//Collect a Power Crystal and become invulnerable
//  - in level
//  - collect an item
//  - become invulnerable (not from damage)
achievement(
    title = "Power Crystal Collected",
    points = 1,
    description = "Collect a Power Crystal and become invulnerable",
    trigger = playingLevel() && itemCollected() && gotPowerCrystal()
)

//Collect a Life Up item and replenish your health
//  - in level
//  - collect an item
//  - replenish life (can be at max)
achievement(
    title = "Life Up Collected",
    points = 1,
    description = "Collected a Life Up item and replenished your health",
    trigger = playingLevel() && itemCollected() && gainedHealth()
)

//Collect a Zen Up item and increase your lives
//  - in level
//  - collect an item
//  - gain a life
achievement(
    title = "Zen Up Collected",
    points = 1,
    description = "Collected a Zen Up item and increase your lives",
    trigger = playingLevel() && itemCollected() && gainedLives()
)

//Oil Area - Complete
//  - current area == oil area
//  - previously fighting boss
//  - currently on success screen
achievement(
    title = "Oil Area - Complete",
    points = 2,
    description = "Complete the Oil Area",
    trigger = completedArea(gameArea_OilArea)
)

//Oil Area - Complete (No Deaths)
//  - current area == oil area
//  - previously fighting boss
//  - currently on success screen
//  - don't die
achievement(
    title = "Oil Area - No Deaths",
    points = 5,
    description = "Complete the Oil Area without dying",
    trigger = completedAreaNoDeath(gameArea_OilArea)
)

//Oil Area - Reach the bottom of the Pipes Decent without taking damage (No Crystal)
achievement(
    title = "Oil Area - Pipes Decent",
    points = 3,
    description = "Reach the bottom of the Pipes Decent in the Oil Area without taking damage (no power crystal)",
    trigger = always_true()
)

//Oil Area - Defeat Oil Slick (Melee Only)
//  - prev fighting boss
//  - boss defeated
//  - pause if charge damages boss
//  - reset if not fighting boss or not in game
achievement(
    title = "Oil Area - Melee Only",
    points = 5,
    description = "Defeat Oil Slick in the Oil Area using only melee attacks",
    trigger = defeatedAreaBossMeleeOnly(gameArea_OilArea)
)

//Hit the Oil Area Boss 3 times with your charged attack in a single phase
achievement(
    title = "Oil Area - Phase Challenge",
    points = 3,
    description = "Damage Oil Slick 3 times with charged attacks in a single phase",
    trigger = oilSlickPhaseChallenge()
)

//Oil Area Bonus - Save all of the Sea Birds
achievement(
    title = "Oil Area - 100% Bonus",
    points = 5,
    description = "Complete the Oil Area Bonus Stage and save all of the Sea Birds",
    trigger = always_true()
)

//Dam Area - Complete
//  - current area == dam area
//  - previously fighting boss
//  - currently on success screen
achievement(
    title = "Dam Area - Complete",
    points = 2,
    description = "Complete the Dam Area",
    trigger = completedArea(gameArea_DamArea)
)

//Dam Area - Complete (No Deaths)
//  - current area == dam area
//  - previously fighting boss
//  - currently on success screen
//  - don't die
achievement(
    title = "Dam Area - No Deaths",
    points = 5,
    description = "Complete the Dam Area without dying",
    trigger = completedAreaNoDeath(gameArea_DamArea)
)

//Dam Area - Reach the top of the Waterfall Ascent without falling
achievement(
    title = "Dam Area - Waterfall Ascent", 
    points = 3,
    description = "Reach the top of the Waterfall Ascent in the Dam Area without falling too far",
    trigger = 
        playingArea(gameArea_DamArea) &&
        prev(areaSection) == areaSection_DamArea_WaterFallAscent &&
        trigger_when(areaSection == areaSection_DamArea_Boss) &&
        disable_when
        (
            gameArea == gameArea_DamArea && areaSection == areaSection_DamArea_WaterFallAscent && playerYCoordinate >= 0x70, 
            lostLives() || !inGame() || (gameArea == gameArea_DamArea && fightingBoss())
        )
)

//Dam Area - Defeat Sulfura (Melee Only)
achievement(
    title = "Dam Area - Melee Only",
    points = 5,
    description = "Defeat Sulfura in the Dam Area using only melee attacks",
    trigger = defeatedAreaBossMeleeOnly(gameArea_DamArea)
)

//Defeat the Dam Area Boss before her acid rain phase
achievement(
    title = "Dam Area - Phase Challenge",
    points = 3,
    description = "Defeat Sulfura in the Dam Area before her acid rain phase",
    trigger = always_true()
)

//Dam Area Bonus - Shoot all of the cans
achievement(
    title = "Dam Area - 100% Bonus",
    points = 5,
    description = "Complete the Dam Area Bonus Stage and shoot all of the cans",
    trigger = always_true()
)

//Dust Area - Complete
//  - current area == dust area
//  - previously fighting boss
//  - currently on success screen
achievement(
    title = "Dust Area - Complete",
    points = 2,
    description = "Complete the Dust Area",
    trigger = completedArea(gameArea_DustArea)
)

//Dust Area - Complete (No Deaths)
//  - current area == dust area
//  - previously fighting boss
//  - currently on success screen
//  - don't die
achievement(
    title = "Dust Area - No Deaths",
    points = 5,
    description = "Complete the Dust Area without dying",
    trigger = completedAreaNoDeath(gameArea_DustArea)
)

//Dust Area - Collect the 1UP during the Mudslide Decent without dying
achievement(
    title = "Dust Area - Mudslide Decent",
    points = 3,
    description = "Collect the Zen Up during the Mudlide Decent in the Dust Area and reach the bottom without dying",
    trigger = always_true()
)

//Dust Area - Defeat Garbageman (Melee Only)
achievement(
    title = "Dust Area - Melee Only",
    points = 5,
    description = "Defeat Garbageman in the Dust Area using only melee attacks",
    trigger = defeatedAreaBossMeleeOnly(gameArea_DustArea)
)

//Defeat the Dust Area Boss in 3 phases or less
achievement(
    title = "Dust Area - Phase Challenge",
    points = 3,
    description = "Defeat Garbageman in the Dust Area in 3 phases or less",
    trigger = always_true()
)

//Dust Area Bonus - Collect all of the cans (there's more than 15!)
achievement(
    title = "Dust Area - 100% Bonus",
    points = 5,
    description = "Complete the Dust Area Bonus Stage and collect all of the cans",
    trigger = always_true()
)

//Smog Area - Complete
//  - current area == smog area
//  - previously fighting boss
//  - currently on success screen
achievement(
    title = "Smog Area - Complete",
    points = 2,
    description = "Complete the Smog Area",
    trigger = completedArea(gameArea_SmogArea)
)

//Smog Area - Complete (No Deaths)
//  - current area == smog area
//  - previously fighting boss
//  - currently on success screen
//  - don't die
achievement(
    title = "Smog Area - No Deaths",
    points = 5,
    description = "Complete the Smog Area without dying",
    trigger = completedAreaNoDeath(gameArea_SmogArea)
)

//Smog Area - Don't get hit by the acid rain during the Acid Rain section
achievement(
    title = "Smog Area - Acid Rain",
    points = 3,
    description = "Reach the end of the Acid Rain section of the Smog Area without getting taking damage from the rain (no power crystal)",
    trigger = always_true()
)

//Smog Area - Defeat Smogger (Melee Only)
achievement(
    title = "Smog Area - Melee Only",
    points = 5,
    description = "Defeat Smogger in the Smog Area using only melee attacks",
    trigger = defeatedAreaBossMeleeOnly(gameArea_SmogArea)
)

//Defeat the Smog Area Boss in 2 phases or less
achievement(
    title = "Smog Area - Phase Challenge",
    points = 3,
    description = "Defeat Smogger in the Smog Area in 2 phases or less",
    trigger = always_true()
)

//Smog Area Bonus - Hit every smoke cloud
achievement(
    title = "Smog Area - 100% Bonus",
    points = 5,
    description = "Complete the Smog Area Bonus Stage and destroy every smoke cloud",
    trigger = always_true()
)

//Final Area - Complete
achievement(
    title = "Final Area - Complete",
    points = 2,
    description = "Complete the Final Area",
    trigger = completedGame()
)

//Final Area - Complete (No Deaths)
achievement(
    title = "Final Area - No Deaths",
    points = 5,
    description = "Complete the Final Area without dying",
    trigger = completedGameNoDeath()
)

//Final Area - Reach the bottom of the Rockfall Decent without taking damage (No Crystal)
achievement(
    title = "Final Area - Rockfall Decent",
    points = 3,
    description = "Collect each item during the Rockfall Decent in the Final Area and reach the bottom without taking damage (now power crystal)",
    trigger = always_true()
)

//Final Area - Free Jeremy and defeat Lord Contanimous (Melee Only)
achievement(
    title = "Final Area - Melee Only",
    points = 5,
    description = "Free Jeremy and defeat Lord Contanimous in the Final Area using only melee attacks",
    trigger = defeatedAreaBossMeleeOnly(gameArea_FinalArea)
)

//Final Area - Phase Challenge - Defeat the boss before the Oil Phase
achievement(
    title = "Final Area - Phase Challenge",
    points = 3,
    description = "Free Jeremy and defeat Lord Contanimous before his Oil Phase",
    trigger = always_true()
)

//== Potential Challenges ==

//Oil Area - All Items
//Dam Area - All Items
//Dust Area - All Items
//Smog Area - All Items

//Oil Area - No Damage
//Dam Area - No Damage
//Dust Area - No Damage
//Smog Area - No Damage

//Defeat Each Enemy Type
//Complete Game No Charge

//[VOID]  - [Obsolete] Complete Game (No Continues)
//     Replaced with High Score > 120000
