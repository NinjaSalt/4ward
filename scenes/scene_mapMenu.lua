---------------------------------------------------------------------------------
-- SCENE NAME
-- Scene notes go here
-- The menu for the map screen
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
   time = 500
}
  local bkg = display.newRect( centerX, centerY, display.contentWidth, display.contentHeight )
  bkg:setFillColor( gray )
  bkg.alpha = .5
  group:insert (bkg)
  
  bkg:addEventListener("touch", function() return true end)
  bkg:addEventListener("tap", function() return true end)
  local menuBack = display.newRect( display.contentWidth/2, display.contentHeight/2, 250, 250)
  group:insert (menuBack)
  
  local mainButton = display.newText( "Main Menu", display.contentWidth/2, (display.contentHeight/2) - 60, globals.LOBSTERTWO, 36 )
  mainButton:setFillColor(black)
  group:insert (mainButton)
  
  local function onTapMain( event )
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.scene_home",options)
  end
  
  mainButton:addEventListener( "tap", onTapMain )
  
  local worldButton = display.newText( "World Map", display.contentWidth/2, (display.contentHeight/2) , globals.LOBSTERTWO, 36 )
  worldButton:setFillColor(black)
  group:insert (worldButton)
  
  local function onTapWorld( event )
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.scene_worldmap1",options)
  end
  
  worldButton:addEventListener( "tap", onTapWorld )
  
  local backButton = display.newText( "Back", display.contentWidth/2, (display.contentHeight/2) + 60, globals.LOBSTERTWO, 36 )
  backButton:setFillColor(black)
  group:insert (backButton)

  local function onTapBack( event )
    storyboard.removeScene( scene )
    storyboard.hideOverlay( "slideDown", 500 )
    storyboard.showOverlay("scenes.overlay_worldMap", {effect = "fade", time = 500})
  end
  
  backButton:addEventListener( "tap", onTapBack )

  --startButton:addEventListener( "tap", onTap )
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