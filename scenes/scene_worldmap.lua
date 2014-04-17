---------------------------------------------------------------------------------
-- SCENE NAME
-- Scene notes go here
---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local globals = require("classes.globals")
require("classes.levelUnlocking")
 
-- Clear previous scene
storyboard.removeAll()
 
-- local forward references should go here --
 
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 
-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view
  local levelList = {}

  local bkg = display.newImage( "images/mockback1.png", centerX, centerY, true )
  bkg.height=display.contentHeight; bkg.width=display.contentWidth
  group:insert (bkg)

  local function onTapLevel( event )
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.scene_ingame",{ effect = "fade", time = 500, params = {level = event.target.id, world = 1}})
  end

  local bookIcon = display.newImageRect("images/bookIcon.png", 100,100)
  bookIcon.x = 51
  bookIcon.y = 54
  group:insert(bookIcon)

  local storeButton = display.newImageRect("images/shop.png",100,100)
  storeButton.x = 53
  storeButton.y = 155
  group:insert(storeButton)

  local backArrow = display.newImageRect("images/backArrow.png",75,75)
  backArrow.x = 50
  backArrow.y = 270
  group:insert(backArrow)

  local banner1 = display.newImageRect( "images/bannerBlue.png", 325, 100 )
  banner1.x = 300
  banner1.y = 60
  group:insert(banner1)

  local banner2 = display.newImageRect( "images/bannerPink.png", 325, 100 )
  banner2.x = 300
  banner2.y = 155
  group:insert(banner2)

  local banner3 = display.newImageRect( "images/bannerYellow.png", 325, 100 )
  banner3.x = 300
  banner3.y = 245
  group:insert(banner3)

  local banner2Text = display.newText( "? ? ?", 0, 0, globals.LOBSTERTWO, 48 )
  banner2Text:setFillColor(black)
  banner2Text.x = 300
  banner2Text.y = 155
  group:insert( banner2Text )

  local banner3Text = display.newText( "? ? ?", 0, 0, globals.LOBSTERTWO, 48 )
  banner3Text:setFillColor(black)
  banner3Text.x = 300
  banner3Text.y = 245
  group:insert( banner3Text )

  local function onTapBackArrow(event)
    storyboard.removeScene(scene)
    storyboard.gotoScene("scenes.scene_home", {effect = "fade", time = 250})
  end

  -- to get to recipe book.
  local function onTapBookIcon( event )
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.scene_book", {effect = "fade", time = 500})
    storyboard.showOverlay("scenes.overlay_backButton", {effect = "fade", time = 500})
  end

  -- to get to the store
  local function onTapStoreButton( event )
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.scene_store", {effect = "fade", time = 500})
    storyboard.showOverlay("scenes.overlay_backButton", {effect = "fade", time = 500})
  end

  local function onTapBanner1( event )
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.scene_worldmap1", {effect = "fade", time = 500})
  end

  bookIcon:addEventListener("tap", onTapBookIcon)
  storeButton:addEventListener("tap", onTapStoreButton)
  backArrow:addEventListener("tap", onTapBackArrow)
  banner1:addEventListener("tap", onTapBanner1)

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