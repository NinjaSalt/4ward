-- BEGIN AUDIO CLASS --
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
function playgameMusic(soundFile, channelNum, fadeNum)
	if musicOn == true then
		audio.play(soundFile, {channel = channelNum, loops = -1, fadein = fadeNum})
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
