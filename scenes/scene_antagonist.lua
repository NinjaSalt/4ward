---------------------------------------------------------------------------------
-- PAUSE SCENE
-- Scene notes go here

---------------------------------------------------------------------------------
require("classes.items")
require("classes.enemies")
require("classes.audioClass")
local sfx = require("classes.sfx")
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local globals= require ("classes.globals") 

local antagonistAbility = math.random(1,4)
local isCake = false

--Enemy made from random combo
local newEnemy

--Enemies that were swapped
local randomEne1
local randomEne2

-- Clear previous scene
storyboard.removeAll()

-- local forward references should go here --

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:createScene( event )
storyboard.showOverlay("scenes.scene_hud")

local group = self.view

if( table.maxn( allEne ) < 2 )then
	antagonistAbility = math.random(3,4)
end

	if (antagonistAbility~=4) then
		globals.notDurningAntagonist = false
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
		for n=0, 2, 1 do
		globals.belts[n]:pause()
		end
		transition.pause("animation")
	end

local bkg = display.newRect( centerX, centerY, display.contentWidth, display.contentHeight )
bkg.alpha = 0.01
bkg:setFillColor( gray)
bkg:addEventListener("touch", function() return true end)
bkg:addEventListener("tap", function() return true end)
group:insert (bkg)



--local textBoxOutline = display.newRect( centerX, 35, 130, 65 )
--textBoxOutline:setFillColor( black )
--group:insert(textBoxOutline)
--local textBox = display.newRect( centerX, 35, 130, 60 )
local textBox = display.newImage("images/speechBubble.png", centerX-20, 45, true)
textBox.height = 80
group:insert(textBox)

--transition.to( textBox, { time= 2000, x= centerX, transition=easing.inCubic } )

local speech = display.newText( "", 0, 0, globals.IMPRIMA, 36 )
if ( antagonistAbility == 1 ) then
	speech.text = "SURPRISE COMBO!"
	textBox.width=speech.width+30
	--textBoxOutline.width=speech.width+20
elseif ( antagonistAbility == 2 ) then
	playSFX (sfx.audioSupriseSwap, 1)
	speech.text = "SURPRISE SWAP!"
	textBox.width=speech.width+30
	--textBoxOutline.width=speech.width+20
elseif ( antagonistAbility == 3 ) then
	playSFX (sfx.audioCakeAttack, 1)
	speech.text = "CAKE ATTACK!"
	textBox.width=speech.width+30
	--textBoxOutline.width=speech.width+20
elseif ( antagonistAbility == 4 ) then
	playSFX (sfx.audioMashPotato, 1)
	speech.text = "MASH THAT POTATO!"
	textBox.width=speech.width+30
	--textBoxOutline.width=speech.width+20
end

speech:setFillColor(black)
speech.x = textBox.x
speech.y = textBox.y
group:insert( speech )

local antagonist = display.newImage( "images/antag_Coat.png", 400, centerY+20, true )
antagonist.height = antagonist.height/5
antagonist.width = antagonist.width/5
group:insert(antagonist)

local function resume()
	storyboard.hideOverlay()
end

