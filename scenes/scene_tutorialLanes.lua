---------------------------------------------------------------------------------
-- PAUSE SCENE
-- Scene notes go here

---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
local globals = require("classes.globals")
local scene = storyboard.newScene()
 
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
  bkg.alpha = .01
  group:insert (bkg)
  
  bkg:addEventListener("touch", function() return true end)
  bkg:addEventListener("tap", function() return true end)
  local swipe = display.newRect( 95, lane1-20, 54, 54)
  swipe.alpha = .01
  group:insert (swipe)
  --hero[n]
  local chef1 = display.newRect( hero[0].x, hero[0].y, hero[0].width, hero[0].height)
  chef1.alpha = .01
  group:insert (chef1)
  
  local chef2 = display.newRect( hero[1].x, hero[1].y, hero[1].width, hero[1].height)
  chef2.alpha = .01
  group:insert (chef2)
  
  local chef3 = display.newRect( hero[2].x, hero[2].y, hero[2].width, hero[2].height)
  chef3.alpha = .01
  group:insert (chef3)
  
  local toDo = display.newText( "Chefs serve one type of food", display.contentWidth/2, 20, globals.IMPRIMA, 36 )
  toDo:setFillColor(black)
  group:insert (toDo)
  
  local breakfast = display.newText( "Breakfast", -100,lane1+10, globals.IMPRIMA, 36 )
  breakfast:setFillColor(black)
  group:insert (breakfast)
  
  local dinner = display.newText( "Dinner", -100 , lane2+10, globals.IMPRIMA, 36 )
  dinner:setFillColor(black)
  group:insert (dinner)
  
  local dessert = display.newText( "Dessert", -100, lane3+10, globals.IMPRIMA, 36 )
  dessert:setFillColor(black)
  group:insert (dessert)
  
  local function onTapBack( event )
	local phase = event.phase
	if "ended" == phase or "cancelled" == phase then
			storyboard.hideOverlay( "slideUp", 500 )
			storyboard.showOverlay("scenes.scene_hud", {effect = "fade", time = 500})
			--timer.resume(attackTimer)
			timer.resume(spawnEneTimer)
			globals.breakfastanimation:play()
			if ( antagonistTimer ~= nil) then
				 timer.resume(antagonistTimer)
			end
			for n=0, 2, 1 do
			  globals.belts[n]:play()
			end
			timer.performWithDelay(400, bkftbuttonPressed )
	end
	
  end
  
  local function step4()
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
	if ( antagonistTimer ~= nil) then
	 timer.resume(antagonistTimer)
	end
	for n=0, 2, 1 do
	  globals.belts[n]:play()
	end
	transition.resume()
	--toDo.text = "Now let's serve the pancake"
	--transition.to( breakfast, { time=(400), x=(-100) , tag= "animation"} )
	--transition.to( dinner, { time=(400), x=(-100) , tag= "animation"} )
	--transition.to( dessert, { time=(400), x=(-100) , tag= "animation"} )
  end
  
  local function step3()
	transition.to( dessert, { time=(400), x=(display.contentWidth/2-75) , tag= "animation"} )
	chef3:addEventListener( "touch", step4 )
	toDo.text = "Tap the Dessert Chef"
  end
  
  local function step2()
	transition.to( dinner, { time=(400), x=(display.contentWidth/2-75) , tag= "animation"} )
	chef2:addEventListener( "touch", step3 )
	toDo.text = "Tap the Dinner Chef"
  end
  
  local function step1()
	transition.to( breakfast, { time=(400), x=(display.contentWidth/2-75) , tag= "animation"} )
	chef1:addEventListener( "touch", step2 )
	toDo.text = "Tap the Breakfast Chef"
  end
  
  
  local function step5()
	toDo.text = "Tap the serve button"
	swipe:addEventListener( "touch", onTapBack )
  end
  
  timer.performWithDelay(1500, step1 )
  --timer.performWithDelay(3000, step2 )
  --timer.performWithDelay(4500, step3 )
  --timer.performWithDelay(6000, step4 )
  --timer.performWithDelay(7500, step5 )
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
  timer.performWithDelay(1000, tutorialMoveToLane )
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