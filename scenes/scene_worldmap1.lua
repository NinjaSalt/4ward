---------------------------------------------------------------------------------
-- SCENE NAME
-- Scene notes go here
---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local globals = require("classes.globals")
-- local loadsave = require("classes.loadsave")
require("classes.levelUnlocking")

-- gameSettings = loadsave.loadTable("gamesettings.json")

 
-- Clear previous scene
storyboard.removeAll()
 
-- local forward references should go here --
 
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:createScene( event )

  local group = self.view

  local levelSelect = 1
  
  local bkg = display.newImage( "images/mockback2.png", centerX, centerY, true )
  bkg.height=display.contentHeight; bkg.width=display.contentWidth
  group:insert (bkg)
  -- local bkg = display.newRect( centerX, centerY, display.contentWidth, display.contentHeight )
  -- bkg:setFillColor( gray )
  -- bkg.alpha = .5
  -- group:insert (bkg)

  local banner = display.newImageRect( "images/bannerBlue.png", 200, 80 )
  banner.x = 236
  banner.y = 45
  group:insert(banner)

  local itemShop = display.newImageRect( "images/pantry.png", 50, 50 )
  itemShop.x = 360
  itemShop.y = 30
  group:insert(itemShop)

  local recipeBook = display.newImageRect( "images/book.png", 75, 75 )
  recipeBook.x = 100
  recipeBook.y = 40
  group:insert(recipeBook)

  local aquagradient = graphics.newGradient(
  { 1, 1, 1 },
  { 0, 1, 1 },
  "down" )

  local deepskybluegradient = graphics.newGradient(
  { 1, 1, 1 },
  { 0, 0.749, 1 },
  "down" )

  local dodgerbluegradient = graphics.newGradient(
  { 1, 1, 1 },
  { 0.1176, 0.5647, 1 },
  "down" )

  local cornflowerbluegradient = graphics.newGradient(
  { 1, 1, 1 },
  { 0.3922, 0.5843, 0.9294 },
  "down" )

  local royalbluegradient = graphics.newGradient(
  { 1, 1, 1 },
  { 0.2549, 0.4118, 0.8824 },
  "down" )

--LEVEL ONE --
  local levelOneBlack = display.newRect( 56, display.contentHeight*(3/5), 62, display.contentHeight-98 )
  levelOneBlack:setFillColor( black )
  group:insert(levelOneBlack)
  local levelOneGradient = display.newRect( 56, display.contentHeight*(3/5), 60, display.contentHeight-100 )
  levelOneGradient:setFillColor( aquagradient )
  group:insert(levelOneGradient)

--LEVEL TWO --
  local levelTwoBlack = display.newRect( 144, display.contentHeight*(3/5), 62, display.contentHeight-98 )
  levelTwoBlack:setFillColor( black )
  group:insert(levelTwoBlack)
  local levelTwoGradient = display.newRect( 144, display.contentHeight*(3/5), 60, display.contentHeight-100 )
  levelTwoGradient:setFillColor( deepskybluegradient )
  group:insert(levelTwoGradient)

-- LEVEL THREE --
  local levelThreeBlack = display.newRect( 237, display.contentHeight*(3/5), 62, display.contentHeight-98 )
  levelThreeBlack:setFillColor( black )
  group:insert(levelThreeBlack)
  local levelThreeGradient = display.newRect( 237, display.contentHeight*(3/5), 60, display.contentHeight-100 )
  levelThreeGradient:setFillColor( dodgerbluegradient )
  group:insert(levelThreeGradient)

-- LEVEL FOUR --
  local levelFourBlack = display.newRect( 335, display.contentHeight*(3/5), 62, display.contentHeight-98 )
  levelFourBlack:setFillColor( black )
  group:insert(levelFourBlack)
  local levelFourGradient = display.newRect( 335, display.contentHeight*(3/5), 60, display.contentHeight-100 )
  levelFourGradient:setFillColor( cornflowerbluegradient )
  group:insert(levelFourGradient)

