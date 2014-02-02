---------------------------------------------------------------------------------
-- SCENE NAME
-- Scene notes go here
-- The menu for the map screen
---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local itemToGive
 
require("classes.items")
require("classes.heroes")
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
  
  local selChefB = display.newImage(chefB.image, display.contentWidth/2, (display.contentHeight/2) - 60)
  selChefB.height = 50 
  selChefB.width = 50 
  group:insert (selChefB)
  
  local function onTapChefB( event )
    chefB.item = itemToGive
	storyboard.removeScene( scene )
    storyboard.hideOverlay( "slideDown", 500 )
  end
  
  selChefB:addEventListener( "tap", onTapChefB )
  
  local selChefDin = display.newImage(chefDin.image, display.contentWidth/2, (display.contentHeight/2) )
  selChefDin.height = 50 
  selChefDin.width = 50 
  group:insert (selChefDin)
  
  local function onTapChefDin( event )
    chefDin.item = itemToGive
	storyboard.removeScene( scene )
    storyboard.hideOverlay( "slideDown", 500 )
  end
  
  selChefDin:addEventListener( "tap", onTapChefDin )
  
  local selChefDess = display.newImage(chefDess.image, display.contentWidth/2, (display.contentHeight/2) + 60)
  selChefDess.height = 50 
  selChefDess.width = 50 
  group:insert (selChefDess)
  
  local function onTapChefDess( event )
    chefDess.item = itemToGive
	storyboard.removeScene( scene )
    storyboard.hideOverlay( "slideDown", 500 )
  end
  
  selChefDess:addEventListener( "tap", onTapChefDess )

  --startButton:addEventListener( "tap", onTap )
end
 
-- Called BEFORE scene has moved onscreen:
function scene:willEnterScene( event )
  local group = self.view
 
end
 
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
  local group = self.view
  local params = event.params
  itemToGive = params.item
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