-- AUDIO CLASS
local sfx = {}

-- LOADING SOUND EFFECTS --

--CHANGE COMMENTS TO CHOOSE FILE TYPE
--local fileType = ".ogg"
local fileType = ".wav"
--local fileType = ".aiff"

--CHEF MULTIPLIER INCREASE
sfx.audioGoodCombo1 = audio.loadSound ("audio/goodComboFX1"..fileType)
sfx.audioGoodCombo2 = audio.loadSound ("audio/goodComboFX2"..fileType)
sfx.audioGoodCombo3 = audio.loadSound ("audio/goodComboFX3"..fileType)
sfx.audioGoodCombo4 = audio.loadSound ("audio/goodComboFX4"..fileType)
sfx.audioGoodCombo5 = audio.loadSound ("audio/goodComboFX5"..fileType)
sfx.audioGoodCombo6 = audio.loadSound ("audio/goodComboFX6"..fileType)

--ANTAGONIST MULTIPLIER RESET
sfx.audioBadCombo = audio.loadSound ("audio/BadComboFX"..fileType)
sfx.audioBadCombo1 = audio.loadSound ("audio/BadComboFX1"..fileType)
sfx.audioBadCombo2 = audio.loadSound ("audio/BadComboFX2"..fileType)
sfx.audioBadCombo3 = audio.loadSound ("audio/BadComboFX3"..fileType)

-- CHEF SAYING, ..."READY?"
sfx.audioReady = audio.loadSound("audio/readyFX"..fileType)

-- CHEF START CATCH PHRASE
sfx.audioStartLevel1 = audio.loadSound ("audio/beginFX1"..fileType)
sfx.audioStartLevel2 = audio.loadSound ("audio/beginFX2"..fileType)
sfx.audioStartLevel3 = audio.loadSound ("audio/beginFX3"..fileType)
sfx.audioStartLevel4 = audio.loadSound ("audio/beginFX4"..fileType)

-- CHEF VICTORY CATCH PHRASE
sfx.audioVictory1 = audio.loadSound("audio/victoryFX1"..fileType)
sfx.audioVictory2 = audio.loadSound("audio/victoryFX2"..fileType)
sfx.audioVictory3 = audio.loadSound("audio/victoryFX3"..fileType)
sfx.audioVictory4 = audio.loadSound("audio/victoryFX4"..fileType)
sfx.audioVictory5 = audio.loadSound("audio/victoryFX5"..fileType)
sfx.audioVictory6 = audio.loadSound("audio/victoryFX6"..fileType)
sfx.audioVictory7 = audio.loadSound("audio/victoryFX7"..fileType)

--ANTAGONIST DEFEAT CATCH PHRASE
sfx.audioDefeat1 = audio.loadSound("audio/defeatFX1"..fileType)
sfx.audioDefeat2 = audio.loadSound("audio/defeatFX2"..fileType)
sfx.audioDefeat3 = audio.loadSound("audio/defeatFX3"..fileType)
sfx.audioDefeat4 = audio.loadSound("audio/defeatFX4"..fileType)

-- ANTAGONIST SOUND EFFECTS
sfx.audioCakeAttack = audio.loadSound("audio/cakeAttackFX"..fileType)
sfx.audioMashPotato = audio.loadSound("audio/mashPotatoFX"..fileType)
sfx.audioSupriseSwap = audio.loadSound("audio/supriseSwapFX"..fileType)

-- SERVE FOOD ... ("DING")
sfx.audioServeFood = audio.loadSound("audio/serveFoodFX"..fileType)

-- CONVEYOR BELT SOUND EFFECTS
sfx.audioLaneSlow = audio.loadSound("audio/laneSlowDown"..fileType)
sfx.audioLaneSpeedUp = audio.loadSound("audio/laneSpeedUp"..fileType)

--RANDOM SOUND EFFECTS
sfx.audioFalling = audio.loadSound("audio/FallingDownFX"..fileType)
sfx.pop = audio.loadSound("audio/pop"..fileType)
sfx.whistle = audio.loadSound("audio/whistle"..fileType)


-- END LOADING SOUND EFFECTS -- 


-- LOADING MUSIC --

-- THEME -- 
sfx.theme = audio.loadStream("audio/theme"..fileType)

-- WORLD 1 --
sfx.w1banjo = audio.loadStream("audio/world1/banjo"..fileType)
sfx.w1bass = audio.loadStream("audio/world1/bass"..fileType)
sfx.w1drums = audio.loadStream("audio/world1/drums"..fileType)
sfx.w1trumpet = audio.loadStream("audio/world1/trumpet"..fileType)
sfx.w1guitar1 = audio.loadStream("audio/world1/guitar1"..fileType)
sfx.w1guitar2 = audio.loadStream("audio/world1/guitar2"..fileType)
sfx.w1guitar3 = audio.loadStream("audio/world1/guitar3"..fileType)
sfx.w1guitar4 = audio.loadStream("audio/world1/guitar4"..fileType)
sfx.w1guitar5loop = audio.loadStream("audio/world1/guitar5loop"..fileType)
sfx.w1guitar6endloop = audio.loadStream("audio/world1/guitar6endloop"..fileType)
sfx.w1guitar7 = audio.loadStream("audio/world1/guitar7"..fileType)
sfx.w1guitar8 = audio.loadStream("audio/world1/guitar8"..fileType)
sfx.w1guitar9 = audio.loadStream("audio/world1/guitar9"..fileType)
sfx.w1guitar10 = audio.loadStream("audio/world1/guitar10"..fileType)
sfx.w1guitar11 = audio.loadStream("audio/world1/guitar11"..fileType)
sfx.w1guitar12end = audio.loadStream("audio/world1/guitar12end"..fileType)
sfx.w1guitar13 = audio.loadStream("audio/world1/guitar13"..fileType)


-- WORLD 2 --

sfx.w2intro = audio.loadStream("audio/world2/intro"..fileType)
sfx.w2chorus = audio.loadStream("audio/world2/chorus"..fileType)
sfx.w2chorusbreak = audio.loadStream("audio/world2/chorusbreak"..fileType)
sfx.w2chorusfull = audio.loadStream("audio/world2/chorusfull"..fileType)

-- WORLD 3 --
sfx.w3intro = audio.loadStream("audio/world3/intro"..fileType)
sfx.w3chorus1 = audio.loadStream("audio/world3/chorus1"..fileType)
sfx.w3chorus2 = audio.loadStream("audio/world3/chorus2"..fileType)
sfx.w3chorus3 = audio.loadStream("audio/world3/chorus3"..fileType)
sfx.w3chorus4 = audio.loadStream("audio/world3/chorus4"..fileType)
sfx.w3chorusbreak = audio.loadStream("audio/world3/chorusbreak"..fileType)

return sfx