-- SOUNDS FILE

-- LOADING SOUND EFFECTS --

--CHEF MULTIPLIER INCREASE
local audioGoodCombo1 = audio.loadSound ("audio/goodComboFX1.wav")
local audioGoodCombo2 = audio.loadSound ("audio/goodComboFX2.wav")
local audioGoodCombo3 = audio.loadSound ("audio/goodComboFX3.wav")
local audioGoodCombo4 = audio.loadSound ("audio/goodComboFX4.wav")
local audioGoodCombo5 = audio.loadSound ("audio/goodComboFX5.wav")
local audioGoodCombo6 = audio.loadSound ("audio/goodComboFX6.wav")

--ANTAGONIST MULTIPLIER RESET
local audioBadCombo = audio.loadSound ("audio/BadComboFX.wav")
local audioBadCombo1 = audio.loadSound ("audio/BadComboFX1.wav")
local audioBadCombo2 = audio.loadSound ("audio/BadComboFX2.wav")
local audioBadCombo3 = audio.loadSound ("audio/BadComboFX3.wav")

-- CHEF SAYING, ..."READY?"
local audioReady = audio.loadSound("audio/readyFX.wav")

-- CHEF START CATCH PHRASE
local audioStartLevel1 = audio.loadSound ("audio/beginFX1.wav")
local audioStartLevel2 = audio.loadSound ("audio/beginFX2.wav")
local audioStartLevel3 = audio.loadSound ("audio/beginFX3.wav")
local audioStartLevel4 = audio.loadSound ("audio/beginFX4.wav")

-- CHEF VICTORY CATCH PHRASE
local audioVictory1 = audio.loadSound("audio/victoryFX1.wav")
local audioVictory2 = audio.loadSound("audio/victoryFX2.wav")
local audioVictory3 = audio.loadSound("audio/victoryFX3.wav")
local audioVictory4 = audio.loadSound("audio/victoryFX4.wav")
local audioVictory5 = audio.loadSound("audio/victoryFX5.wav")
local audioVictory6 = audio.loadSound("audio/victoryFX6.wav")
local audioVictory7 = audio.loadSound("audio/victoryFX7.wav")

--ANTAGONIST DEFEAT CATCH PHRASE
local audioDefeat1 = audio.loadSound("audio/defeatFX1.wav")
local audioDefeat2 = audio.loadSound("audio/defeatFX2.wav")
local audioDefeat3 = audio.loadSound("audio/defeatFX3.wav")
local audioDefeat4 = audio.loadSound("audio/defeatFX4.wav")

-- ANTAGONIST SOUND EFFECTS
local audioCakeAttack = audio.loadSound("audio/cakeAttackFX.wav")
local audioMashPotato = audio.loadSound("audio/mashPotatoFX.wav")
local audioSupriseSwap = audio.loadSound("audio/supriseSwapFX.wav")

-- SERVE FOOD ... ("DING")
local audioServeFood = audio.loadSound("audio/serveFoodFX.wav")

-- CONVEYOR BELT SOUND EFFECTS
local audioLaneSlow = audio.loadSound("audio/laneSlowDown.wav")
local audioLaneSpeedUp = audio.loadSound("audio/laneSpeedUp.wav")

--RANDOM SOUND EFFECTS
local audioFalling = audio.loadSound("audio/FallingDownFX.wav")

-- END LOADING SOUND EFFECTS -- 


-- LOADING MUSIC --
-- WORLD 1 --
local w1banjo = audio.loadStream("audio/world1/banjo.wav")
local w1bass = audio.loadStream("audio/world1/bass.wav")
local w1drums = audio.loadStream("audio/world1/drums.wav")
local w1vocal = audio.loadStream("audio/world1/SvenVocal.wav")
local w1guitar1 = audio.loadStream("audio/world1/guitar1.wav")
local w1guitar2 = audio.loadStream("audio/world1/guitar2.wav")
local w1guitar3 = audio.loadStream("audio/world1/guitar3.wav")
local w1guitar4 = audio.loadStream("audio/world1/guitar4.wav")
local w1guitar5loop = audio.loadStream("audio/world1/guitar5loop.wav")
local w1guitar6endloop = audio.loadStream("audio/world1/guitar6endloop.wav")
local w1guitar7 = audio.loadStream("audio/world1/guitar7.wav")
local w1guitar8 = audio.loadStream("audio/world1/guitar8.wav")
local w1guitar9 = audio.loadStream("audio/world1/guitar9.wav")
local w1guitar10 = audio.loadStream("audio/world1/guitar10.wav")
local w1guitar11 = audio.loadStream("audio/world1/guitar11.wav")
local w1guitar12 = audio.loadStream("audio/world1/guitar12.wav")
local w1guitar13 = audio.loadStream("audio/world1/guitar13.wav")

-- WORLD 2 --
local w2intro = audio.loadstream("audio/world2/intro.wav")
local w2chorus = audio.loadstream("audio/world2/chorus.wav")
local w2chorusbreak = audio.loadstream("audio/world2/chorusbreak.wav")
local w2chorusfull = audio.loadstream("audio/world2/chrousfull.wav")

-- WORLD 3 --
local w3intro = audio.loadstream("audio/world3/intro.wav")
local w3chorus1 = audio.loadstream("audio/world3/chorus1.wav")
local w3chorus2 = audio.loadstream("audio/world3/chorus2.wav")
local w3chorus3 = audio.loadstream("audio/world3/chorus3.wav")
local w3chorus4 = audio.loadstream("audio/world3/chorus4.wav")
local w3chorusbreak = audio.loadstream("audio/world3/chorusbreak.wav")



-- BEGIN SOUND CLASS --
local soundOn = true
local musicOn = true

--reserve audio channel for background music
audio.reserveChannels(1) 

-- Function to play Sound Effects
function playSFX (soundFile, volumeLevel)
	if soundOn == true then
		local volumeLevel = volumeLevel or 1.0
		audio.play(soundFile)
		audio.setVolume(volumeLevel, {soundFile})
	end
end


--Function to play Music
function playgameMusic(soundFile)
	if musicOn == true then
		audio.play(soundFile, {channel = 2, loops = 0, fadein = 2500})
	end
end

-- function to pause music
function pauseMusic (soundFile)
	if musicOn == true then
		audio.pause()
		musicOn = false
	end
end

--function to resume music
function resumeMusic (channel)
	if musicOn == false then	
		audio.resume()
		musicOn = true
	end
end 