if ( antagonistAbility == 1 ) then
	if ( table.maxn( allEne ) > 0 ) then
		local numFoodItems
		for i = 1, table.maxn( items ) do
			if(items[i].itemType ~= "foodType") then break end
			numFoodItems = i
		end
		local randomEnemy = math.random(1, table.maxn( allEne ))
		local randomFoodItem = math.random(1, numFoodItems)
		local enemyX=allEne[randomEnemy].x
		local enemyY=allEne[randomEnemy].y
		local basicItem = display.newImage(items[randomFoodItem].image, centerX, centerY)
		basicItem.width = 50
		basicItem.height = 50
		basicItem.alpha = 0
		transition.to( basicItem, { time=800, alpha=1 } )
		--Will be called when we want to end the scene after the enemy has made it to the center of the screen
		local function finish ()
			transition.to( antagonist, { time=500, x=700 } )
			--create smoke where the enemy is
			local smoke = display.newImage( "images/smoke.png", allEne[randomEnemy].x, allEne[randomEnemy].y, true )
			transition.to( smoke, { time=1500, alpha=0, onComplete=function() smoke:removeSelf()end } )
			basicItem:removeSelf()
			--make the new enemy 
			newEnemy = itemCombo(items[randomFoodItem], allEne[randomEnemy], false)
			--move the enemy back
			local function moveBack()
				transition.to( newEnemy, { time=1200, x=enemyX, y=enemyY, onComplete= function() 
					--transition.to( newEnemy, { time=(moveSpeed(newEnemy.x, newEnemy.speed, newEnemy.y)), x=(50), tag="animation" } )
                                        resume()
				end} )
			end
			--call the move back with a delay
			timer.performWithDelay( 300, moveBack  )
		end
		--Move the enemy to the center of the screen
	transition.to( allEne[randomEnemy], { time=1200, x=centerX, y=centerY, onComplete=finish } )
	end
        elseif ( antagonistAbility == 2 ) then
		local function moveAntagonist()
			transition.to( antagonist, { time=500, x=700 } )
		end
                
                local function producerSwap()
  		randomEne1 = math.random(1, table.maxn( allEne  ) )
  		randomEne2 = math.random(1, table.maxn( allEne  ) )
  		while (randomEne1 == randomEne2) do
  			randomEne1 = math.random(1, table.maxn( allEne  ) )
  			randomEne2 = math.random(1, table.maxn( allEne  ) )
  		end
  		local randomEne1X = allEne[randomEne1].x
  		local randomEne2X = allEne[randomEne2].x
  		local randomEne1Y = allEne[randomEne1].y
  		local randomEne2Y = allEne[randomEne2].y
  		
  		local smoke1 = display.newImage( "images/smoke.png", allEne[randomEne1].x, allEne[randomEne1].y, true )
  		transition.to( smoke1, { time=1500, alpha=0, onComplete=function() smoke1:removeSelf()end } )
  		
  		local smoke2 = display.newImage( "images/smoke.png", allEne[randomEne2].x, allEne[randomEne2].y, true )
  		transition.to( smoke2, { time=1500, alpha=0, onComplete=function() smoke2:removeSelf()end } )
                
  		transition.to(allEne[randomEne1], { time= 2000,  x = randomEne2X, y = randomEne2Y})
  		transition.to(allEne[randomEne2], { time= 2000,  x = randomEne1X, y = randomEne1Y})
  	end
  
  
		timer.performWithDelay( 1000, producerSwap  )
		timer.performWithDelay( 2000, moveAntagonist  )
		timer.performWithDelay( 3000, resume )
	elseif ( antagonistAbility == 3 ) then
		isCake = true
		timer.performWithDelay( 2000, resume )
	elseif ( antagonistAbility == 4 ) then
		transition.to( bkg, { time=500, alpha=.5 } )
		local boxOutline = display.newRect( display.contentWidth/2, 170, 190, 160 )
		boxOutline:setFillColor( black )
		group:insert(boxOutline)
		local box = display.newRect( display.contentWidth/2, 170, 180, 150 )
		group:insert(box)
		local potato = display.newImage(myEnemies[5].image, centerX, centerY)
		potato.width = 100
		potato.height = 100
		group:insert(potato)
		local mashCount = 0
		
		
		local function mash()
			local flashPotato = display.newImage("images/flashPotato.png",potato.x, potato.y,true)
			flashPotato.width = 100
			flashPotato.height = 100
			transition.to( flashPotato, { time=100, alpha=0, onComplete=function() flashPotato:removeSelf()end } )
			mashCount=mashCount+1
			if ( mashCount > 10 ) then
				local smoke = display.newImage( "images/comboPoof.png", potato.x, potato.y, true )
				transition.to( smoke, { time=500, alpha=0, onComplete=function() smoke:removeSelf()end } )
				potato:removeSelf()
				mashedPotato = display.newImage(comboEnemies[7].image, centerX, centerY)
				mashedPotato.width = 100
				mashedPotato.height = 100
				group:insert(mashedPotato)
				timer.performWithDelay( 500, resume )
			end
		end
		--potato:addEventListener("touch", mash)
		potato:addEventListener("tap", mash)
		
	end
	
	



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
	
	
end

-- Called AFTER scene has finished moving offscreen:
function scene:didExitScene( event )
local group = self.view
--timer.resume(attackTimer)
print (antagonistAbility)
if antagonistAbility == 1 then
    transition.to( newEnemy, { time=(moveSpeed(newEnemy.x, newEnemy.speed, newEnemy.y)), x=(50), tag="animation" } )
end

if antagonistAbility == 2 then
    transition.to( allEne[randomEne1], { time=(moveSpeed(allEne[randomEne1].x, allEne[randomEne1].speed, allEne[randomEne1].y)), x=(50), tag="animation" } )
    transition.to( allEne[randomEne2], { time=(moveSpeed(allEne[randomEne2].x, allEne[randomEne2].speed, allEne[randomEne2].y)), x=(50), tag="animation" } )
end

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
storyboard.showOverlay("scenes.scene_hud")
if ( isCake ) then storyboard.showOverlay("scenes.scene_foodOnScreen") end
globals.notDurningAntagonist = true
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