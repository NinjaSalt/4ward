
---------------------------------------------------------------------------------
-- SCENE NAME
-- Scene notes go here
---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
local globals = require("classes.globals")
require("classes.levelUnlocking")
require("classes.audioClass")
local sfx = require("classes.sfx")
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
  
  local audioVictorys = {sfx.audioVictory1, sfx.audioVictory2, sfx.audioVictory3, sfx.audioVictory4, sfx.audioVictory5, sfx.audioVictory6, sfx.audioVictory7}
  soundToPlay = math.random(1, 7)
  playSFX (audioVictorys[soundToPlay], 1)
  
  local params = event.params
  nextLevel = params.level
  nextWorld = params.world
  numStars = params.starTotal
  
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

  --local border = display.newRect(centerX, centerY, display.contentWidth*.72, display.contentHeight*.72)
  --border:setFillColor(0)
  --group:insert(border)

  local bkg = display.newImage( "images/pauseBack.png", centerX, centerY, true )
  --local bkg = display.newRect(centerX, centerY, display.contentWidth*.7, display.contentHeight*.7 )
  bkg.height=display.contentHeight*.7; bkg.width=display.contentWidth*.7
  group:insert (bkg)

  --local gameTitleb = display.newText( "Victory!", 0, 0, globals.LOBSTERTWO, 50 )
  --gameTitleb:setFillColor( 0.866667, 0.627451, 0.866667)
  --gameTitleb.x = display.contentCenterX-2
  --gameTitleb.y = 78
  --group:insert(gameTitleb)

  -- local function callSparkles()
  --   local sparkles = display.newImage( "images/sparkles.png", centerX, centerY-60, true )
  --   sparkles.width = sparkles.width/4
  --   sparkles.height = sparkles.height/4
  --   group:insert(sparkles)
  --   transition.to( sparkles, { time=1500, alpha=0, onComplete=function()
  --       if (sparkles ~= nil) then
  --         sparkles:removeSelf()
  --         sparkles=nil
  --       end
  --     end } )
  -- end

 -- timer.performWithDelay(300, callSparkles )

 local gameTitle = display.newText( "You Cleared the Level!", 0, 0, globals.LOBSTERTWO, 30 )
  gameTitle:setFillColor(black)
  gameTitle.x = display.contentCenterX
  gameTitle.y = 75
  
  group:insert( gameTitle )
  
  local scoreTitle = display.newText( "Score: " ..globals.score, 0, 0, globals.IMPRIMA, 20)
   
  scoreTitle:setFillColor(black)
  scoreTitle.x = display.contentCenterX
  scoreTitle.y = gameTitle.y + 35
  --adding the score integer into the currency
  group:insert( scoreTitle )
  
  local buttonY = scoreTitle.y + 120

  if nextLevel == LevelList.getNumOfLevels(params.world) then
  --nextWorldButton = display.newText( "Next World", 0, 0, globals.IMPRIMA, 24 )
  --nextWorldButton:setFillColor(black)
  --nextWorldButton.x = display.contentWidth * 1.5
  nextWorldButton = display.newImage( "images/buttonNext.png", 150,150, true )
  nextWorldButton.width = 50
  nextWorldButton.height = 50
  nextWorldButton.x = 800
  nextWorldButton.y = buttonY
  group:insert( nextWorldButton)
 
 else
  --nextLevelButton = display.newText( "Next Level", 0, 0, globals.IMPRIMA, 24 )
  --nextLevelButton:setFillColor(black)
  nextLevelButton = display.newImage( "images/buttonNext.png", 150,150, true )
  nextLevelButton.width = 50
  nextLevelButton.height = 50
  nextLevelButton.x = 800
  nextLevelButton.y = buttonY

  group:insert( nextLevelButton)
  
  end
 
  -- local replayButton = display.newText( "Replay", 0, 0, globals.IMPRIMA, 24 )
  --replayButton:setFillColor(black)
  local replayButton= display.newImage( "images/buttonReplay.png", 150,150, true )
  replayButton.width = 50
  replayButton.height = 50
  replayButton.x = 800--display.contentWidth/2 - 60
  replayButton.y = buttonY

  group:insert( replayButton)
  
  --local mapButton = display.newText( "Map", 0, 0, globals.IMPRIMA, 24 )
  --mapButton:setFillColor(black)
  local mapButton = display.newImage("images/buttonMenu.png", 150,150, true)
  mapButton.width =50
  mapButton.height= 50
  mapButton.x = 800 --display.contentWidth/2
  mapButton.y = buttonY
  group:insert( mapButton)
  
  local shareButton = display.newImage("images/buttonShare.png", 800, buttonY, true )
  shareButton.width = 50
  shareButton.height = 50
  group:insert( shareButton)

  -- DISPLAY: number of stars you received during this round, NOT the highesst number of stars you've reached in this round.
  local function starShow()
    local sideStarX = 45
    local sideStarY = scoreTitle.y + 55
    local centStarY = scoreTitle.y + 45

    local firstStar = display.newImage( "images/star.png", 150, 150, true )
    firstStar.width = 50
    firstStar.height = 50
    firstStar.x = display.contentWidth/2 - sideStarX
    firstStar.y = sideStarY
    group: insert(firstStar)

    if (numStars ~= 3) then
      local thirdStar = display.newImage( "images/star_gray.png", 150, 150, true )
      thirdStar.width = 50
      thirdStar.height = 50
      thirdStar.x = display.contentWidth/2 + sideStarX
      thirdStar.y = sideStarY
      group: insert(thirdStar)
    else
      local thirdStar = display.newImage( "images/star.png", 150, 150, true )
      thirdStar.width = 50
      thirdStar.height = 50
      thirdStar.x = display.contentWidth/2 + sideStarX
      thirdStar.y = sideStarY
      group: insert(thirdStar)
    end

    if (numStars ~= 1) then
      local secondStar = display.newImage( "images/star.png", 150, 150, true )
      secondStar.width = 50
      secondStar.height = 50
      secondStar.x = display.contentWidth/2
      secondStar.y = centStarY
      group: insert(secondStar)
    else
      local secondStar = display.newImage( "images/star_gray.png", 150, 150, true )
      secondStar.width = 50
      secondStar.height = 50
      secondStar.x = display.contentWidth/2
      secondStar.y = centStarY
      group: insert(secondStar)
    end


  end
  
   timer.performWithDelay( 1000, starShow )

  if ( params.world == 1 and nextLevel == 4 and gameSettings[8][4] == false) then
   timer.performWithDelay(2000, function() storyboard.showOverlay( "scenes.scene_tipTrash" , {effect = "slideDown", time = 500 } )end)
  elseif (nextLevel == LevelList.getNumOfLevels(params.world)) then
	--timer.performWithDelay(800, function() transition.to(nextWorldButton, {time = 700, x= display.contentWidth/2 + 90}) end)
    timer.performWithDelay(800, function() transition.to(replayButton, {time = 700, x= display.contentWidth/2 - 60}) end)
    timer.performWithDelay(800, function() transition.to(mapButton, {time = 700, x= display.contentWidth/2 + 60}) end)
    timer.performWithDelay(800, function() transition.to(shareButton, {time = 700, x= display.contentWidth/2 }) end)
  else
    timer.performWithDelay(800, function() transition.to(nextLevelButton, {time = 700, x= display.contentWidth/2 + 90}) end)
    timer.performWithDelay(800, function() transition.to(replayButton, {time = 700, x= display.contentWidth/2 - 90}) end)
    timer.performWithDelay(800, function() transition.to(mapButton, {time = 700, x= display.contentWidth/2 + 30}) end)
    timer.performWithDelay(800, function() transition.to(shareButton, {time = 700, x= display.contentWidth/2 - 30}) end)
  end


  local function onTapNextLevel( event )
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.scene_inBetween",{ effect = "fade", time = 500, params = {level = nextLevel+1, world = nextWorld}})
  end
  
  local function onTapNextWorld( event )
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.scene_worldmap",options)
  end

  local function onTapReplay( event )
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.scene_inBetween",{ effect = "fade", time = 500, params = {level = nextLevel, world = nextWorld}})
  end
  
  local function onTapMap( event )
    storyboard.removeScene( scene )
	
    storyboard.gotoScene( "scenes.scene_worldmap"..nextWorld,options)
  end
  
  --[[local socialOptions = {
   service = "facebook",
   message = "Check out the game I'm making",
   listener = socialEventListener,
   url = "http://nwcgame.com"
}]]
  
  local function onTapShare( event )
    --native.showPopup( "social", socialOptions )
    print("I just scored " .. globals.score .. " points on level " .. nextWorld .. "-" .. nextLevel .. " in Now We're Cooking")
  end
  
  
  timer.performWithDelay(1900, function()

	if nextLevel == LevelList.getNumOfLevels(params.world) then
		nextWorldButton:addEventListener( "tap", onTapNextWorld )
	else
		nextLevelButton:addEventListener( "tap", onTapNextLevel )
	end
  if (onTapReplay~=nil and replayButton~=nil) then
  	replayButton:addEventListener( "tap", onTapReplay )
  end
	mapButton:addEventListener( "tap", onTapMap )
	end )
	
	shareButton:addEventListener( "tap", onTapShare )
  
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
   -- if (sparkles ~= nil) then
   --      sparkles:removeSelf()
   --      sparkles=nil
   --    end
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