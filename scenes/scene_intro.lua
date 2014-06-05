---------------------------------------------------------------------------------
-- PAUSE SCENE
-- Scene notes go here

---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
require("classes.level")
require("classes.audioClass")
local sfx = require("classes.sfx")
local globals = require ("classes.globals")
local levelNumber
-- Clear previous scene
storyboard.removeAll()
 
-- local forward references should go here --
 
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 -- for objective spacing purposes. 
local spacer = (display.contentHeight/2) - 30
local moveText = 0

local function antagonistShow()
	storyboard.showOverlay("scenes.scene_antagonist", {effect = "slideLeft", time=500})
end
 
-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view
  local options = {
   effect = "fade",
   time = 500
}



  local bkg = display.newRect( centerX, centerY, display.contentWidth, display.contentHeight )
  bkg:setFillColor( gray)
  bkg.alpha = .5
  group:insert (bkg)

  local vicCond = event.params.vic
  levelNumber = event.params.levelNumber
  local catCond = event.params.cat
  local scoreCond = event.params.scr
  local globals = require("classes.globals")
  worldNum = event.params.worldnum

  local levelName = levels[worldNum][levelNumber].levelTitle
 
  local function makeText() 
	local title = display.newText( "Objectives:", display.contentWidth/2, (display.contentHeight/2) - 80, globals.LOBSTERTWO, 28 )
  title:setFillColor( black )
	group:insert (title)

  local subtitle = display.newText( levelName, display.contentWidth/2, (display.contentHeight/2) - 115, globals.LOBSTERTWO, 34)
  subtitle:setFillColor( black )
  group:insert (subtitle)

  end
  --bkg:addEventListener("touch", function() return true end)
  --bkg:addEventListener("tap", function() return true end)

  --local objBorder = display.newRect( display.contentWidth/2, 170, 310, 210 )
  local objBorder = display.newRect( display.contentWidth/2, 160, 340, display.contentHeight )
  objBorder:setFillColor(black)
  group:insert (objBorder)
  local objBack = display.newRect( display.contentWidth/2, 160, 330, display.contentHeight-10 )
  group:insert(objBack)


  local function onTapBack( event )
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

   local function makeReady()

    local backBorder = display.newRect( display.contentWidth/2, 295, 95, 35 )
    backBorder: setFillColor (black)
    group:insert(backBorder)

    local back = display.newRect( display.contentWidth/2, 295, 90, 30 )
    group:insert( back )
    back:addEventListener( "tap", onTapBack )

    local readyText= display.newText( "Ready!", display.contentWidth/2, 295, globals.LOBSTERTWO, 25 )
    readyText:setFillColor(black)
    group:insert(readyText)
	playSFX (sfx.audioReady, 1)
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
  --timer.performWithDelay( 5000, resume )

  --startButton:addEventListener( "tap", onTap )
  --standard objective: survive!
  local function makeObj()
  --local standardObj = display.newText("Survive!", 400, (display.contentHeight/2) - 60, globals.IMPRIMA, 24)
 -- standardObj: setFillColor(black)
  --standardObj.x = 400
  --standardObj.y = (display.contentHeight/2) - 60
 -- transition.to(standardObj, {time = 150, x= display.contentWidth/2})
 -- group: insert(standardObj)
  end

  local center = display.contentWidth/2
  local textSize = 18
  local function introText()
    local introT = display.newText("Serve all the food!", 400, spacer, globals.IMPRIMA, textSize )
    introT: setFillColor(black)
    group: insert(introT)
    spacer  = spacer + 30
    transition.to(introT, {time=150, x=display.contentWidth/2 + moveText})

    local bonus = display.newText("Bonuses!:", 400, spacer, globals.LOBSTERTWO, 30)
    bonus: setFillColor(black)
    group: insert(bonus)
    spacer  = spacer + 45
    transition.to(bonus, {time=150, x=display.contentWidth/2+ moveText})

  end


   -- checks for and prints a second condition
   local function makeSecCond()
    if (vicCond ~= false) then
    -- print second condition here.
    local secObj = display.newText("Serve " .. vicCond.amount .. " " .. vicCond.enemy.name.. ".", 400, spacer, globals.IMPRIMA, textSize )
    secObj: setFillColor(black)
    group: insert(secObj)
    transition.to(secObj, {time=150, x=display.contentWidth/2+ moveText})
    if (vicCond.amount ~= 1) then
      if (vicCond.enemy.name == "Fries") then
      -- do nothing
    else
      secObj:removeSelf()
      secObj = display.newText("Serve " .. vicCond.amount .. " " .. vicCond.enemy.name .. "s.", 400, spacer, globals.IMPRIMA, textSize )
       secObj: setFillColor(black)
       group: insert(secObj)
       transition.to(secObj, {time=150, x=display.contentWidth/2+ moveText})
    end
    transition.to(secObj, {time=150, x=display.contentWidth/2+ moveText})
    secObj: setFillColor(black)
    group: insert(secObj)

  end
  spacer  = spacer + 38
