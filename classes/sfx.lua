-- AUDIO CLASS
local sfx = {}

-- LOADING SOUND EFFECTS --

--CHEF MULTIPLIER INCREASE
sfx.audioGoodCombo1 = audio.loadSound ("audio/goodComboFX1.wav")
sfx.audioGoodCombo2 = audio.loadSound ("audio/goodComboFX2.wav")
sfx.audioGoodCombo3 = audio.loadSound ("audio/goodComboFX3.wav")
sfx.audioGoodCombo4 = audio.loadSound ("audio/goodComboFX4.wav")
sfx.audioGoodCombo5 = audio.loadSound ("audio/goodComboFX5.wav")
sfx.audioGoodCombo6 = audio.loadSound ("audio/goodComboFX6.wav")

--ANTAGONIST MULTIPLIER RESET
sfx.audioBadCombo = audio.loadSound ("audio/BadComboFX.wav")
sfx.audioBadCombo1 = audio.loadSound ("audio/BadComboFX1.wav")
sfx.audioBadCombo2 = audio.loadSound ("audio/BadComboFX2.wav")
sfx.audioBadCombo3 = audio.loadSound ("audio/BadComboFX3.wav")

-- CHEF SAYING, ..."READY?"
sfx.audioReady = audio.loadSound("audio/readyFX.wav")

-- CHEF START CATCH PHRASE
sfx.audioStartLevel1 = audio.loadSound ("audio/beginFX1.wav")
sfx.audioStartLevel2 = audio.loadSound ("audio/beginFX2.wav")
sfx.audioStartLevel3 = audio.loadSound ("audio/beginFX3.wav")
sfx.audioStartLevel4 = audio.loadSound ("audio/beginFX4.wav")

-- CHEF VICTORY CATCH PHRASE
sfx.audioVictory1 = audio.loadSound("audio/victoryFX1.wav")
sfx.audioVictory2 = audio.loadSound("audio/victoryFX2.wav")
sfx.audioVictory3 = audio.loadSound("audio/victoryFX3.wav")
sfx.audioVictory4 = audio.loadSound("audio/victoryFX4.wav")
sfx.audioVictory5 = audio.loadSound("audio/victoryFX5.wav")
sfx.audioVictory6 = audio.loadSound("audio/victoryFX6.wav")
sfx.audioVictory7 = audio.loadSound("audio/victoryFX7.wav")

--ANTAGONIST DEFEAT CATCH PHRASE
sfx.audioDefeat1 = audio.loadSound("audio/defeatFX1.wav")
sfx.audioDefeat2 = audio.loadSound("audio/defeatFX2.wav")
sfx.audioDefeat3 = audio.loadSound("audio/defeatFX3.wav")
sfx.audioDefeat4 = audio.loadSound("audio/defeatFX4.wav")

-- ANTAGONIST SOUND EFFECTS
sfx.audioCakeAttack = audio.loadSound("audio/cakeAttackFX.wav")
sfx.audioMashPotato = audio.loadSound("audio/mashPotatoFX.wav")
sfx.audioSupriseSwap = audio.loadSound("audio/supriseSwapFX.wav")

-- SERVE FOOD ... ("DING")
sfx.audioServeFood = audio.loadSound("audio/serveFoodFX.wav")

-- CONVEYOR BELT SOUND EFFECTS
sfx.audioLaneSlow = audio.loadSound("audio/laneSlowDown.wav")
sfx.audioLaneSpeedUp = audio.loadSound("audio/laneSpeedUp.wav")

--RANDOM SOUND EFFECTS
sfx.audioFalling = audio.loadSound("audio/FallingDownFX.wav")

-- END LOADING SOUND EFFECTS -- 


-- LOADING MUSIC --

-- THEME -- 
sfx.theme = audio.loadStream("audio/theme.wav")

-- WORLD 1 --
sfx.w1banjo = audio.loadStream("audio/world1/banjo.wav")
sfx.w1bass = audio.loadStream("audio/world1/bass.wav")
sfx.w1drums = audio.loadStream("audio/world1/drums.wav")
sfx.w1trumpet = audio.loadStream("audio/world1/trumpet.wav")
sfx.w1guitar1 = audio.loadStream("audio/world1/guitar1.wav")
sfx.w1guitar2 = audio.loadStream("audio/world1/guitar2.wav")
sfx.w1guitar3 = audio.loadStream("audio/world1/guitar3.wav")
sfx.w1guitar4 = audio.loadStream("audio/world1/guitar4.wav")
sfx.w1guitar5loop = audio.loadStream("audio/world1/guitar5loop.wav")
sfx.w1guitar6endloop = audio.loadStream("audio/world1/guitar6endloop.wav")
sfx.w1guitar7 = audio.loadStream("audio/world1/guitar7.wav")
sfx.w1guitar8 = audio.loadStream("audio/world1/guitar8.wav")
sfx.w1guitar9 = audio.loadStream("audio/world1/guitar9.wav")
sfx.w1guitar10 = audio.loadStream("audio/world1/guitar10.wav")
sfx.w1guitar11 = audio.loadStream("audio/world1/guitar11.wav")
sfx.w1guitar12end = audio.loadStream("audio/world1/guitar12end.wav")
sfx.w1guitar13 = audio.loadStream("audio/world1/guitar13.wav")


-- WORLD 2 --

sfx.w2intro = audio.loadStream("audio/world2/intro.wav")
sfx.w2chorus = audio.loadStream("audio/world2/chorus.wav")
sfx.w2chorusbreak = audio.loadStream("audio/world2/chorusbreak.wav")
sfx.w2chorusfull = audio.loadStream("audio/world2/chorusfull.wav")

-- WORLD 3 --
sfx.w3intro = audio.loadStream("audio/world3/intro.wav")
sfx.w3chorus1 = audio.loadStream("audio/world3/chorus1.wav")
sfx.w3chorus2 = audio.loadStream("audio/world3/chorus2.wav")
sfx.w3chorus3 = audio.loadStream("audio/world3/chorus3.wav")
sfx.w3chorus4 = audio.loadStream("audio/world3/chorus4.wav")
sfx.w3chorusbreak = audio.loadStream("audio/world3/chorusbreak.wav")

return sfx