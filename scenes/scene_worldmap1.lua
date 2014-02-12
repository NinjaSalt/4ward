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

  local mapTitle = display.newText( "World One", 0, 0, globals.LOBSTERTWO, 48 )
  mapTitle:setFillColor(black)
  mapTitle.x = display.contentCenterX
  mapTitle.y = 50
  group:insert( mapTitle )
 
  local function onTapLevel( event )
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.scene_ingame",{ effect = "fade", time = 500, params = {level = event.target.id, world = 1}})
  end
  
  for i = 1, LevelList.getNumOfLevels(1), 1 do
	levelList[i] = display.newText( "Level "..i, 0, 0, globals.IMPRIMA, 24 )
	if LevelList.isLevelUnlocked(1,i) == true then
		levelList[i]:setFillColor(black)
		levelList[i]:addEventListener( "tap", onTapLevel )
	else
		levelList[i]:setFillColor(1,.2,.2)
	end
	levelList[i].x = display.contentCenterX
	levelList[i].y = mapTitle.y + 40 + (30 * i)
	levelList[i].id = i
	group:insert( levelList[i])
  end


  local rightArrow = display.newImageRect( "images/rightArrow.png", 50, 50 )
  rightArrow.x = 455
  rightArrow.y = 153
  group:insert(rightArrow)

  if LevelList.worldUnlocked(2) ~= true then
     local lock = display.newImageRect( "images/lock.png", 50, 50 )
     lock.x = 455
     lock.y = 153
     group:insert(lock)
   end


  local bookIcon = display.newImageRect( "images/bookIcon.png", 50, 50 )
  bookIcon.x = 30
  bookIcon.y = 30
  group:insert(bookIcon)
 
  local function onTapRightArrow( event )
    if LevelList.worldUnlocked(2) == true then
		storyboard.removeScene( scene )
		storyboard.gotoScene( "scenes.scene_worldmap2", {effect = "slideLeft", time = 500})
		storyboard.showOverlay("scenes.overlay_worldMap", {effect = "fade", time = 500})
	end
  end
  -- to get to recipe book.
  local function onTapBookIcon( event )
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.scene_book", {effect = "fade", time = 500})
    storyboard.showOverlay("scenes.overlay_worldMap", {effect = "fade", time = 500})
  end

  rightArrow:addEventListener("tap", onTapRightArrow)
  bookIcon:addEventListener("tap", onTapBookIcon)

  storyboard.showOverlay("scenes.overlay_worldMap", {effect = "fade", time = 500})
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