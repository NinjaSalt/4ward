---------------------------------------------------------------------------------
-- HUD LUA
-- Scene notes go here
---------------------------------------------------------------------------------
 
local globals = require("classes.globals") 
local storyboard = require( "storyboard" )
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

  currencyText = globals.currency.init({
    fontSize = 20,
    font = "Helvetica",
    x = 84,
    y = 14,
    maxDigits = 7,
    leadingZeros = false,
    filename = "currencyfile.txt",
    })
  currencyText:setFillColor( black )

  scoreText = display.newText( globals.score, 15, display.contentHeight-15, native.systemFontBold, 20 )

  scoreText:setFillColor(black )

  group:insert(currencyText)
  group:insert(scoreText)


-- NUMBER OF LIVES
  hearts = display.newImage("images/lives.png")
  hearts.width = 50
  hearts.height = 25
  hearts.x = 30
  hearts.y = 15
  group:insert(hearts)

-- PLAYERS CURRENCY
  money = display.newImage("images/money.png")
  money.width = 58
  money.height = 28
  money.x = 85
  money.y = 14  
  group:insert(money)


-- PLAYERS ITEM BELT
  items = {}

  items[0] = display.newImage("images/itemHolder.png")
  items[0].width = 40
  items[0].height = 40
  items[0].x = 250
  items[0].y = 20
  group:insert(items[0])

  items[0] = display.newImage("images/itemHolder.png")
  items[0].width = 40
  items[0].height = 40
  items[0].x = 200
  items[0].y = 20
  group:insert(items[0])

  items[0] = display.newImage("images/itemHolder.png")
  items[0].width = 40
  items[0].height = 40
  items[0].x = 300
  items[0].y = 20
  group:insert(items[0])
  
-- PAUSE BUTTON
  local pauseButton = display.newImage("images/Pause.png",25,25 )
  pauseButton.x = 466
  pauseButton.y = 12
  group:insert(pauseButton)

 local function onTapPause( event )
    storyboard.showOverlay("scenes.scene_pause", {effect = "slideDown", time=500})
    timer.pause(attackTimer)
    timer.pause(spawnEneTimer)
    transition.pause("animation")
  end

  pauseButton:addEventListener( "tap", onTapPause )
end
 
-- Called BEFORE scene has moved onscreen:
function scene:willEnterScene( event )
  local group = self.view
  local prevCurrency = globals.currency.load()
  if prevCurrency then
    globals.currency.set(prevCurrency)
  end
 
end
 
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
  local group = self.view
 
end
 
-- Called when scene is about to move offscreen:
function scene:exitScene( event )
  local group = self.view
  currencyText:removeSelf()
  scoreText:removeSelf()
 
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