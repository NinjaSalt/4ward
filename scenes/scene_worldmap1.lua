---------------------------------------------------------------------------------
-- SCENE NAME
-- Scene notes go here
---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
require("classes.enemies") 
local scene = storyboard.newScene()
local globals = require("classes.globals")
local widget = require( "widget" )
require("classes.level")
local loadsave = require("classes.loadsave")
require("classes.levelUnlocking")

 
-- Clear previous scene
storyboard.removeAll()

  gameSettings = loadsave.loadTable("gamesettings.json")

 
-- local forward references should go here --
 
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view

  local levelSelect = 1
  local levelButtons = {}
  levels_1 = {}
  levels_2 = {}
  levels_3 = {}
  local levelStars_1 = {}
  local levelStars_2 = {}
  local levelStars_3 = {}

  local selectedLevel = Level.load(1, levelSelect)
  
  local bkg = display.newImage( "images/inbetween1.png", centerX, centerY, true )
  bkg.height=display.contentHeight; bkg.width=display.contentWidth
  group:insert (bkg)

  -- local banner = display.newImageRect( "images/bannerBlue.png", 200, 80 )
  -- banner.x = 236
  -- banner.y = 45
  -- group:insert(banner)

  local titleText = {
    text = "On The Set",   
    x = 236,
    y = 40,
    width = display.contentWidth-152,     --required for multi-line and alignment
    font = globals.LOBSTERTWO,   
    fontSize = 35,
    align = "center"  --new alignment parameter
  }

  -- SETS TITLE
  local title = display.newText(titleText)
  title:setFillColor( black )  
  group:insert(title)

  -- SETS PANTRY BUTTON
  local itemShop = display.newImageRect( "images/pantry.png", 80, 80 )
  itemShop.x = 370
  itemShop.y = 40
  group:insert(itemShop)

  -- SETS BOOK BUTTON
  local recipeBook = display.newImageRect( "images/book.png", 100, 100 )
  recipeBook.x = 100
  recipeBook.y = 40
  group:insert(recipeBook)

  -- SETS BACK ARROW
  local levelBack = display.newImageRect( "images/levelback.png", 320, 200 )
  levelBack.x = display.contentWidth/2
  levelBack.y = display.contentHeight/2 + 60
  group:insert(levelBack)

  -- local star1=  display.newImageRect( "images/star_gray.png", 30, 30 )
  -- star1.x = 115
  -- star1.y = 160
  -- group:insert(star1)

  -- local star2=  display.newImageRect( "images/star_gray.png", 30, 30 )
  -- star2.x = 115
  -- star2.y = 200
  -- group:insert(star2)

  -- local star3=  display.newImageRect( "images/star_gray.png", 30, 30 )
  -- star3.x = 115
  -- star3.y = 240
  -- group:insert(star3)

  -- Create the widget
  local scrollView = widget.newScrollView{
  --left = 0,
  --top = 100,
   y = 110,
   x = display.contentWidth/2,
    width = display.contentWidth - 60,
    height = 60,
    topPadding = 25,
    bottomPadding = 0,
    leftPadding = 0,
    rightPadding = 50,
    hideBackground = true,
    horizontalScrollDisabled = false,
    verticalScrollDisabled = true,
    --backgroundColor = { 0.7373, 0.5608, 0.5608 },
    --listener = scrollListener
  }
  group:insert( scrollView)

  --tables of all the buttons
  levelButtons = {display.newImageRect( "images/world1/w1level1.png", 50, 50 ), display.newImageRect( "images/world1/w1level2.png", 50, 50 ), display.newImageRect( "images/world1/w1level3.png", 50, 50 ), 
            display.newImageRect( "images/world1/w1level4.png", 50, 50 ), display.newImageRect( "images/world1/w1level5.png", 50, 50 ), display.newImageRect( "images/world1/w1level6.png", 50, 50 ), 
            display.newImageRect( "images/world1/w1level7.png", 50, 50 ), display.newImageRect( "images/world1/w1level8.png", 50, 50 ), display.newImageRect( "images/world1/w1level9.png", 50, 50 ), 
            display.newImageRect( "images/world1/w1level10.png", 50, 50 )}

  levels_1 = {display.newImageRect( "images/world1/1star/w1level1_1.png", 50, 50 ), display.newImageRect( "images/world1/1star/w1level2_1.png", 50, 50 ), display.newImageRect( "images/world1/1star/w1level3_1.png", 50, 50 ), 
            display.newImageRect( "images/world1/1star/w1level4_1.png", 50, 50 ), display.newImageRect( "images/world1/1star/w1level5_1.png", 50, 50 ), display.newImageRect( "images/world1/1star/w1level6_1.png", 50, 50 ), 
            display.newImageRect( "images/world1/1star/w1level7_1.png", 50, 50 ), display.newImageRect( "images/world1/1star/w1level8_1.png", 50, 50 ), display.newImageRect( "images/world1/1star/w1level9_1.png", 50, 50 ), 
            display.newImageRect( "images/world1/1star/w1level10_1.png", 50, 50 )}

  levels_2 = {display.newImageRect( "images/world1/2star/w1level1_2.png", 50, 50 ), display.newImageRect( "images/world1/2star/w1level2_2.png", 50, 50 ), display.newImageRect( "images/world1/2star/w1level3_2.png", 50, 50 ), 
            display.newImageRect( "images/world1/2star/w1level4_2.png", 50, 50 ), display.newImageRect( "images/world1/2star/w1level5_2.png", 50, 50 ), display.newImageRect( "images/world1/2star/w1level6_2.png", 50, 50 ), 
            display.newImageRect( "images/world1/2star/w1level7_2.png", 50, 50 ), display.newImageRect( "images/world1/2star/w1level8_2.png", 50, 50 ), display.newImageRect( "images/world1/2star/w1level9_2.png", 50, 50 ), 
            display.newImageRect( "images/world1/2star/w1level10_2.png", 50, 50 )}

  levels_3 = {display.newImageRect( "images/world1/3star/w1level1_3.png", 50, 50 ), display.newImageRect( "images/world1/3star/w1level2_3.png", 50, 50 ), display.newImageRect( "images/world1/3star/w1level3_3.png", 50, 50 ), 
            display.newImageRect( "images/world1/3star/w1level4_3.png", 50, 50 ), display.newImageRect( "images/world1/3star/w1level5_3.png", 50, 50 ), display.newImageRect( "images/world1/3star/w1level6_3.png", 50, 50 ), 
            display.newImageRect( "images/world1/3star/w1level7_3.png", 50, 50 ), display.newImageRect( "images/world1/3star/w1level8_3.png", 50, 50 ), display.newImageRect( "images/world1/3star/w1level9_3.png", 50, 50 ), 
            display.newImageRect( "images/world1/3star/w1level10_3.png", 50, 50 )}

  levelStars_1 = {display.newImageRect( "images/star_gray.png", 30, 30 ), display.newImageRect( "images/star_gray.png", 30, 30 ), display.newImageRect( "images/star_gray.png", 30, 30 ), 
            display.newImageRect( "images/star_gray.png", 30, 30 ), display.newImageRect( "images/star_gray.png", 30, 30 ), display.newImageRect( "images/star_gray.png", 30, 30 ), 
            display.newImageRect( "images/star_gray.png", 30, 30 ), display.newImageRect( "images/star_gray.png", 30, 30 ), display.newImageRect( "images/star_gray.png", 30, 30 ), 
            display.newImageRect( "images/star_gray.png", 30, 30 )}

  levelStars_2 = {display.newImageRect( "images/star_gray.png", 30, 30 ), display.newImageRect( "images/star_gray.png", 30, 30 ), display.newImageRect( "images/star_gray.png", 30, 30 ), 
            display.newImageRect( "images/star_gray.png", 30, 30 ), display.newImageRect( "images/star_gray.png", 30, 30 ), display.newImageRect( "images/star_gray.png", 30, 30 ), 
            display.newImageRect( "images/star_gray.png", 30, 30 ), display.newImageRect( "images/star_gray.png", 30, 30 ), display.newImageRect( "images/star_gray.png", 30, 30 ), 
            display.newImageRect( "images/star_gray.png", 30, 30 )}    

  levelStars_3 = {display.newImageRect( "images/star_gray.png", 30, 30 ), display.newImageRect( "images/star_gray.png", 30, 30 ), display.newImageRect( "images/star_gray.png", 30, 30 ), 
            display.newImageRect( "images/star_gray.png", 30, 30 ), display.newImageRect( "images/star_gray.png", 30, 30 ), display.newImageRect( "images/star_gray.png", 30, 30 ), 
            display.newImageRect( "images/star_gray.png", 30, 30 ), display.newImageRect( "images/star_gray.png", 30, 30 ), display.newImageRect( "images/star_gray.png", 30, 30 ), 
            display.newImageRect( "images/star_gray.png", 30, 30 )}        


  local function loadStars (level)
    if (gameSettings[1][level][2] ~=nil) then
      if (gameSettings[1][level][2] > globals.stars[1][level]) then
        globals.stars[1][level] = gameSettings[1][level][2]
      end
    end
  end

  -- sets all the level buttons
  for i=1, table.maxn( levelButtons ) do
    if (levels_1[i] ~=nil and levels_2[i] ~= nil and levels_3[i] ~= nil) then
      --sets their alpha to 0 until they are called
      levels_1[i].alpha = 0
      levels_2[i].alpha = 0
      levels_3[i].alpha = 0
      group:insert(levels_1[i])
      group:insert(levels_2[i])
      group:insert(levels_3[i])
    end
    levelButtons[i].x = 55*i
    loadStars(i)
    if (globals.stars[1][i]~= nil) then
      if (globals.stars[1][i] == 0) then
        --sets the button to have 1 star
        levelButtons[i]:removeSelf( )
        levelButtons[i] = nil
        --levels_1[i].alpha = 1
        levelButtons[i] = display.newImageRect( "images/world1/w1level" .. i .. ".png", 50, 50 )
        levelButtons[i].x = 55*i
      end
       if (globals.stars[1][i] >= 1) then
        --sets the button to have 1 star
        levelButtons[i]:removeSelf( )
        levelButtons[i] = nil
        levels_1[i].alpha = 1
        levelButtons[i] = levels_1[i]
        levelButtons[i].x = 55*i
      end
      if (globals.stars[1][i] >= 2) then
        --sets the button to have 2 stars
        levelButtons[i]:removeSelf( )
        levelButtons[i] = nil
        levels_2[i].alpha = 1
        levelButtons[i] = levels_2[i]
        levelButtons[i].x = 55*i
      end
      if (globals.stars[1][i] >= 3) then
        --sets the button to have 3 stars
        levelButtons[i]:removeSelf( )
        levelButtons[i] = nil
        levels_3[i].alpha = 1
        levelButtons[i] = levels_3[i]
        levelButtons[i].x = 55*i
      end
    end
    scrollView:insert(  levelButtons[i] )
  end

