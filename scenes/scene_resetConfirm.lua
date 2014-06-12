---------------------------------------------------------------------------------
-- SCENE NAME
-- Scene notes go here
---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local globals= require("classes.globals") 

local loadsave = require("classes.loadsave")

gameSettings = loadsave.loadTable("gamesettings.json")
 
-- Clear previous scene
storyboard.removeAll()
 
-- local forward references should go here --
 
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 
-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view
   -- Repeat text from other tip tutorials.
  local bkg = display.newRect( display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight )
  bkg:setFillColor( gray )
  bkg.alpha = .5
  group:insert (bkg)

  local nbkg = display.newImage( "images/pauseBack.png", centerX, centerY, true )
  nbkg.height=display.contentHeight*.7; nbkg.width=display.contentWidth*.7
  group:insert (nbkg)

  local exclamation = display.newImage( "images/warning.png", 70, 60, true )
  exclamation.height=100; exclamation.width=100
  group:insert (exclamation)

  local resetText = {
    text = "Resetting will erase all progress. Are you sure?",     
    x = display.contentCenterX,
    y = display.contentCenterY-20,
    width = nbkg.width,     --required for multi-line and alignment
    font = globals.IMPRIMA,   
    fontSize = 20,
    align = "center"  --new alignment parameter
  }

  local rText = display.newText(resetText)
  rText:setFillColor( black )  
  group:insert(rText)

  local confirmButton = display.newImageRect( "images/confirmButton.png", 150, 150 )
  confirmButton.width = 60
  confirmButton.height = 60
  confirmButton.x = display.contentCenterX-50
  confirmButton.y = display.contentCenterY + 50
  group:insert(confirmButton)

  local cancelButton = display.newImageRect( "images/cancelButton.png", 150, 150 )
  cancelButton.width = 60
  cancelButton.height = 60
  cancelButton.x = display.contentCenterX+50
  cancelButton.y = display.contentCenterY + 50
  group:insert(cancelButton)

  local function resetGameOK( event )

    local destDir = system.DocumentsDirectory  -- where the file is stored
    local results, reason = os.remove( system.pathForFile( "gamesettings.json", destDir  ) )

    if results then
       print( "file removed" )
    else
       print( "file does not exist", reason )
    end
        -- creating new table to save data
        gameSettings  = {}
        --world
        for n=1, globals.numWorlds+6, 1 do
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
	    gameSettings[9]= 0

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
	    --total num stars
	    --gameSettings[9]= 0
	    --- FOR REFERENCE ---


        loadsave.saveTable(gameSettings , "gamesettings.json")
        print("First Time Data Initialisation") --comment this to reset the saving ***
        rText.text = "Reset complete. Please restart to application to see the changes!"

  end

  local function cancelReset( event )
    storyboard.hideOverlay ("scenes.scene_resetConfirm", "slideUp", 600 )
    storyboard.showOverlay("scenes.overlay_backButton", {effect = "fade", time = 500})
  end

  -- local tap = display.newText( "TAP TO CONTINUE", 0, 0, globals.IMPRIMA, 16 )
  -- tap:setFillColor(black)
  -- tap.x = display.contentCenterX
  -- tap.y = 245
  -- group:insert( tap )

  -- local inRect = display.newRect( display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight )
  -- inRect:setFillColor( gray )
  -- inRect.alpha = .1
  -- group:insert (inRect)

  -- inRect:addEventListener( "tap", function()  storyboard.hideOverlay ("scenes.scene_tipFail", "slideUp", 500 )
  -- storyboard.showOverlay("scenes.overlay_backButton", {effect = "fade", time = 500}) end )

  if (confirmButton~=nil) then
    confirmButton:addEventListener( "tap", resetGameOK)
  end
  cancelButton:addEventListener( "tap", cancelReset)
 
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