-- LEVEL FIVE --
  local levelFiveBlack = display.newRect( 425, display.contentHeight*(3/5), 62, display.contentHeight-98 )
  levelFiveBlack:setFillColor( black )
  group:insert(levelFiveBlack)
  local levelFiveGradient = display.newRect( 425, display.contentHeight*(3/5), 60, display.contentHeight-100 )
  levelFiveGradient:setFillColor( royalbluegradient )
  group:insert(levelFiveGradient)

  local levelStart = display.newImageRect( "images/startButton.png", 65/2, 65/2 )
  levelStart.x = display.contentWidth-levelStart.width/2
  levelStart.y = display.contentHeight-levelStart.height/2
  group:insert(levelStart)

  local resetScreen = display.newImageRect( "images/return.png", 65/2, 65/2 )
  resetScreen.x = resetScreen.width/2
  resetScreen.y = resetScreen.height/2
  group:insert(resetScreen)

  local objectivesText = {
    text = "Objectives: Make a pancake!",     
    x = -250,
    y = -240,
    width = 256,     --required for multi-line and alignment
    font = globals.IMPRIMA,   
    fontSize = 18,
    align = "Left"  --new alignment parameter
  }

  local objectives = display.newText(objectivesText)
  group:insert(objectives)

  local levelTitleText = {
    text = "Step 1: Can you... Cook?",     
    x = -250,
    y = -195,
    width = 270,     --required for multi-line and alignment
    font = globals.LOBSTERTWO,   
    fontSize = 28,
    align = "Left"  --new alignment parameter
  }

  local levelTitle = display.newText(levelTitleText)
  group:insert(levelTitle)

  -- local starsText = {
  --   text = "Stars: ",     
  --   x = 250,
  --   y = 280,
  --   width = 256,     --required for multi-line and alignment
  --   font = globals.IMPRIMA,   
  --   fontSize = 18,
  --   align = "Left"  --new alignment parameter
  -- }

  -- local stars = display.newText(starsText)
  -- group:insert(stars)
  
  local star1 = display.newImageRect( "images/star_gray.png", 30, 30 )
  -- star1.x = 200
  -- star1.y = 280
   star1.alpha = 0
  group:insert(star1)
  
  local star2 = display.newImageRect( "images/star_gray.png", 30, 30 )
  -- star2.x = 230
  -- star2.y = 280
   star2.alpha = 0
  group:insert(star2)
  
  local star3 = display.newImageRect( "images/star_gray.png", 30, 30 )
  -- star3.x = 260
  -- star3.y = 280
   star3.alpha = 0
  group:insert(star3)
  
  local function setStars (thisLevel, x)
    -- star1.alpha = 0
    -- star2.alpha = 0
    -- star3.alpha = 0   
     star1.alpha = 1
    star2.alpha = 1
    star3.alpha = 1
    star1.x = x - 35
    star2.x = x
    star3.x = x + 35

    star1.y = 200
    star2.y = 200
    star3.y = 200

    if (globals.stars[1][thisLevel] >= 1) then
      star1:removeSelf( )
      star1 = nil
    	star1 = display.newImageRect( "images/star.png", 30, 30 )
      star1.x = x - 35
      star1.y = display.contentWidth-80
      group:insert(star1)
    end
    if (globals.stars[1][thisLevel] >= 2) then
      star2:removeSelf( )
      star2 = nil
    	star2 = display.newImageRect( "images/star.png", 30, 30 )
      star2.x = x
      star2.y = display.contentWidth-80
      group:insert(star2)
    end
    if (globals.stars[1][thisLevel] >= 3) then
      star3:removeSelf( )
      star3 = nil
    	star3 = display.newImageRect( "images/star.png", 30, 30 )
      star3.x = x + 35
      star3.y = display.contentWidth-80
      group:insert(star3)
    end
  end

  -- setStars(1, 56)
  -- setStars(2, 144)
  -- setStars(3, 237)
  -- setStars(4, 335)
  -- setStars(5, 425)

  --   local function setSavedStars (thisLevel)
  --   star1.alpha = 0
  --   star2.alpha = 0
  --   star3.alpha = 0
  --   --print("STARS: " .. gameSettings[1][levelSelect][2])
  --   if (thisLevel >= 1) then
  --     star1.alpha = 1
  --   end
  --   if (thisLevel >= 2) then
  --     star2.alpha = 1
  --   end
  --   if (thisLevel >= 3) then
  --     star3.alpha = 1
  --   end
  -- end
  
  local function onTapLevel1 ( event )
    star1.alpha = 0
    star2.alpha = 0
    star3.alpha = 0 
    if (levelTitle ~= nil and objectives ~= nil) then
      transition.to( levelTitle, { time=200, alpha=0} )
      transition.to( objectives, { time=200, alpha=0} )
    end

    transition.to( levelOneBlack, { time=500, x = display.contentWidth/2-48, width = display.contentWidth-150,onComplete=function() 
        --print("done")
      end, tag="animation" } )
    transition.to( levelOneGradient, { time=500, x = display.contentWidth/2-48, width = display.contentWidth-152,onComplete=function() 
          if (levelTitle ~= nil and objectives ~= nil) then
      transition.to( levelTitle, { time=200, alpha=1} )
      transition.to( objectives, { time=200, alpha=1} )
    end
        levelTitle.text = "Step 1: Can you... Cook?"
        levelTitle:setFillColor( black )
        levelTitle.x = display.contentWidth/2-48
        levelTitle.y = 100
        objectives.text = "Objectives: Make a Pancake."
        objectives:setFillColor( black )
        objectives.x = display.contentWidth/2-48
        objectives.y = 150
        levelSelect = 1
        setStars(levelSelect, display.contentWidth/2-48)
      end, tag="animation" } )

    --moving the other levels to the side
    transition.to( levelTwoBlack, { time=500, x = display.contentWidth-108, width = 22,onComplete=function() 
        --print("done")
      end, tag="animation" } )
    transition.to( levelTwoGradient, { time=500, x = display.contentWidth-108, width = 20,onComplete=function() 
        --print("done")
      end, tag="animation" } )

    transition.to( levelThreeBlack, { time=500, x = display.contentWidth-84, width = 22,onComplete=function() 
        --print("done")
      end, tag="animation" } )
    transition.to( levelThreeGradient, { time=500, x = display.contentWidth-84, width = 20,onComplete=function() 
        --print("done")
      end, tag="animation" } )

    transition.to( levelFourBlack, { time=500, x = display.contentWidth-60, width = 22,onComplete=function() 
        --print("done")
      end, tag="animation" } )
    transition.to( levelFourGradient, { time=500, x = display.contentWidth-60, width = 20,onComplete=function() 
       -- print("done")
      end, tag="animation" } )

    transition.to( levelFiveBlack, { time=500, x = display.contentWidth-36, width = 22,onComplete=function() 
       -- print("done")
      end, tag="animation" } )
    transition.to( levelFiveGradient, { time=500, x = display.contentWidth-36, width = 20,onComplete=function() 
        --print("done")
      end, tag="animation" } )

	 --setStars(levelSelect, 56)
   print("level1")
  --  if (gameSettings[1][levelSelect][2] ~= 0 and gameSettings[1][levelSelect][2] ~= nil) then
  --   setSavedStars (gameSettings[1][levelSelect][2])
  -- end
   -- level1.strokeWidth = 3
   -- level1.stroke.effect = "generator.marchingAnts"
   -- print("level high score: " .. gameSettings[1][levelSelect][1])
  end

  local function onTapLevel2 ( event )
    star1.alpha = 0
    star2.alpha = 0
    star3.alpha = 0 
    if (levelTitle ~= nil and objectives ~= nil) then
      transition.to( levelTitle, { time=200, alpha=0} )
      transition.to( objectives, { time=200, alpha=0} )
    end

    transition.to( levelOneBlack, { time=500, x = 38, width = 22,onComplete=function() 
        --print("done")
      end, tag="animation" } )
    transition.to( levelOneGradient, { time=500, x = 38, width = 20,onComplete=function() 
        --levelonepressed = true
      end, tag="animation" } )

    transition.to( levelTwoBlack, { time=500, x = display.contentWidth/2-24, width = display.contentWidth-150,onComplete=function() 
        --print("done")
      end, tag="animation" } )
    transition.to( levelTwoGradient, { time=500, x = display.contentWidth/2-24, width = display.contentWidth-152,onComplete=function()
        if (levelTitle ~= nil and objectives ~= nil) then
      transition.to( levelTitle, { time=200, alpha=1} )
      transition.to( objectives, { time=200, alpha=1} )
    end 
        levelTitle.text = "Step 2: Cake and Bake!"
        levelTitle:setFillColor( black )
        levelTitle.x = display.contentWidth/2-24
        levelTitle.y = 100
        objectives.text = "Objectives: Serve 3 Dessert Items"
        objectives:setFillColor( black )
        objectives.x = display.contentWidth/2-24
        objectives.y = 150
        levelSelect = 2
        setStars(levelSelect, display.contentWidth/2-24)
      end, tag="animation" } )

    transition.to( levelThreeBlack, { time=500, x = display.contentWidth-84, width = 22,onComplete=function() 
        --print("done")
      end, tag="animation" } )
    transition.to( levelThreeGradient, { time=500, x = display.contentWidth-84, width = 20,onComplete=function() 
        --print("done")
      end, tag="animation" } )

    transition.to( levelFourBlack, { time=500, x = display.contentWidth-60, width = 22,onComplete=function() 
        --print("done")
      end, tag="animation" } )
    transition.to( levelFourGradient, { time=500, x = display.contentWidth-60, width = 20,onComplete=function() 
       -- print("done")
      end, tag="animation" } )

    transition.to( levelFiveBlack, { time=500, x = display.contentWidth-36, width = 22,onComplete=function() 
       -- print("done")
      end, tag="animation" } )
    transition.to( levelFiveGradient, { time=500, x = display.contentWidth-36, width = 20,onComplete=function() 
        --print("done")
      end, tag="animation" } )

	--setStars(levelSelect, 144)
  --   if (gameSettings[1][levelSelect][2] ~= 0 and gameSettings[1][levelSelect][2] ~= nil) then
  --   setSavedStars (gameSettings[1][levelSelect][2])
  -- end
  -- print("level high score: " .. gameSettings[1][levelSelect][1])
  end

  local function onTapLevel3 ( event )
    star1.alpha = 0
    star2.alpha = 0
    star3.alpha = 0 
        if (levelTitle ~= nil and objectives ~= nil) then
      transition.to( levelTitle, { time=200, alpha=0} )
      transition.to( objectives, { time=200, alpha=0} )
    end

    transition.to( levelOneBlack, { time=500, x = 38, width = 22,onComplete=function() 
        --print("done")
      end, tag="animation" } )
    transition.to( levelOneGradient, { time=500, x = 38, width = 20,onComplete=function() 
        --levelonepressed = true
      end, tag="animation" } )

    transition.to( levelTwoBlack, { time=500, x = 62, width = 22,onComplete=function() 
        --print("done")
      end, tag="animation" } )
    transition.to( levelTwoGradient, { time=500, x = 62, width = 20,onComplete=function() 
        --print("done")
      end, tag="animation" } )

    transition.to( levelThreeBlack, { time=500, x = display.contentWidth/2, width = display.contentWidth-150,onComplete=function() 
        --print("done")
      end, tag="animation" } )
    transition.to( levelThreeGradient, { time=500, x = display.contentWidth/2, width = display.contentWidth-152,onComplete=function() 
    if (levelTitle ~= nil and objectives ~= nil) then
      transition.to( levelTitle, { time=200, alpha=1} )
      transition.to( objectives, { time=200, alpha=1} )
    end

    levelTitle.text = "Step 3: Food Surprise"
    levelTitle:setFillColor( black )
    levelTitle.x = display.contentWidth/2
    levelTitle.y = 100
    objectives.text = "Objectives: Make one Steak Omelette"
    objectives:setFillColor( black )
    objectives.x = display.contentWidth/2
    objectives.y = 150
    levelSelect = 3   
    setStars(levelSelect, display.contentWidth/2) 
      end, tag="animation" } )

    transition.to( levelFourBlack, { time=500, x = display.contentWidth-60, width = 22,onComplete=function() 
        --print("done")
      end, tag="animation" } )
    transition.to( levelFourGradient, { time=500, x = display.contentWidth-60, width = 20,onComplete=function() 
       -- print("done")
      end, tag="animation" } )

    transition.to( levelFiveBlack, { time=500, x = display.contentWidth-36, width = 22,onComplete=function() 
       -- print("done")
      end, tag="animation" } )
    transition.to( levelFiveGradient, { time=500, x = display.contentWidth-36, width = 20,onComplete=function() 
        --print("done")
      end, tag="animation" } )

	--setStars(levelSelect, 237)
  --   if (gameSettings[1][levelSelect][2] ~= 0 and gameSettings[1][levelSelect][2] ~= nil) then
  --   setSavedStars (gameSettings[1][levelSelect][2])
  -- end
  -- print("level high score: " .. gameSettings[1][levelSelect][1])
  end

  local function onTapLevel4 ( event )
    star1.alpha = 0
    star2.alpha = 0
    star3.alpha = 0 
    if (levelTitle ~= nil and objectives ~= nil) then
      transition.to( levelTitle, { time=200, alpha=0} )
      transition.to( objectives, { time=200, alpha=0} )
    end

    transition.to( levelOneBlack, { time=500, x = 38, width = 22,onComplete=function() 
        --print("done")
      end, tag="animation" } )
    transition.to( levelOneGradient, { time=500, x = 38, width = 20,onComplete=function() 
        --levelonepressed = true
      end, tag="animation" } )

    transition.to( levelTwoBlack, { time=500, x = 62, width = 22,onComplete=function() 
        --print("done")
      end, tag="animation" } )
    transition.to( levelTwoGradient, { time=500, x = 62, width = 20,onComplete=function() 
        --print("done")
      end, tag="animation" } )

    transition.to( levelThreeBlack, { time=500, x = 86, width = 22,onComplete=function() 
        --print("done")
      end, tag="animation" } )
    transition.to( levelThreeGradient, { time=500, x = 86, width = 20,onComplete=function() 
        --print("done")
      end, tag="animation" } )

    transition.to( levelFourBlack, { time=500, x = display.contentWidth/2+24, width = display.contentWidth-150,onComplete=function() 
        --print("done")
      end, tag="animation" } )
    transition.to( levelFourGradient, { time=500, x = display.contentWidth/2+24, width = display.contentWidth-152,onComplete=function() 
    if (levelTitle ~= nil and objectives ~= nil) then
      transition.to( levelTitle, { time=200, alpha=1} )
      transition.to( objectives, { time=200, alpha=1} )
    end

    levelTitle.text = "Step 4: Certi-fried Chef"
    levelTitle:setFillColor( black )
    levelTitle.x = display.contentWidth/2+24
    levelTitle.y = 100
    objectives.text = "Objectives: Make two Fries"
    objectives:setFillColor( black )
    objectives.x = display.contentWidth/2+24
    objectives.y = 150
    levelSelect = 4 
    setStars(levelSelect, display.contentWidth/2+24)
      end, tag="animation" } )

    transition.to( levelFiveBlack, { time=500, x = display.contentWidth-36, width = 22,onComplete=function() 
       -- print("done")
      end, tag="animation" } )
    transition.to( levelFiveGradient, { time=500, x = display.contentWidth-36, width = 20,onComplete=function() 
        --print("done")
      end, tag="animation" } )
	--setStars(levelSelect, 335)
  --   if (gameSettings[1][levelSelect][2] ~= 0 and gameSettings[1][levelSelect][2] ~= nil) then
  --   setSavedStars (gameSettings[1][levelSelect][2])
  -- end
  -- print("level high score: " .. gameSettings[1][levelSelect][1])
  end

  local function onTapLevel5 ( event )
    star1.alpha = 0
    star2.alpha = 0
    star3.alpha = 0 
    if (levelTitle ~= nil and objectives ~= nil) then
      transition.to( levelTitle, { time=200, alpha=0} )
      transition.to( objectives, { time=200, alpha=0} )
    end

    transition.to( levelOneBlack, { time=500, x = 38, width = 22,onComplete=function() 
        --print("done")
      end, tag="animation" } )
    transition.to( levelOneGradient, { time=500, x = 38, width = 20,onComplete=function() 
        --levelonepressed = true
      end, tag="animation" } )

    transition.to( levelTwoBlack, { time=500, x = 62, width = 22,onComplete=function() 
        --print("done")
      end, tag="animation" } )
    transition.to( levelTwoGradient, { time=500, x = 62, width = 20,onComplete=function() 
        --print("done")
      end, tag="animation" } )

    transition.to( levelThreeBlack, { time=500, x = 86, width = 22,onComplete=function() 
        --print("done")
      end, tag="animation" } )
    transition.to( levelThreeGradient, { time=500, x = 86, width = 20,onComplete=function() 
        --print("done")
      end, tag="animation" } )

    transition.to( levelFourBlack, { time=500, x = 110, width = 22,onComplete=function() 
        --print("done")
      end, tag="animation" } )
    transition.to( levelFourGradient, { time=500, x = 110, width = 20,onComplete=function() 
       -- print("done")
      end, tag="animation" } )

    transition.to( levelFiveBlack, { time=500, x = display.contentWidth/2+50, width = display.contentWidth-150,onComplete=function() 
       -- print("done")
      end, tag="animation" } )
    transition.to( levelFiveGradient, { time=500, x = display.contentWidth/2+50, width = display.contentWidth-152,onComplete=function() 
    if (levelTitle ~= nil and objectives ~= nil) then
      transition.to( levelTitle, { time=200, alpha=1} )
      transition.to( objectives, { time=200, alpha=1} )
    end

    levelTitle.text = "Secret Level: ???"
    levelTitle:setFillColor( black )
    levelTitle.x = display.contentWidth/2+50
    levelTitle.y = 100
    objectives.text = "Objectives: ???"
    objectives:setFillColor( black )
    objectives.x = display.contentWidth/2+50
    objectives.y = 150
    levelSelect = 5
    setStars(levelSelect, display.contentWidth/2+50)
      end, tag="animation" } )

	--setStars(levelSelect, 425)
  --   if (gameSettings[1][levelSelect][2] ~= 0 and gameSettings[1][levelSelect][2] ~= nil) then
  --   setSavedStars (gameSettings[1][levelSelect][2])
  -- end
  -- print("level high score: " .. gameSettings[1][levelSelect][1])
  end  

      -- to get to recipe book.
  local function onTapBookIcon( event )
    recipeBook: removeSelf()
    recipeBook = nil
    recipeBook = display.newImageRect( "images/book2.png", 75, 75 )
    recipeBook.x = 100
    recipeBook.y = 40
  group:insert(recipeBook)
    timer.performWithDelay(700, function()
      storyboard.removeScene( scene )
      storyboard.gotoScene( "scenes.scene_book", {effect = "fade", time = 500})
    storyboard.showOverlay("scenes.overlay_backButton", {effect = "fade", time = 500})
      end)
    --storyboard.removeScene( scene )
    -- storyboard.gotoScene( "scenes.scene_book", {effect = "fade", time = 500})
    -- storyboard.showOverlay("scenes.overlay_backButton", {effect = "fade", time = 500})
  end

  -- to get to the store
  local function onTapStoreButton( event )
    itemShop: removeSelf( )
    itemShop = nil
    itemShop = display.newImageRect( "images/pantry2.png", 50, 50 )
    itemShop.x = 360
    itemShop.y = 30
    group:insert(itemShop)
  timer.performWithDelay(700, function()
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.scene_store", {effect = "fade", time = 500})
    storyboard.showOverlay("scenes.overlay_backButton", {effect = "fade", time = 500})
      end)
    -- storyboard.removeScene( scene )
    -- storyboard.gotoScene( "scenes.scene_store", {effect = "fade", time = 500})
    -- storyboard.showOverlay("scenes.overlay_backButton", {effect = "fade", time = 500})
  end

