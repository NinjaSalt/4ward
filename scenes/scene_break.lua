---------------------------------------------------------------------------------
-- PAUSE SCENE
-- Scene notes go here

---------------------------------------------------------------------------------
require("classes.items")
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local globals= require ("classes.globals") 
-- Clear previous scene
storyboard.removeAll()
 
-- local forward references should go here --
 
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 
-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view
  local redPaint = { .9, .9, .9 }
  local bluePaint = { .75, .75, .75 }
  local gradientPaint = { type="gradient", color1=redPaint, color2=bluePaint }
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
  
  local comBack = display.newRect( centerX, centerY, display.contentWidth-(display.contentWidth/7), display.contentHeight - (display.contentHeight/5)  )
  comBack:setFillColor(gradientPaint)
  group:insert (comBack)
  local title = display.newText( "We'll Be Right Back!", display.contentWidth/2, (display.contentHeight/2) - 30, globals.LOBSTERTWO, 36 )
  title:setFillColor( "Black" )
  group:insert (title)
  
  local function changeText()
  
    title.text = "And We're Back!"
  
  end
  local function makeText()
	
	--title.alpha = 0
	transition.to( comBack, { rotation=-360, time=1000, transition=easing.inOutCubic } )
	transition.to( title, { rotation=-360, time=1000, transition=easing.inOutCubic } )
	timer.performWithDelay( 500, changeText )
	
  end

  local function resume()
    storyboard.hideOverlay( "slideUp", 500 )
    storyboard.showOverlay("scenes.scene_hud", {effect = "fade", time = 500})
    --timer.resume(attackTimer)
    timer.resume(spawnEneTimer)
  if (globals.breakfastButton~=nil) then
    globals.breakfastButton:play()
  end
    if (globals.dinnerButton~=nil) then
    globals.dinnerButton:play()
  end
    if (globals.dessertButton~=nil) then
    globals.dessertButton:play()
  end
    globals.breakfastanimation:play()
    globals.dinneranimation:play()
  globals.dessertanimation:play()
  for n=0, 2, 1 do
    globals.belts[n]:play()
  end
    transition.resume()
  end
  timer.performWithDelay( 2000, makeText )
  timer.performWithDelay( 5000, resume )

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
  if ( table.maxn( allEne ) > 0 ) then
	  local numFoodItems
	  for i = 1, table.maxn( items ) do
		if(items[i].itemType ~= "foodType") then break end
		numFoodItems = i
	  end
	  local randomEnemy = math.random(1, table.maxn( allEne ))
	  local randomFoodItem = math.random(1, numFoodItems)
	  local smoke = display.newImage( "images/smoke.png", allEne[randomEnemy].x, allEne[randomEnemy].y, true )
		  transition.to( smoke, { time=1500, alpha=0, onComplete=function() smoke:removeSelf()end } )
	  itemCombo(items[randomFoodItem], allEne[randomEnemy], false)
	end
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