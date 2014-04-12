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
  print(worlds[1].levelsUnlocked[2])
  local group = self.view

  local levelSelect = 1
  
  local bkg = display.newImage( "images/mockback2.png", centerX, centerY, true )
  bkg.height=display.contentHeight; bkg.width=display.contentWidth
  group:insert (bkg)

  local banner = display.newImageRect( "images/bannerBlue.png", 300, 100 )
  banner.x = 236
  banner.y = 50
  group:insert(banner)

  local level1 = display.newImageRect( "images/Cake.png", 50, 50 )
  level1.x = 56
  level1.y = 119
  group:insert(level1)

  local level2 = display.newImageRect( "images/egg.png", 60, 60 )
  level2.x = 144
  level2.y = 122
  group:insert(level2)

  local level3 = display.newImageRect( "images/flour.png", 50, 50 )
  level3.x = 237
  level3.y = 123
  group:insert(level3)

  local level4 = display.newImageRect( "images/fries.png", 65, 65 )
  level4.x = 335
  level4.y = 122
  group:insert(level4)

  local level5 = display.newImageRect( "images/lockedLevel.png", 60, 60 )
  level5.x = 425
  level5.y = 121
  group:insert(level5)

  local infoGradient = display.newImageRect( "images/score.png", 300, 175 )
  infoGradient.x = 237
  infoGradient.y = 238
  group:insert(infoGradient)

  local backArrow = display.newImageRect( "images/backArrow.png", 75, 75 )
  backArrow.x = 41
  backArrow.y = 282
  group:insert(backArrow)

  local levelStart = display.newImageRect( "images/startButton.png", 65, 65 )
  levelStart.x = 444
  levelStart.y = 285
  group:insert(levelStart)

  local objectivesText = {
    text = "Objectives: Make a pancake!",     
    x = 250,
    y = 240,
    width = 256,     --required for multi-line and alignment
    font = globals.IMPRIMA,   
    fontSize = 18,
    align = "Left"  --new alignment parameter
  }

  local objectives = display.newText(objectivesText)
  group:insert(objectives)

  local levelTitleText = {
    text = "Step 1: Can you... Cook?",     
    x = 250,
    y = 195,
    width = 270,     --required for multi-line and alignment
    font = globals.LOBSTERTWO,   
    fontSize = 28,
    align = "Left"  --new alignment parameter
  }

  local levelTitle = display.newText(levelTitleText)
  group:insert(levelTitle)

  local function onTapLevel1 ( event )
    levelTitle.text = "Step 1: Can you... Cook?"
    objectives.text = "Objectives: Make a Pancake."
    levelSelect = 1
   -- level1.strokeWidth = 3
   -- level1.stroke.effect = "generator.marchingAnts"
  end

  local function onTapLevel2 ( event )
    levelTitle.text = "Step 2: Cake and Bake!"
    objectives.text = "Objectives: Make two Cakes."
    levelSelect = 2
  end

  local function onTapLevel3 ( event )
    levelTitle.text = "Step 3: Food Surprise"
    objectives.text = "Objectives: Make one Steak Omelette"
    levelSelect = 3
  end

  local function onTapLevel4 ( event )
    levelTitle.text = "Step 4: Certi-fried Chef"
    objectives.text = "Objectives: Make two Fries"
    levelSelect = 4
  end

  local function onTapLevel5 ( event )
    levelTitle.text = "Secret Level: ???"
    objectives.text = "Objectives: ???"
    levelSelect = 5
  end  

  level1:addEventListener("tap", onTapLevel1)
  level2:addEventListener("tap", onTapLevel2)
  level3:addEventListener("tap", onTapLevel3)
  level4:addEventListener("tap", onTapLevel4)
  level5:addEventListener("tap", onTapLevel5)

  local function onTapStartLevel (event)
	if( levelSelect < 5 or ( levelSelect == 5  and worlds[1].levelsUnlocked[5] ) ) then
		storyboard.removeScene( scene )
		storyboard.gotoScene( "scenes.scene_ingame", { effect = "fade", time = 250, params = {level = levelSelect, world = 1}})
	end
  end

  levelStart:addEventListener("tap", onTapStartLevel)

  local function onTapBackArrow (event)
    storyboard.removeScene(scene)
    storyboard.gotoScene("scenes.scene_worldmap", {effect = "fade", time = 250})
  end

  backArrow:addEventListener("tap", onTapBackArrow)

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