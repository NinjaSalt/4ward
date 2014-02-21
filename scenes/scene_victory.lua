
---------------------------------------------------------------------------------
-- SCENE NAME
-- Scene notes go here
---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
local globals = require("classes.globals")
require("classes.levelUnlocking")
local scene = storyboard.newScene()
local nextLevel 
local nextWorld
-- Clear previous scene
storyboard.removeAll()
 
-- local forward references should go here --
 
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 
-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view
  
  local params = event.params
  nextLevel = params.level
  nextWorld = params.world
  
  timer.pause(attackTimer)
  timer.pause(spawnEneTimer)
  if ( antagonistTimer ~= nil) then
	timer.cancel(antagonistTimer)
  end
  for n=0, 2, 1 do
    	globals.belts[n]:pause()
	end
  if (globals.bullet ~= nil and globals.bullet_array ~= nil) then
      for i=0, #globals.bullet_array, 1 do
        if (globals.bullet_array[i] ~= nil) then
          globals.bullet_array[i]:pause()
        end
      end
    end
	transition.pause("animation")
  local options = {
   effect = "fade",
   time = 500
}
--[[
  local bkg = display.newImage( "images/mockback1.png", centerX, centerY, true )
  bkg.height=display.contentHeight; bkg.width=display.contentWidth
  bkg.alpha=.01
  group:insert (bkg)
  ]]--
  
  local bkg = display.newRect( centerX, centerY, display.contentWidth, display.contentHeight )
  bkg:setFillColor( gray )
  bkg.alpha = .5
  group:insert (bkg)

  local bkg = display.newImage( "images/mockback1.png", centerX, centerY, true )
  bkg.height=display.contentHeight*.7; bkg.width=display.contentWidth*.7
  group:insert (bkg)

 local gameTitle = display.newText( "Victory!", 0, 0, globals.LOBSTERTWO, 48 )
  gameTitle:setFillColor(black)
  gameTitle.x = display.contentCenterX
  gameTitle.y = 80
  
  group:insert( gameTitle )
  
  local scoreTitle = display.newText( "Score: " ..globals.score, 0, 0, globals.IMPRIMA, 36 )
  scoreTitle:setFillColor(black)
  scoreTitle.x = display.contentCenterX
  scoreTitle.y = gameTitle.y + 45
 
  group:insert( scoreTitle )
  
  if nextLevel == LevelList.getNumOfLevels(params.world) then
 nextWorldButton = display.newText( "Next World", 0, 0, globals.IMPRIMA, 24 )
  nextWorldButton:setFillColor(black)
  nextWorldButton.x = display.contentCenterX
  nextWorldButton.y = scoreTitle.y + 40
  group:insert( nextWorldButton)
 
 else
 nextLevelButton = display.newText( "Next Level", 0, 0, globals.IMPRIMA, 24 )
  nextLevelButton:setFillColor(black)
  nextLevelButton.x = display.contentCenterX
  nextLevelButton.y = scoreTitle.y + 40

  group:insert( nextLevelButton)
  
  end
 
  local replayButton = display.newText( "Replay", 0, 0, globals.IMPRIMA, 24 )
  replayButton:setFillColor(black)
  replayButton.x = display.contentCenterX
  replayButton.y = scoreTitle.y + 80

  group:insert( replayButton)
  
  local mapButton = display.newText( "Map", 0, 0, globals.IMPRIMA, 24 )
  mapButton:setFillColor(black)
  mapButton.x = display.contentCenterX
  mapButton.y = replayButton.y + 40

  group:insert( mapButton)
  
  local function onTapNextLevel( event )
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.scene_inBetween",{ effect = "fade", time = 500, params = {level = nextLevel+1, world = nextWorld}})
  end
  
  local function onTapNextWorld( event )
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.scene_worldmap"..(nextWorld+1),options)
  end

  local function onTapReplay( event )
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.scene_inBetween",{ effect = "fade", time = 500, params = {level = nextLevel, world = nextWorld}})
  end
  
  local function onTapMap( event )
    storyboard.removeScene( scene )
	
    storyboard.gotoScene( "scenes.scene_worldmap"..nextWorld,options)
  end

  if nextLevel == LevelList.getNumOfLevels(params.world) then
	nextWorldButton:addEventListener( "tap", onTapNextWorld )
  else
	nextLevelButton:addEventListener( "tap", onTapNextLevel )
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
  --[[
  local params = event.params
  nextLevel = params.level
  nextWorld = params.world
  ]]--
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