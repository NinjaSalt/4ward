---------------------------------------------------------------------------------
-- SCENE NAME
-- Scene notes go here
---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
 
require("classes.items")
require("classes.heroes")
local widget = require( "widget" )
-- Clear previous scene
storyboard.removeAll()
 
-- local forward references should go here --
 
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 
-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view
  local itemList = {}

  local bkg = display.newImage( "images/mockback1.png", centerX, centerY, true )
  bkg.height=display.contentHeight; bkg.width=display.contentWidth
  group:insert (bkg)

  local storeTitle = display.newText( "The Pantry", 0, 0, native.systemFontBold, 36 )
  storeTitle:setFillColor(black)
  storeTitle.x = display.contentCenterX
  storeTitle.y = 50
 
  group:insert( storeTitle )
  
	local function scrollListener( event )

		local phase = event.phase
		if ( phase == "began" ) then print( "Scroll view was touched" )
		elseif ( phase == "moved" ) then print( "Scroll view was moved" )
		elseif ( phase == "ended" ) then print( "Scroll view was released" )
		end

		-- In the event a scroll limit is reached...
		if ( event.limitReached ) then
			if ( event.direction == "up" ) then print( "Reached top limit" )
			elseif ( event.direction == "down" ) then print( "Reached bottom limit" )
			elseif ( event.direction == "left" ) then print( "Reached left limit" )
			elseif ( event.direction == "right" ) then print( "Reached right limit" )
			end
		end

		return true
	end

	
-- Create the widget
	local scrollView = widget.newScrollView{
		y = 190,
		x = display.contentCenterX,
		width = 300,
		height = 200,
		topPadding = 20,
		--hideBackground = true,
		horizontalScrollDisabled = true,
		backgroundColor = { 0.2, 0.2, 0.2 },
		listener = scrollListener
	}
  group:insert( scrollView)
  
  local function onTapItem( event )
	--chefB.item = event.target.id
    storyboard.removeScene( scene )
    storyboard.showOverlay( "scenes.scene_storeChef",{ effect = "slideDown", time = 500, params = {item = event.target.id}})
  end
  
  local myY = 0
  local costList = {}
	for i = 1,table.maxn( items ) do
	  itemList[i] = display.newText( items[i].name, 0, 0, native.systemFont, 24 )
	  itemList[i].anchorX = 0
	  --itemList[i]:setFillColor(white)
	  itemList[i].x = 20--scrollView.contentBounds.xMin
	  itemList[i].y = myY
	  itemList[i].id = i
	  costList[i] = display.newText( items[i].cost, 0, 0, native.systemFont, 24 )
	  costList[i].anchorX = 0
	  costList[i].y = myY
	  costList[i].x = scrollView.width-20
	  costList[i].anchorX = 1
	  scrollView:insert( itemList[i] )
	  scrollView:insert( costList[i] )
	  myY=myY+40
	  itemList[i]:addEventListener( "tap", onTapItem )
	end

  
  --group:insert( itemList[0])
  
  
  
  local back = display.newRect( 455, 25, 50, 50 )

  local function onTapBack( event )
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.scene_worldmap1",{ effect = "slideDown", time = 500})
  end
  group:insert( back )
  back:addEventListener( "tap", onTapBack )
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