-- RETURNS ALL GRADIENTS ON THE SCREEN TO THE ORIGINAL SIZE--
  local function resetlevelSelect ( event )
    if (levelTitle ~= nil and objectives ~= nil) then
      transition.to( levelTitle, { time=200, alpha=0} )
      transition.to( objectives, { time=200, alpha=0} )
    end
    star1.alpha = 0
    star2.alpha = 0
    star3.alpha = 0

    transition.to( levelOneBlack, { time=500, x = 56, width = 62, y = display.contentHeight*(3/5), height = display.contentHeight-98, onComplete=function() 
        --print("done")
      end, tag="animation" } )
    transition.to( levelOneGradient, { time=500, x = 56, width = 60, y = display.contentHeight*(3/5), height = display.contentHeight-100, onComplete=function() 
        --levelonepressed = true
      end, tag="animation" } )

    transition.to( levelTwoBlack, { time=500, x = 144, width = 62, y = display.contentHeight*(3/5), height = display.contentHeight-98, onComplete=function() 
        --print("done")
      end, tag="animation" } )
    transition.to( levelTwoGradient, { time=500, x = 144, width = 60, y = display.contentHeight*(3/5), height = display.contentHeight-100, onComplete=function() 
        --print("done")
      end, tag="animation" } )

    transition.to( levelThreeBlack, { time=500, x = 237, width = 62, y = display.contentHeight*(3/5), height = display.contentHeight-98, onComplete=function() 
        --print("done")
      end, tag="animation" } )
    transition.to( levelThreeGradient, { time=500, x = 237, width = 60, y = display.contentHeight*(3/5), height = display.contentHeight-100, onComplete=function() 
        --print("done")
      end, tag="animation" } )

    transition.to( levelFourBlack, { time=500, x = 335, width = 62, y = display.contentHeight*(3/5), height = display.contentHeight-98,onComplete=function() 
        --print("done")
      end, tag="animation" } )
    transition.to( levelFourGradient, { time=500, x = 335, width = 60, y = display.contentHeight*(3/5), height = display.contentHeight-100,onComplete=function() 
       -- print("done")
      end, tag="animation" } )

    transition.to( levelFiveBlack, { time=500, x = 425, width = 62, y = display.contentHeight*(3/5), height = display.contentHeight-98,onComplete=function() 
       -- print("done")
      end, tag="animation" } )
    transition.to( levelFiveGradient, { time=500, x = 425, width = 60, y = display.contentHeight*(3/5), height = display.contentHeight-100,onComplete=function() 
      end, tag="animation" } )

  end  


