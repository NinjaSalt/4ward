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

  local bookIcon = display.newImageRect("images/book.png", 100,100)
  bookIcon.x = display.contentWidth/3
  bookIcon.y = display.contentHeight-bookIcon.width/2
  group:insert(bookIcon)

  local storeButton = display.newImageRect("images/pantry.png",100,100)
  storeButton.x = display.contentWidth - display.contentWidth/3
  storeButton.y = display.contentHeight-storeButton.width/2 - storeButton.width/4
  group:insert(storeButton)

  local backArrow = display.newImageRect("images/buttonReturn.png",75,75)
  backArrow.x = 50
  backArrow.y = 270
  group:insert(backArrow)

  local banner1 = display.newImageRect( "images/worldbuttons1.png", 150, 200 )
  banner1.x = banner1.width/2
  banner1.y = display.contentHeight/3
  group:insert(banner1)

  local banner2 = display.newImageRect( "images/worldbuttons2.png", 150, 200 )
  banner2.x = display.contentWidth/2
  banner2.y = display.contentHeight/3
  group:insert(banner2)

  local banner3 = display.newImageRect( "images/worldbuttons3.png", 150, 200 )
  banner3.x = display.contentWidth -banner3.width/2
  banner3.y = display.contentHeight/3
  group:insert(banner3)

  -- local banner2Text = display.newText( "? ? ?", 0, 0, globals.LOBSTERTWO, 48 )
  -- banner2Text:setFillColor(black)
  -- banner2Text.x = 300
  -- banner2Text.y = 155
  -- group:insert( banner2Text )

  -- local banner3Text = display.newText( "? ? ?", 0, 0, globals.LOBSTERTWO, 48 )
  -- banner3Text:setFillColor(black)
  -- banner3Text.x = 300
  -- banner3Text.y = 245
  -- group:insert( banner3Text )

  local function onTapBackArrow(event)
    storyboard.removeScene(scene)
    storyboard.gotoScene("scenes.scene_home", {effect = "fade", time = 250})
  end

  -- to get to recipe book.
  local function onTapBookIcon( event )
    bookIcon: removeSelf()
    bookIcon = display.newImageRect("images/book2.png", 100,100)
    bookIcon.x = display.contentWidth/3
    bookIcon.y = display.contentHeight-bookIcon.width/2
    group:insert(bookIcon)
    timer.performWithDelay(700, function()
      storyboard.removeScene( scene )
      storyboard.gotoScene( "scenes.scene_book", {effect = "fade", time = 500})
    storyboard.showOverlay("scenes.overlay_backButton", {effect = "fade", time = 500})
      end)
    --storyboard.removeScene( scene )
    -- storyboard.gotoScene( "scenes.scene_book", {effect = "fade", time = 500})
    -- storyboard.showOverlay("scenes.overlay_backButton", {effect = "fade", time = 500})
  end

  -- to get to the store
  local function onTapStoreButton( event )
    storeButton: removeSelf( )
    storeButton = nil
    storeButton = display.newImageRect("images/pantry2.png",100,100)
  storeButton.x = display.contentWidth - display.contentWidth/3
  storeButton.y = display.contentHeight-storeButton.width/2 - storeButton.width/4
  group:insert(storeButton)
  timer.performWithDelay(700, function()
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.scene_store", {effect = "fade", time = 500})
    storyboard.showOverlay("scenes.overlay_backButton", {effect = "fade", time = 500})
      end)
    -- storyboard.removeScene( scene )
    -- storyboard.gotoScene( "scenes.scene_store", {effect = "fade", time = 500})
    -- storyboard.showOverlay("scenes.overlay_backButton", {effect = "fade", time = 500})
  end

  local function onTapBanner1( event )
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.scene_worldmap1", {effect = "fade", time = 500})
    --storyboard.showOverlay("scenes.overlay_backButton", {effect = "fade", time = 500})
  end

  local function onTapBanner2( event )
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.scene_worldmap2", {effect = "fade", time = 500})
    --storyboard.showOverlay("scenes.overlay_backButton", {effect = "fade", time = 500})
  end

  local function onTapBanner3( event )
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.scene_worldmap3", {effect = "fade", time = 500})
    --storyboard.showOverlay("scenes.overlay_backButton", {effect = "fade", time = 500})
  end

  bookIcon:addEventListener("tap", onTapBookIcon)
  storeButton:addEventListener("tap", onTapStoreButton)
  backArrow:addEventListener("tap", onTapBackArrow)
  banner1:addEventListener("tap", onTapBanner1)
  banner2:addEventListener("tap", onTapBanner2)
  banner3:addEventListener("tap", onTapBanner3)

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