--for the stars to show objectives and sets to alpha until they are called
  for i=1, table.maxn( levelStars_1 ) do
    if (levelStars_1[i] ~=nil) then
      levelStars_1[i].alpha = 0
      group:insert(levelStars_1[i])
    end
  end
  for i=1, table.maxn( levelStars_2 ) do
    if (levelStars_2[i] ~=nil) then
      levelStars_2[i].alpha = 0
      group:insert(levelStars_2[i])
    end
  end
  for i=1, table.maxn( levelStars_3 ) do
    if (levelStars_3[i] ~=nil) then
      levelStars_3[i].alpha = 0
      group:insert(levelStars_3[i])
    end
  end

  local levelStart = display.newImageRect( "images/startButton.png", 40, 40 )
  levelStart.x = display.contentWidth/2+levelBack.width/2 - 30
  levelStart.y = display.contentHeight-25
  group:insert(levelStart)


  local levelTitleText = {
    text = "Step 1: Can you... Cook?",     
    x = display.contentWidth/2+25,
    y = display.contentHeight/2,
    width = display.contentWidth/2,     --required for multi-line and alignment
    font = globals.LOBSTERTWO,   
    fontSize = 25,
    alpha = 0,
    align = "center"  --new alignment parameter
  }

  local levelTitle = display.newText(levelTitleText)
  levelTitle:setFillColor( black )
  group:insert(levelTitle)

  local objectivesText = {
    text = "Objectives: Make a pancake!",     
    x = display.contentWidth/2 + 25,
    y = display.contentHeight/2+50,
    width = display.contentWidth/2,     --required for multi-line and alignment
    font = globals.IMPRIMA,   
    fontSize = 18,
    align = "center"  --new alignment parameter
  }

  local objectives = display.newText(objectivesText)
  objectives:setFillColor( black )
  group:insert(objectives)

  local scoreText = {
    text = "High Score: ",   
    x = display.contentWidth/2+25,
    y = display.contentHeight/2+100,
    width = display.contentWidth-152,     --required for multi-line and alignment
    font = globals.IMPRIMA,   
    fontSize = 18,
    align = "center"  --new alignment parameter
  }

  -- SETS high score text
  local highScore = display.newText(scoreText)
  highScore:setFillColor( black )  
  group:insert(highScore)

  local function setStars(level)
    --loadStars(level)
    levelStars_1[level].alpha = 1
    levelStars_1[level].x = 115
    levelStars_1[level].y = 160
    levelStars_2[level].alpha = 1
    levelStars_2[level].x = 115
    levelStars_2[level].y = 200
    levelStars_3[level].alpha = 1
    levelStars_3[level].x = 115
    levelStars_3[level].y = 240
    if (globals.stars[1][level]~= nil) then
      --sets all stars to gray if the number of stars they earned is 0 or haven't played that level yet
      if (globals.stars[1][level] == 0) then
        --levelStars_1[level]:removeSelf( )
        --levelStars_1[level] = nil
        levelStars_1[level] = display.newImageRect( "images/star_gray.png", 30, 30 )
        levelStars_1[level].x = 115
        levelStars_1[level].y = 160
        group:insert(levelStars_1[level])
        levelStars_2[level] = display.newImageRect( "images/star_gray.png", 30, 30 )
        levelStars_2[level].x = 115
        levelStars_2[level].y = 200
        group:insert(levelStars_2[level])
        levelStars_3[level] = display.newImageRect( "images/star_gray.png", 30, 30 )
        levelStars_3[level].x = 115
        levelStars_3[level].y = 240
        group:insert(levelStars_3[level])
      end
      --sets the top star to the yellow star
       if (globals.stars[1][level] >= 1) then
        --levelStars_1[level]:removeSelf( )
        --levelStars_1[level] = nil
        levelStars_1[level] = display.newImageRect( "images/star.png", 30, 30 )
        levelStars_1[level].x = 115
        levelStars_1[level].y = 160
        group:insert(levelStars_1[level])
      end
      --sets the middle star to yellow
      if (globals.stars[1][level] >= 2) then
        --levelStars_2[level]:removeSelf( )
        --levelStars_2[level] = nil
        levelStars_2[level] = display.newImageRect( "images/star.png", 30, 30 )
        levelStars_2[level].x = 115
        levelStars_2[level].y = 200
        group:insert(levelStars_2[level])
      end
      --sets the third star to yellow
      if (globals.stars[1][level] >= 3) then
        --levelStars_3[level]:removeSelf( )
        --levelStars_3[level] = nil
        levelStars_3[level] = display.newImageRect( "images/star.png", 30, 30 )
        levelStars_3[level].x = 115
        levelStars_3[level].y = 240
        group:insert(levelStars_3[level])
      end
    end
  end

  --sets the objective text to the default objective
  local function onTapStar1 ( event )
        objectives.text = "Serve all the food.";
    end

    --events for each level button
   local function onTapLevel1 ( event )
        levelSelect = 1
        selectedLevel = Level.load(1, levelSelect)
        levelTitle.text = selectedLevel.levelTitle;
        highScore.text = "High Score: " .. gameSettings[1][levelSelect][1];
        -- sets all the stars to 0 to clear it
        for i=1, table.maxn( levelStars_1 ) do
          levelStars_1[i].alpha = 0
          levelStars_2[i].alpha = 0
          levelStars_3[i].alpha = 0
        end
        onTapStar1()
        --places the appropriate representation of stars
       setStars(levelSelect)
    end
    local function onTapLevel2 ( event )
        levelSelect = 2
        selectedLevel = Level.load(1, levelSelect)
       levelTitle.text = selectedLevel.levelTitle;
       highScore.text = "High Score: " .. gameSettings[1][levelSelect][1];
        for i=1, table.maxn( levelStars_1 ) do
          levelStars_1[i].alpha = 0
          levelStars_2[i].alpha = 0
          levelStars_3[i].alpha = 0
        end
        onTapStar1()
        setStars(levelSelect)
    end
    local function onTapLevel3 ( event )
        levelSelect = 3
        selectedLevel = Level.load(1, levelSelect)
        levelTitle.text = selectedLevel.levelTitle;
        highScore.text = "High Score: " .. gameSettings[1][levelSelect][1];
        for i=1, table.maxn( levelStars_1 ) do
          levelStars_1[i].alpha = 0
          levelStars_2[i].alpha = 0
          levelStars_3[i].alpha = 0
        end
        onTapStar1()
        setStars(levelSelect)
    end
    local function onTapLevel4 ( event )
        levelSelect = 4
        selectedLevel = Level.load(1, levelSelect)
        levelTitle.text = selectedLevel.levelTitle;
        highScore.text = "High Score: " .. gameSettings[1][levelSelect][1];
        for i=1, table.maxn( levelStars_1 ) do
          levelStars_1[i].alpha = 0
          levelStars_2[i].alpha = 0
          levelStars_3[i].alpha = 0
        end
        onTapStar1()
        setStars(levelSelect)
    end
    local function onTapLevel5 ( event )
        levelSelect = 5
        selectedLevel = Level.load(1, levelSelect)
       levelTitle.text = selectedLevel.levelTitle;
       highScore.text = "High Score: " .. gameSettings[1][levelSelect][1];
        for i=1, table.maxn( levelStars_1 ) do
          levelStars_1[i].alpha = 0
          levelStars_2[i].alpha = 0
          levelStars_3[i].alpha = 0
        end
        onTapStar1()
       setStars(levelSelect)
    end
    local function onTapLevel6 ( event )
        levelSelect = 6
        selectedLevel = Level.load(1, levelSelect)
       levelTitle.text = selectedLevel.levelTitle;
       highScore.text = "High Score: " .. gameSettings[1][levelSelect][1];
        for i=1, table.maxn( levelStars_1 ) do
          levelStars_1[i].alpha = 0
          levelStars_2[i].alpha = 0
          levelStars_3[i].alpha = 0
        end
        onTapStar1()
        setStars(levelSelect)
    end
    local function onTapLevel7 ( event )
        levelSelect = 7
        selectedLevel = Level.load(1, levelSelect)
        levelTitle.text = selectedLevel.levelTitle;
        highScore.text = "High Score: " .. gameSettings[1][levelSelect][1];
        for i=1, table.maxn( levelStars_1 ) do
          levelStars_1[i].alpha = 0
          levelStars_2[i].alpha = 0
          levelStars_3[i].alpha = 0
        end
        onTapStar1()
        setStars(levelSelect)
    end
    local function onTapLevel8 ( event )
        levelSelect = 8
        selectedLevel = Level.load(1, levelSelect)
       levelTitle.text = selectedLevel.levelTitle;
       highScore.text = "High Score: " .. gameSettings[1][levelSelect][1];
        for i=1, table.maxn( levelStars_1 ) do
          levelStars_1[i].alpha = 0
          levelStars_2[i].alpha = 0
          levelStars_3[i].alpha = 0
        end
        onTapStar1()
        setStars(levelSelect)
    end
    local function onTapLevel9 ( event )
        levelSelect = 9
        selectedLevel = Level.load(1, levelSelect)
        levelTitle.text = selectedLevel.levelTitle;
        highScore.text = "High Score: " .. gameSettings[1][levelSelect][1];
        for i=1, table.maxn( levelStars_1 ) do
          levelStars_1[i].alpha = 0
          levelStars_2[i].alpha = 0
          levelStars_3[i].alpha = 0
        end
        onTapStar1()
        setStars(levelSelect)
    end
    local function onTapLevel10 ( event )
        levelSelect = 10
        selectedLevel = Level.load(1, levelSelect)
        levelTitle.text = selectedLevel.levelTitle;
        highScore.text = "High Score: " .. gameSettings[1][levelSelect][1];
        for i=1, table.maxn( levelStars_1 ) do
          levelStars_1[i].alpha = 0
          levelStars_2[i].alpha = 0
          levelStars_3[i].alpha = 0
        end
        onTapStar1()
        setStars(levelSelect)
    end

    --sets the objective text to the second objective wheb the second star is tapped
    local function onTapStar2 ( event )
        --checks is the victory condition is not false so then we have the objective text show it
        if (selectedLevel.victoryCondition ~= false) then
          if (selectedLevel.victoryCondition.memAmount ~= 1) then
            if (selectedLevel.victoryCondition.enemy == mashed) then
              --for purals with an 'es'
              objectives.text = "Serve " ..selectedLevel.victoryCondition.memAmount .." " ..selectedLevel.victoryCondition.enemy.name .. "es"
            else 
              --purals with 's'
              objectives.text = "Serve " ..selectedLevel.victoryCondition.memAmount .." " ..selectedLevel.victoryCondition.enemy.name .. "s"
            end
          else
            objectives.text = "Serve " ..selectedLevel.victoryCondition.memAmount .." " ..selectedLevel.victoryCondition.enemy.name
          end
          --if the victory condition is false, check if the category condition is true
        elseif (selectedLevel.victoryCondition == false and selectedLevel.categoryCondition ~= false) then
          if (selectedLevel.categoryCondition.memAmount ~= 1) then
            objectives.text = "Serve " ..selectedLevel.categoryCondition.memAmount .." " ..selectedLevel.categoryCondition.type .. " items."
          else 
            objectives.text = "Serve " ..selectedLevel.categoryCondition.memAmount .." " ..selectedLevel.categoryCondition.type .. " item."
          end
        end
    end
    --sets the objective text to the 3rd objective when the third star is tapped
    local function onTapStar3 ( event )
        --first checks if the score condition is true
        if (selectedLevel.scoreCondition ~= false) then
          objectives.text = "Score over " ..selectedLevel.scoreCondition.memScore .. " points."
          --if score condition is false, then check if category condition is true
        elseif (selectedLevel.scoreCondition == false and selectedLevel.categoryCondition ~= false) then
          if (selectedLevel.categoryCondition.memAmount ~= 1) then
            objectives.text = "Serve " ..selectedLevel.categoryCondition.memAmount .." " ..selectedLevel.categoryCondition.type .. " items."
          else 
            objectives.text = "Serve " ..selectedLevel.categoryCondition.memAmount .." " ..selectedLevel.categoryCondition.type .. " item."
          end
        end
    end

      -- to get to recipe book.
  local function onTapBookIcon( event )
    recipeBook: removeSelf()
    recipeBook = nil
    recipeBook = display.newImageRect( "images/book2.png", 100, 100 )
    recipeBook.x = 100
    recipeBook.y = 40
  group:insert(recipeBook)
    timer.performWithDelay(700, function()
      storyboard.removeScene( scene )
      storyboard.gotoScene( "scenes.scene_book", {effect = "fade", time = 500})
    storyboard.showOverlay("scenes.overlay_backButton", {effect = "fade", time = 500})
      end)
  end

  -- to get to the store
  local function onTapStoreButton( event )
    itemShop: removeSelf( )
    itemShop = nil
    itemShop = display.newImageRect( "images/pantry2.png", 80, 80 )
    itemShop.x = 370
    itemShop.y = 40
    group:insert(itemShop)
  timer.performWithDelay(700, function()
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.scene_store", {effect = "fade", time = 500})
    storyboard.showOverlay("scenes.overlay_backButton", {effect = "fade", time = 500})
      end)
  end

  recipeBook:addEventListener( "tap", onTapBookIcon )
  itemShop:addEventListener( "tap", onTapStoreButton )

  local backButton = display.newImage("images/leftArrow.png")
  backButton.x = 466 
  backButton.y = 12
  backButton.height = 20
  backButton.width = 20
  group:insert(backButton)
  
  local function onTapBack( event )
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.scene_worldmap",{ effect = "fade", time = 250})
  end

  backButton:addEventListener("tap",onTapBack)


  -- local function onTapStartLevel (event)
  -- 	if( levelSelect < 10 or ( levelSelect == 10  and worlds[1].levelsUnlocked[5] ) ) then
  -- 		storyboard.removeScene( scene )
  -- 		storyboard.gotoScene( "scenes.scene_ingame", { effect = "fade", time = 250, params = {level = levelSelect, world = 1}})
  -- 	end
  -- end

  local function onTapStartLevel (event)
    if( levelSelect < 10 or ( levelSelect == 10 --[[  and worlds[1].levelsUnlocked[10] ]]) ) then
      storyboard.removeScene( scene )
      storyboard.gotoScene( "scenes.scene_ingame", { effect = "fade", time = 250, params = {level = levelSelect, world = 1}})
    end
  end
  
  --adds all the event listeners to the level button
  levelButtons[1]:addEventListener("tap", onTapLevel1)
  levelButtons[2]:addEventListener("tap", onTapLevel2)
  levelButtons[3]:addEventListener("tap", onTapLevel3)
  levelButtons[4]:addEventListener("tap", onTapLevel4)
  levelButtons[5]:addEventListener("tap", onTapLevel5)
  levelButtons[6]:addEventListener("tap", onTapLevel6)
  levelButtons[7]:addEventListener("tap", onTapLevel7)
  levelButtons[8]:addEventListener("tap", onTapLevel8)
  levelButtons[9]:addEventListener("tap", onTapLevel9)
  levelButtons[10]:addEventListener("tap", onTapLevel10)

  --sets the listeners to the stars
  for i=1, table.maxn(levelStars_1) do
      levelStars_1[i]:addEventListener("tap", onTapStar1)
      levelStars_2[i]:addEventListener("tap", onTapStar2)
      levelStars_3[i]:addEventListener("tap", onTapStar3)
  end

  levelStart:addEventListener("tap", onTapStartLevel)
  --tells the scene to start at the first level
  onTapLevel1()
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