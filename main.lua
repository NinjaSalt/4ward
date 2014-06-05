--main.lua

-- Code to have Corona display the font names found
--
local fonts = native.getFontNames()
count = 0



-- Count the number of total fonts
for i,fontname in ipairs(fonts) do
    count = count+1
end

local name = "pt"     -- part of the Font name we are looking for

name = string.lower( name )

-- Display each font in the terminal console
for i, fontname in ipairs(fonts) do
    j, k = string.find( string.lower( fontname ), name )
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


  local globals = require ("classes.globals")
  require("classes.enemies")
  local sfx = require("classes.sfx")
  require("classes.audioClass")

  -- play music
  playgameMusic(sfx.theme,1,-1)


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

local name = "pt"     -- part of the Font name we are looking for

name = string.lower( name )

if "Win" == system.getInfo( "platformName" ) then
    globals.LOBSTERTWO = "Lobster Two"
    --globals.IMPRIMA = "Imprima"
    globals.IMPRIMA = "Josefin Sans" --horrible lazy programming, but not ready to replace all Imprima texts by hand yet.
    globals.JOSEFIN = "Josefin Sans" 
  elseif "Android" == system.getInfo( "platformName" ) then
    globals.LOBSTERTWO = "LobsterTwo-Regular"
    --globals.IMPRIMA = "Imprima-Regular"
    globals.IMPRIMA = "JosefinSans-Regular"
    globals.JOSEFIN = "JosefinSans-Regular"
  else
    -- Mac and iOS
    globals.LOBSTERTWO = "Lobster Two"
    --globals.IMPRIMA = "Imprima"
    globals.IMPRIMA = "Josefin Sans"
    globals.JOSEFIN = "Josefin Sans"
end


-- Display each font in the terminal console
for i, fontname in ipairs(fonts) do
    j, k = string.find( string.lower( fontname ), name )
end

local lfs = require "lfs"

local doc_path = system.pathForFile( "", system.DocumentsDirectory )

for file in lfs.dir(doc_path) do
   --file is the current file or directory name
   print( "Found file: " .. file )
end

-- local destDir = system.DocumentsDirectory  -- where the file is stored
-- local results, reason = os.remove( system.pathForFile( "gamesettings.json", destDir  ) )

-- if results then
--    print( "file removed" )
-- else
--    print( "file does not exist", reason )
-- end

local loadsave = require("classes.loadsave")

gameSettings = loadsave.loadTable("gamesettings.json")
 
-- check if gameSettings exists. If not create and initialise starting data
if (gameSettings == nil) then --comment this to reset the saving ***
    -- creating new table to save data
    gameSettings  = {}
    --world
    for n=1, globals.numWorlds+5, 1 do
        gameSettings[n] = {}
    end

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

    for i = 1,table.maxn( myEnemies )+1 do
       gameSettings[4][i] = false
    end

    for h = 1,table.maxn( comboEnemies )+1 do
         gameSettings[5][h] = false
    end
    for j = 1,3,1 do
         gameSettings[6][j] = false
    end

    gameSettings[7] = 0

    gameSettings[8] = {}
    for j = 1,4,1 do
      --1 = recipe tutorial
      --2 = pantry tutorial
      --3 = tips in world 2
      --4 = trash tutorial in level 4
         gameSettings[8][j] = false
    end

    --- FOR REFERENCE ---
    --worlds:
    -- gameSettings[1] = {}
    -- gameSettings[2] = {}
    -- gameSettings[3] = {}
    -- --recipe book unlocking:
    -- --basic
    --gameSettings[4] = {}
    -- --recipe
    -- gameSettings[5] = {}
    --item belt saving:
    --gameSettings[6] = {}
    --currency
    --gameSettings[7] = 0
    --bools for tutorial and tips
    --gameSettings[8] = {}
    --- FOR REFERENCE ---

    loadsave.saveTable(gameSettings , "gamesettings.json")
    print("First Time Data Initialisation") --comment this to reset the saving ***
else --comment this to reset the saving ***
    print("Main Data Loaded") --comment this to reset the saving ***
end --comment this to reset the saving ***
---------------------------------------------------------

