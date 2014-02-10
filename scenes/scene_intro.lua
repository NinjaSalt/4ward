---------------------------------------------------------------------------------
-- PAUSE SCENE
-- Scene notes go here

---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
require("classes.level")
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

  local vicCond = event.params.vic


  if "Win" == system.getInfo( "platformName" ) then
    LOBSTERTWO = "Lobster Two"
  elseif "Android" == system.getInfo( "platformName" ) then
    LOBSTERTWO = "LobsterTwo-Regular"
  else
    -- Mac and iOS
    LOBSTERTWO = "Lobster Two"
  end

  local function makeText()
	local title = display.newText( "Objectives:", display.contentWidth/2, (display.contentHeight/2) - 110, LOBSTERTWO, 30 )
	group:insert (title)
  end
  --bkg:addEventListener("touch", function() return true end)
  --bkg:addEventListener("tap", function() return true end)

  local objBack = display.newRect( display.contentWidth/2, 170, 300, 200 )
  group:insert(objBack)

  local back = display.newRect( display.contentWidth/2, 290, 90, 30 )

  local function onTapBack( event )
    storyboard.hideOverlay( "slideUp", 500 )
    storyboard.showOverlay("scenes.scene_hud", {effect = "fade", time = 500})
    timer.resume(attackTimer)
    timer.resume(spawnEneTimer)
    transition.resume()
  end
  group:insert( back )
  back:addEventListener( "tap", onTapBack )

  local readyText= display.newText( "Ready!", display.contentWidth/2, 290, LOBSTERTWO, 25 )
  readyText:setFillColor(black)
  group:insert(readyText)
  
  local function resume()
    storyboard.hideOverlay( "slideUp", 500 )
    storyboard.showOverlay("scenes.scene_hud", {effect = "fade", time = 500})
    timer.resume(attackTimer)
    timer.resume(spawnEneTimer)
    transition.resume()
  end
  timer.performWithDelay( 1000, makeText )
  --timer.performWithDelay( 5000, resume )

  --startButton:addEventListener( "tap", onTap )
  --standard objective: survive!
  local standardObj = display.newText("Survive!", display.contentWidth/2, (display.contentHeight/2) - 60, native.systemFontBold, 20)
  standardObj: setFillColor(black)
  group: insert(standardObj)

  -- checks for and prints a second condition
  if (vicCond ~= false) then
    -- print second condition here.
    local secObj = display.newText("Make " .. vicCond.amount .. " " .. vicCond.enemy.name, display.contentWidth/2, (display.contentHeight/2) - 30, native.systemFontBold, 20)
    secObj: setFillColor(black)
    group: insert(secObj)
    --print("Make " .. vicCond.amount .. " " .. vicCond.enemy.name)
  end


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