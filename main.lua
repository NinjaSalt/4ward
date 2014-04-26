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
--[[
1. Comment out the lines indicated to be commented out
2. You don't have to play the game, just run it and then close it.
3. Uncomment out the lines.
7. Now when you run the game, everything should been resetted!
]]--

----UNCOMMENT TO RESET SCORE -------
-- globals.currency.set(0)
--   globals.currency.save()

local loadsave = require("classes.loadsave")

gameSettings = loadsave.loadTable("gamesettings.json")
 
-- check if gameSettings exists. If not create and initialise starting data
if (gameSettings == nil) then --comment this to reset the saving ***
    -- creating new table to save data
    gameSettings  = {}
    --world
    for n=1, globals.numWorlds+3, 1 do
        print("n: " .. n)
        gameSettings[n] = {}
    end

    --- FOR REFERENCE ---
    --worlds:
    -- gameSettings[1] = {}
    -- gameSettings[2] = {}
    -- gameSettings[3] = {}
    -- --recipe book unlocking:
    -- --basic
    -- gameSettings[4] = {}
    -- --recipe
    -- gameSettings[5] = {}
    --item belt saving:
    --gameSettings[6] = {}
    --- FOR REFERENCE ---

    -- * --
    --levels
    for n=1, globals.numWorlds, 1 do
        for j=1, globals.numLevels, 1 do
            gameSettings[n][j] = {}
        end
    end

    for n=1, globals.numWorlds, 1 do
        for j=1, globals.numLevels, 1 do
            for i=1, globals.numStorage, 1 do
            gameSettings[n][j][i] = 0
        end
        end
    end

    --- FOR REFERENCE ---
    --score
    -- gameSettings[n][j][1] = 0

    -- --stars
    -- gameSettings[n][j][2] = 0
    --- FOR REFERENCE ---

    loadsave.saveTable(gameSettings , "gamesettings.json")
    print("First Time Data Initialisation") --comment this to reset the saving ***
else --comment this to reset the saving ***
    print("Main Data Loaded") --comment this to reset the saving ***
end --comment this to reset the saving ***
---------------------------------------------------------

