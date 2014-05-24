---------------------------------------------------------------------------------
-- SCENE NAME
-- Scene notes go here
---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local nextLevel 
local nextWorld
local conditionsNotMet
local globals = require ("classes.globals")
local sfx = require("classes.sfx")
require("classes.audioClass")
-- Clear previous scene
storyboard.removeAll()
 
-- local forward references should go here --
 
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 
-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view
  
  local audioDefeats = {sfx.audioDefeat1, sfx.audioDefeat2, sfx.audioDefeat3, sfx.audioDefeat4}
  soundToPlay = math.random(1, 4)
  playSFX (audioDefeats[soundToPlay], 1)
  
  local params = event.params
  nextLevel = params.level
  nextWorld = params.world
  conditionsNotMet = params.condition
  
  --timer.pause(attackTimer)
  timer.pause(spawnEneTimer)
  if (globals.breakfastButton~=nil) then
    globals.breakfastButton:pause()
  end
    if (globals.dinnerButton~=nil) then
    globals.dinnerButton:pause()
  end
    if (globals.dessertButton~=nil) then
    globals.dessertButton:pause()
  end
  globals.breakfastanimation:pause()
  globals.dinneranimation:pause()
  globals.dessertanimation:pause()
  if ( antagonistTimer ~= nil) then
	timer.cancel(antagonistTimer)
  end
  for n=0, 2, 1 do
    	globals.belts[n]:pause()
	end
	transition.pause("animation")
  local options = {
   effect = "fade",
   time = 500
}
  
  local bkg = display.newRect( centerX, centerY, display.contentWidth, display.contentHeight )
  bkg:setFillColor( gray )
  bkg.alpha = .5
  group:insert (bkg)

  local bkg = display.newImage( "images/pauseBack.png", centerX, centerY, true )
  bkg.height=display.contentHeight*.5; bkg.width=display.contentWidth*.5
  group:insert (bkg)

 local gameTitle = display.newText( "Defeat!", 0, 0, globals.LOBSTERTWO, 48 )
  gameTitle:setFillColor(black)
  gameTitle.x = display.contentCenterX
  gameTitle.y = 120
  
  group:insert( gameTitle )
  
  -- not needed because objectives are obtional?
  --if conditionsNotMet == true then
	--local scoreTitle = display.newText( "Unable to meet the objective...", 0, 0, globals.IMPRIMA, 24 )
	--scoreTitle:setFillColor(black)
	--scoreTitle.x = display.contentCenterX
	--scoreTitle.y = gameTitle.y + 50
  -- group:insert( scoreTitle )
  -- end
 
 
  local replayButton= display.newImage( "images/buttonReplay.png", 150,150, true )
  replayButton.width = 50
  replayButton.height = 50
  replayButton.x = -100
  replayButton.y = display.contentHeight/2 + 30

  group:insert( replayButton)
  
  local mapButton = display.newImage("images/buttonMenu.png", 150,150, true)
  mapButton.width =50
  mapButton.height= 50
  mapButton.x = 800
  mapButton.y = display.contentHeight/2 + 30
  group:insert( mapButton)
  
  
  
  timer.performWithDelay(200, function() transition.to(replayButton, {time = 400, x= display.contentWidth/2-30}) end)
  timer.performWithDelay(200, function() transition.to(mapButton, {time = 400, x= display.contentWidth/2+30}) end)


  local function onTapReplay( event )
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.scene_inBetween",{ effect = "fade", time = 500, params = {level = nextLevel, world = nextWorld}})
  end
  
  local function onTapMap( event )
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.scene_worldmap"..nextWorld,options)
  end

  replayButton:addEventListener( "tap", onTapReplay )
  mapButton:addEventListener( "tap", onTapMap )
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