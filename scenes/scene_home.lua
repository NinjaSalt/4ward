---------------------------------------------------------------------------------
-- SCENE NAME
-- Scene notes go here
---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local globals = require ("classes.globals") 
-- Clear previous scene
storyboard.removeAll()
 
-- local forward references should go here --
 
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 
-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view

  local options = {
   effect = "fade",
   time = 250
}
-- Called when a key event has been received.
local function onKeyEvent( event )
    -- Print which key was pressed down/up to the log.
    local message = "Key '" .. event.keyName .. "' was pressed " .. event.phase
    print( message )

    -- If the "back" key was pressed on Android, then prevent it from backing out of your app.
    if (event.keyName == "back") and (system.getInfo("platformName") == "Android") then
        return true
    end

    -- Return false to indicate that this app is *not* overriding the received key.
    -- This lets the operating system execute its default handling of this key.
    return false
end

-- Add the key event listener.
Runtime:addEventListener( "key", onKeyEvent );


--[[local socialOptions = {
   service = "facebook",
   message = "Check out the game I'm making",
   listener = socialEventListener,
   url = "http://nwcgame.com"
}]]

  local bkg = display.newImage( "images/mockback2.png", centerX, centerY, true )
  bkg.height=display.contentHeight; bkg.width=display.contentWidth
  group:insert (bkg)

 local splashSheetSettings =
    {
   --  width = 1107,
  --   height = 781,
    width = 420,
    height = 296,
   -- sheetContentWidth=280,
  -- sheetContentHeight=70,
  sheetContentWidth=840,
  sheetContentHeight=1480,
  numFrames = 10
  }
  local splashSheet = graphics.newImageSheet("images/nwc_logo.png",splashSheetSettings)
  local splashSheetSsequenceData = {
      {name = "splash", frames={1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 10, 1, 10, 1, 10, 1}, time=3000, loopCount=0}
    }

  --local splashScreen = display.newImage("images/4wardlogo.png", centerX,centerY,true)
  local splashScreen = display.newSprite(splashSheet,splashSheetSsequenceData)
  splashScreen.x =display.contentCenterX - 10
    splashScreen.y = display.contentCenterY - 20  
  --splashScreen.height = splashScreen.height*.2; splashScreen.width = splashScreen.width*.2
  splashScreen:setSequence( "splash" )
  splashScreen:play()

 --local gameTitle = display.newText( "Now we're cooking!", 0, 0, native.systemFontBold, 36 )
  --gameTitle = display.newImage("images/mocklogo.png")
  --gameTitle.width = gameTitle.width*.2
  --gameTitle.height = gameTitle.height*.2
  --gameTitle.x = display.contentCenterX - 10
  --gameTitle.y = display.contentCenterY - 30
 
  group:insert( splashScreen )
 
  local startButton = display.newImage ("images/buttonPlay.png", 10, 10, true)
  --display.newText( "Start!", 0, 0, globals.LOBSTERTWO, 45 )
  --startButton:setFillColor(black)
  startButton.x = 50 --display.contentCenterX - 30
  startButton.y = display.contentCenterY + 120
  startButton.width = 70
  startButton.height = 70

  group:insert( startButton)

  local opButton = display.newImage ("images/buttonOptions.png", 10, 10, true)
  --display.newText( "Options", 0, 0, globals.LOBSTERTWO, 45 )
  --opButton:setFillColor(black)
  opButton.x = display.contentWidth - 50
  opButton.y = display.contentCenterY + 120
  opButton.width = 70
  opButton.height = 70

  group:insert(opButton)

  local function onOpTap( event )
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.scene_options",options)
  end

  local function onTap( event )
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.scene_worldmap",options)
  end

  startButton:addEventListener( "tap", onTap )
  opButton:addEventListener( "tap", onOpTap )
  
  --native.showPopup( "social", socialOptions )
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