end
  end

local function makeCatCond()
    if (catCond ~= false) then
    -- print category condition here.
    local catObj = display.newText("Serve " .. catCond.amount .. " " .. catCond.type.. " items.", 400, spacer, globals.IMPRIMA, textSize )
    catObj: setFillColor(black)
    group: insert(catObj)
    transition.to(catObj, {time=150, x=display.contentWidth/2+ moveText})
    if (catCond.amount == 1) then
      catObj:removeSelf()
      catObj = display.newText("Serve 1 " .. catCond.type .. " item.", 400, spacer, globals.IMPRIMA, textSize )
      catObj: setFillColor(black)
      group: insert(catObj)
      transition.to(catObj, {time=150, x=display.contentWidth/2+ moveText})
  end
   spacer  = spacer + 38
end
  end

local function makeScoreCond()
    if (scoreCond ~= false) then
    -- print category condition here.
    local scoreObj = display.newText("Score over " .. scoreCond.score .. " points.", 400, spacer, globals.IMPRIMA, textSize )
    scoreObj: setFillColor(black)
    group: insert(scoreObj)
    transition.to(scoreObj, {time=150, x=display.contentWidth/2+ moveText})
    spacer  = spacer + 38
  end  
end

local function makeStars()
  local firstStar = display.newImage("images/starb.png")
  firstStar.width = 25
  firstStar.height = 25
  firstStar.x = -200
  firstStar.y = 110
  group:insert(firstStar)
  transition.to(firstStar, {time=150, x=center})

  local twoStar = display.newImage("images/starb.png")
  twoStar.width = 25
  twoStar.height = 25
  twoStar.x = -200
  twoStar.y = 185
  group:insert(twoStar)
  transition.to(twoStar, {time=150, x=center - 12})

  local twoStarb = display.newImage("images/starb.png")
  twoStarb.width = 25
  twoStarb.height = 25
  twoStarb.x = -200
  twoStarb.y = 185
  group:insert(twoStarb)
  transition.to(twoStarb, {time=150, x=center + 12})

  local threeStar = display.newImage("images/starb.png")
  threeStar.width = 25
  threeStar.height = 25
  threeStar.x = -200
  threeStar.y = 225
  group:insert(threeStar)
  transition.to(threeStar, {time=150, x=center})

  local threeStarb = display.newImage("images/starb.png")
  threeStarb.width = 25
  threeStarb.height = 25
  threeStarb.x = -200
  threeStarb.y = 225
  group:insert(threeStarb)
  transition.to(threeStarb, {time=150, x=center+25})

  local threeStarc = display.newImage("images/starb.png")
  threeStarc.width = 25
  threeStarc.height = 25
  threeStarc.x = -200
  threeStarc.y = 225
  group:insert(threeStarc)
  transition.to(threeStarc, {time=150, x=center-25})


end

  local function makeAnt()
  local antag = display.newImage("images/antag_01.png")
  antag.width = 236--antag.width/5.5
  antag.height = 294--antag.height/5.5
  --antag.width = antag.width/5
  --antag.height = antag.height/5
  antag.x = display.contentWidth - 60
  --antag.x = display.contentWidth/5 - 20
  antag.y = 480 
  transition.to(antag,{time = 300,  y= display.contentHeight/2 + 20})
  --antag.x = display.contentWidth/5
  --antag.y = display.contentHeight/2
  group: insert (antag)
end
--perform all the fancy stuff.
timer.performWithDelay(800, makeText )
timer.performWithDelay(1200, makeAnt)
timer.performWithDelay(1800, makeObj)
timer.performWithDelay(1900, introText)
timer.performWithDelay(2100, makeSecCond)
timer.performWithDelay(2101, makeCatCond)
timer.performWithDelay(2102, makeScoreCond)
timer.performWithDelay(2100, makeStars)
timer.performWithDelay(2800, makeReady)
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
  
  local audioStartLevels = {sfx.audioStartLevel1, sfx.audioStartLevel2, sfx.audioStartLevel3, sfx.audioStartLevel4}
  soundToPlay = math.random(1, 4)
  playSFX (audioStartLevels[soundToPlay], 1)
  
  antagonistRandom = math.random(1, levelNumber)
  if ( levelNumber == 1 ) then
	antagonistRandom = 0
  end

  -- if it's the first world, the antagonist will not show up.
  if ( worldNum == 1) then
    antagonistRandom= 0 
  end

  local antTime = math.random(5000, 15000)
  if(antagonistRandom~=0)then
	antagonistTimer = timer.performWithDelay ( antTime, antagonistShow )
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