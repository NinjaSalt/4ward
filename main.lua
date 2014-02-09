-- main.lua
 
-- Hide the iPhone status bar
display.setStatusBar( display.HiddenStatusBar )
centerX = display.contentCenterX
centerY = display.contentCenterY
_W = display.contentWidth
_H = display.contentHeight
local options = {
   effect = "fade",
   time = 500
}

  -- load music
  local theme = audio.loadStream("audio/theme.wav")

  -- play music
 -- local themeChannel = audio.play(theme,{channel =1, loops=-1})


local storyboard = require( "storyboard" )
storyboard.gotoScene("scenes.scene_splash" , options)

-- Code to have Corona display the font names found
--
local fonts = native.getFontNames()

count = 0

-- Count the number of total fonts
for i,fontname in ipairs(fonts) do
    count = count+1
end

--print( "\rFont count = " .. count )

local name = "pt"     -- part of the Font name we are looking for

name = string.lower( name )

-- Display each font in the terminal console
for i, fontname in ipairs(fonts) do
    j, k = string.find( string.lower( fontname ), name )

    if( j ~= nil ) then

        --print( "fontname = " .. tostring( fontname ) )

    end
end
---------------------------------------------------------

