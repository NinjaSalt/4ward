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

----- HOW TO RESET THE SAVED TABLE ------
--[[I know it looks ugly but when I tried to make a for-loop to do it for me, it wouldn't let me so
I ended up with this. I tried putting it in the splash scene but it still gave me an error.

1. Comment out everything that has -- * -- commented above/below it and the lines indicated to be commented out
2. To reset the recipe book, you need to have gameSettings[4] and gameSettings[5] = nil and run the game.
3. You don't have to play the game, just run it and then close it.
4. Then set gameSettings[4] and gameSettings[5] = {} again and uncomment the huge chuck with the -- * --
    but keep the indicated lines still commented out.
5. Run the game again
6. Close the game and then uncomment out the lines.
7. Now when you run the game, everything should been resetted!

]]--


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
    --recipe book unlocking
    --basic
    gameSettings[4] = {}
    --recipe
    gameSettings[5] = {}
    --item belt saving
    --gameSettings[6] = {}

    -- * --
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
    -- * --

    loadsave.saveTable(gameSettings , "gamesettings.json")
    print("First Time Data Initialisation") --comment this to reset the saving
else --comment this to reset the saving
    print("Main Data Loaded") --comment this to reset the saving
end --comment this to reset the saving
---------------------------------------------------------

