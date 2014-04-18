-- main.lua
 

-- Code to have Corona display the font names found
--
local fonts = native.getFontNames()
count = 0



-- Count the number of total fonts
for i,fontname in ipairs(fonts) do
    count = count+1
end

print( "\rFont count = " .. count )

local name = "pt"     -- part of the Font name we are looking for

name = string.lower( name )

-- Display each font in the terminal console
for i, fontname in ipairs(fonts) do
    j, k = string.find( string.lower( fontname ), name )

    if( j ~= nil ) then

       -- print( "fontname = " .. tostring( fontname ) )

    end
end
---------------------------------------------------------

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
  local globals = require ("classes.globals")

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

if "Win" == system.getInfo( "platformName" ) then
    globals.LOBSTERTWO = "Lobster Two"
    globals.IMPRIMA = "Imprima" 
  elseif "Android" == system.getInfo( "platformName" ) then
    globals.LOBSTERTWO = "LobsterTwo-Regular"
    globals.IMPRIMA = "Imprima-Regular"
  else
    -- Mac and iOS
    globals.LOBSTERTWO = "Lobster Two"
    globals.IMPRIMA = "Imprima"
  end


-- Display each font in the terminal console
for i, fontname in ipairs(fonts) do
    j, k = string.find( string.lower( fontname ), name )

    if( j ~= nil ) then

        --print( "fontname = " .. tostring( fontname ) )

    end
end

local loadsave = require("classes.loadsave")

gameSettings = loadsave.loadTable("gamesettings.json")
 
-- check if gameSettings exists. If not create and initialise starting data
if (gameSettings == nil) then --comment this to reset the saving
    -- creating new table to save data
    gameSettings  = {}
    --world
    gameSettings[1] = {}
    gameSettings[2] = {}
    gameSettings[3] = {}

    --levels
    gameSettings[1][1] = {}
    gameSettings[1][2] = {}
    gameSettings[1][3] = {}
    gameSettings[1][4] = {}
    gameSettings[1][5] = {}

    gameSettings[2][1] = {}
    gameSettings[2][2] = {}
    gameSettings[2][3] = {}
    gameSettings[2][4] = {}
    gameSettings[2][5] = {}

    gameSettings[3][1] = {}
    gameSettings[3][2] = {}
    gameSettings[3][3] = {}
    gameSettings[3][4] = {}
    gameSettings[3][5] = {}

    --score
    gameSettings[1][1][1] = 0
    gameSettings[1][2][1] = 0
    gameSettings[1][3][1] = 0
    gameSettings[1][4][1] = 0
    gameSettings[1][5][1] = 0

    gameSettings[2][1][1] = 0
    gameSettings[2][2][1] = 0
    gameSettings[2][3][1] = 0
    gameSettings[2][4][1] = 0
    gameSettings[2][5][1] = 0

    gameSettings[3][1][1] = 0
    gameSettings[3][2][1] = 0
    gameSettings[3][3][1] = 0
    gameSettings[3][4][1] = 0
    gameSettings[3][5][1] = 0

    --stars
    gameSettings[1][1][2] = 0
    gameSettings[1][2][2] = 0
    gameSettings[1][3][2] = 0
    gameSettings[1][4][2] = 0
    gameSettings[1][5][2] = 0

    gameSettings[2][1][2] = 0
    gameSettings[2][2][2] = 0
    gameSettings[2][3][2] = 0
    gameSettings[2][4][2] = 0
    gameSettings[2][5][2] = 0

    gameSettings[3][1][2] = 0
    gameSettings[3][2][2] = 0
    gameSettings[3][3][2] = 0
    gameSettings[3][4][2] = 0
    gameSettings[3][5][2] = 0

 
    loadsave.saveTable(gameSettings , "gamesettings.json")
    print("First Time Data Initialisation") --comment this to reset the saving
else --comment this to reset the saving
    print("Main Data Loaded") --comment this to reset the saving
end --comment this to reset the saving
---------------------------------------------------------

