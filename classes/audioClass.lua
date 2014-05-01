-- SOUNDS FILE

-- LOADING SOUND EFFECTS --

--CHEF MULTIPLIER INCREASE
audioGoodCombo1 = audio.loadSound ("audio/goodComboFX1.wav")
audioGoodCombo2 = audio.loadSound ("audio/goodComboFX2.wav")
audioGoodCombo3 = audio.loadSound ("audio/goodComboFX3.wav")
audioGoodCombo4 = audio.loadSound ("audio/goodComboFX4.wav")
audioGoodCombo5 = audio.loadSound ("audio/goodComboFX5.wav")
audioGoodCombo6 = audio.loadSound ("audio/goodComboFX6.wav")

--ANTAGONIST MULTIPLIER RESET
audioBadCombo = audio.loadSound ("audio/BadComboFX.wav")
audioBadCombo1 = audio.loadSound ("audio/BadComboFX1.wav")
audioBadCombo2 = audio.loadSound ("audio/BadComboFX2.wav")
audioBadCombo3 = audio.loadSound ("audio/BadComboFX3.wav")

-- CHEF SAYING, ..."READY?"
audioReady = audio.loadSound("audio/readyFX.wav")

-- CHEF START CATCH PHRASE
audioStartLevel1 = audio.loadSound ("audio/beginFX1.wav")
audioStartLevel2 = audio.loadSound ("audio/beginFX2.wav")
audioStartLevel3 = audio.loadSound ("audio/beginFX3.wav")
audioStartLevel4 = audio.loadSound ("audio/beginFX4.wav")

-- CHEF VICTORY CATCH PHRASE
audioVictory1 = audio.loadSound("audio/victoryFX1.wav")
audioVictory2 = audio.loadSound("audio/victoryFX2.wav")
audioVictory3 = audio.loadSound("audio/victoryFX3.wav")
audioVictory4 = audio.loadSound("audio/victoryFX4.wav")
audioVictory5 = audio.loadSound("audio/victoryFX5.wav")
audioVictory6 = audio.loadSound("audio/victoryFX6.wav")
audioVictory7 = audio.loadSound("audio/victoryFX7.wav")

--ANTAGONIST DEFEAT CATCH PHRASE
audioDefeat1 = audio.loadSound("audio/defeatFX1.wav")
audioDefeat2 = audio.loadSound("audio/defeatFX2.wav")
audioDefeat3 = audio.loadSound("audio/defeatFX3.wav")
audioDefeat4 = audio.loadSound("audio/defeatFX4.wav")

-- ANTAGONIST SOUND EFFECTS
audioCakeAttack = audio.loadSound("audio/cakeAttackFX.wav")
audioMashPotato = audio.loadSound("audio/mashPotatoFX.wav")
audioSupriseSwap = audio.loadSound("audio/supriseSwapFX.wav")

-- SERVE FOOD ... ("DING")
audioServeFood = audio.loadSound("audio/serveFoodFX.wav")

-- CONVEYOR BELT SOUND EFFECTS
audioLaneSlow = audio.loadSound("audio/laneSlowDown.wav")
audioLaneSpeedUp = audio.loadSound("audio/laneSpeedUp.wav")

--RANDOM SOUND EFFECTS
audioFalling = audio.loadSound("audio/FallingDownFX.wav")

-- END LOADING SOUND EFFECTS -- 


-- LOADING MUSIC --



-- BEGIN SOUND CLASS --
soundOn = true
musicOn = true

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
		audio.play(soundFile, {channel = 1, loops = -1, fadein = 2500})
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
