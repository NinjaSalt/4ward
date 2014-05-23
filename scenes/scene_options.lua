---------------------------------------------------------------------------------
-- SCENE NAME
-- Scene notes go here
---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local globals = require ("classes.globals")
-- Clear previous scene
storyboard.removeAll()

local loadsave = require("classes.loadsave")

--gameSettings = loadsave.loadTable("gamesettings.json")
 
-- local forward references should go here --
 
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 local lfs = require "lfs"

local doc_path = system.pathForFile( "", system.DocumentsDirectory )

for file in lfs.dir(doc_path) do
   --file is the current file or directory name
   print( "Found file: " .. file )
end
-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view

  local bkg = display.newImage( "images/mockback2.png", centerX, centerY, true )
  bkg.height=display.contentHeight; bkg.width=display.contentWidth
  group:insert (bkg)

  local opTitle = display.newText( "Options", 0, 0, globals.LOBSTERTWO, 38 )
  opTitle:setFillColor(black)
  opTitle.x = display.contentCenterX
  opTitle.y = 30
  group:insert( opTitle )


  local backButton = display.newImage("images/leftArrow.png")
  backButton.x = 466 
  backButton.y = 12
  backButton.height = 20
  backButton.width = 20
  group:insert(backButton)

  local resetButton = display.newImageRect("images/resetgame.png", 100,50)
  resetButton.x = display.contentWidth/5
  resetButton.y = display.contentHeight/4
  group:insert(resetButton)
  
  local function onTapBack( event )
   storyboard.removeScene( scene )
   storyboard.gotoScene( "scenes.scene_home",{ effect = "fade", time = 250})
  end

  local function resetGame( event )

    local destDir = system.DocumentsDirectory  -- where the file is stored
    local results, reason = os.remove( system.pathForFile( "gamesettings.json", destDir  ) )

    if results then
       print( "file removed" )
    else
       print( "file does not exist", reason )
    end
       --if (gameSettings == nil) then --comment this to reset the saving ***
        -- creating new table to save data
        gameSettings  = {}
        --world
        for n=1, globals.numWorlds+3, 1 do
            print("n: " .. n)
            gameSettings[n] = {}
        end

        for i = 1,table.maxn( myEnemies )+1 do
         -- if (gameSettings[4][i]~=nil) then
           gameSettings[4][i] = false
          --end
          --print(gameSettings[4][i])
        end

        for h = 1,table.maxn( comboEnemies )+1 do
          --if (gameSettings[5][h]~=nil) then
             gameSettings[5][h] = false
             --print(gameSettings[5][h])
          --end
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


        loadsave.saveTable(gameSettings , "gamesettings.json")
        print("First Time Data Initialisation") --comment this to reset the saving ***
    -- else --comment this to reset the saving ***
    --     print("Main Data Loaded") --comment this to reset the saving ***
    -- end --comment this to reset the saving ***
  end

  backButton:addEventListener("tap",onTapBack)
  resetButton:addEventListener("tap",resetGame)

  --credits 
  local credButton = display.newText("Credits", 0, 0, globals.LOBSTERTWO, 30)
  credButton.x = display.contentWidth/2 
  credButton.y = 200
  credButton:setFillColor( black )
  group:insert(credButton)
  
  local function onTapCred( event )
   storyboard.removeScene( scene )
   storyboard.gotoScene( "scenes.scene_credits",{ effect = "fade", time = 250})
  end

  credButton:addEventListener("tap",onTapCred)

 end
-- Called BEFORE scene has moved onscreen:
function scene:willEnterScene( event )
  local group = self.view
 
end
 
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
  local group = self.view
 
end
 
-- Called when scene is about to move offscreen:
function scene:exitScene( event )
  local group = self.view
 
end
 
-- Called AFTER scene has finished moving offscreen:
function scene:didExitScene( event )
  local group = self.view
 
end
 
-- Called prior to the removal of scene's "view" (display view)
function scene:destroyScene( event )
  local group = self.view
 
end
 
-- Called if/when overlay scene is displayed via storyboard.showOverlay()
function scene:overlayBegan( event )
  local group = self.view
  local overlay_name = event.sceneName  -- name of the overlay scene
 
end
 
-- Called if/when overlay scene is hidden/removed via storyboard.hideOverlay()
function scene:overlayEnded( event )
  local group = self.view
  local overlay_name = event.sceneName  -- name of the overlay scene
 
end
 
---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 
-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )
 
-- "willEnterScene" event is dispatched before scene transition begins
scene:addEventListener( "willEnterScene", scene )
 
-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )
 
-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )
 
-- "didExitScene" event is dispatched after scene has finished transitioning out
scene:addEventListener( "didExitScene", scene )
 
-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )
 
-- "overlayBegan" event is dispatched when an overlay scene is shown
scene:addEventListener( "overlayBegan", scene )
 
-- "overlayEnded" event is dispatched when an overlay scene is hidden/removed
scene:addEventListener( "overlayEnded", scene )
 
---------------------------------------------------------------------------------
 
return scene