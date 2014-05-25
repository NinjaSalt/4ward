-- BEGIN AUDIO CLASS --
local sfx = require("classes.sfx")
local globals = require("classes.globals")

local soundOn = true
local musicOn = true

--reserve audio channel for background music
audio.reserveChannels(1) 

-- Function to play Sound Effects
function playSFX (soundFile, volumeLevel)
	if soundOn == true then
		local volumeLevel = volumeLevel or 1.0
                volumeLevel = volumeLevel * globals.soundLevel
		audio.play(soundFile)
		audio.setVolume(volumeLevel, {soundFile})
	end
end


--Function to play Music
function playgameMusic(soundFile, channelNum, loopNum, fadeNum, follow)
	if musicOn == true then
		audio.play(soundFile, {channel = channelNum, loops = loopNum, fadein = fadeNum, onComplete=follow})
		audio.setVolume(globals.musicLevel, {soundFile})
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

--function to
function playnextTrack(track)

end

function setSoundLevel(sLevel)
    globals.soundLevel = sLevel
end

function setMusicLevel(mLevel)
    globals.musicLevel = mLevel
    audio.setVolume( globals.musicLevel, { channel=1  } )
end