--ADD EVENT LISTENERS --
  levelOneGradient:addEventListener("tap", onTapLevel1)
  levelTwoGradient:addEventListener("tap", onTapLevel2)
  levelThreeGradient:addEventListener("tap", onTapLevel3)
  levelFourGradient:addEventListener("tap", onTapLevel4)
  levelFiveGradient:addEventListener("tap", onTapLevel5)

  recipeBook:addEventListener( "tap", onTapBookIcon )
  itemShop:addEventListener( "tap", onTapStoreButton )
  resetScreen:addEventListener( "tap", resetlevelSelect )




  local function onTapStartLevel (event)
	if( levelSelect < 5 or ( levelSelect == 5  and worlds[1].levelsUnlocked[5] ) ) then
		storyboard.removeScene( scene )
		storyboard.gotoScene( "scenes.scene_ingame", { effect = "fade", time = 250, params = {level = levelSelect, world = 1}})
	end
  end
  
  levelStart:addEventListener("tap", onTapStartLevel)

  -- local function onTapBackArrow (event)
  --   storyboard.removeScene(scene)
  --   storyboard.gotoScene("scenes.scene_worldmap", {effect = "fade", time = 250})
  -- end

  -- backArrow:addEventListener("tap", onTapBackArrow)
  --onTapLevel1()
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