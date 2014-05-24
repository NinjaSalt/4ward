local globals = require("classes.globals")
local sfx = require("classes.sfx")
--module(..., package.seeall)

--the teleport mechanic
function teleport( event, params )
	--set variables for what is being moved, when it is being moved and the starting y location
	local body = event.target
	local phase = event.phase
	local stage = display.getCurrentStage()
	local markY = body.y
	local markX = body.x
	local oneLaneAtATime = true
	local targetHero
	if (body.y == lane1) then targetHero = hero[0]
    elseif (body.y == lane2) then targetHero = hero[1]
    elseif (body.y == lane3) then targetHero = hero[2]
	end
	
	if "began" == phase then
		stage:setFocus( body, event.id )
		body.isFocus = true
	elseif body.isFocus then
		if "moved" == phase then
			--when the object have been dragged set myY to where the finger ended
			myY = (event.y - event.yStart) + markY
			myX = (event.x - event.xStart) + markX
		elseif "ended" == phase or "cancelled" == phase then
			stage:setFocus( body, nil )
			body.isFocus = false
			if( math.abs(event.y - event.yStart) >= math.abs(event.x - event.xStart)) then
				if oneLaneAtATime == true then
					--if where the finger ended is less than where the enemy began move it up if it not already in lane 1
					--if myY ~= nil and myY<markY then
					if event.y - event.yStart < -7 then
						if body.y ~= lane1 then
							body.y=body.y-(lane2-lane1)
						end
					--do the same as before but moving down
					--elseif myY ~= nil and myY>markY then
					elseif event.y - event.yStart > 7 then
						if body.y ~= lane3 then
						body.y=body.y+(lane2-lane1)
						end
					end
				elseif oneLaneAtATime == false then
					if event.y < 80 then
						body.y = lane1
					elseif event.y < 160 then
						body.y = lane2
					else --event.y < 240 then
						body.y = lane3
					--else --if event.y < 320 then
					--	body.y = lane4
					end
				end
				transition.cancel(body)
				transition.to( body, { time=(moveSpeed(body.x, body.speed, body.y)), x=(50) , tag= "animation"} )
				
			elseif ( math.abs(event.x - event.xStart) > math.abs(event.y - event.yStart)) then
				if (event.x - event.xStart ~= 0 and event.x - event.xStart < -7) then
					if ( targetHero.laneSpeed == 2 ) then
						targetHero.laneSpeed = 1
						updateMoveSpeed(targetHero)
						globals.levers[targetHero.num]:setSequence( "fast" )
						globals.levers[targetHero.num]:play()
						playSFX (sfx.audioLaneSpeedUp, 1)
						if (targetHero.num == 0) then
							globals.belts[targetHero.num]:pause()
							frameNum1 = globals.belts[targetHero.num].frame
							breakfast_fast (targetHero.num, frameNum1)
							globals.belts[targetHero.num]:play()
						elseif (targetHero.num == 1) then
							globals.belts[targetHero.num]:pause()
							frameNum2 = globals.belts[targetHero.num].frame
							dinner_fast (targetHero.num, frameNum2)
							globals.belts[targetHero.num]:play()
						elseif (targetHero.num == 2) then
							globals.belts[targetHero.num]:pause()
							frameNum3 = globals.belts[targetHero.num].frame
							dessert_fast (targetHero.num, frameNum3)
							globals.belts[targetHero.num]:play()
						end
					elseif ( targetHero.laneSpeed == 3 ) then
						targetHero.laneSpeed = 2
						updateMoveSpeed(targetHero)
						globals.levers[targetHero.num]:setSequence( "normal" )
						globals.levers[targetHero.num]:play()
						playSFX (sfx.audioLaneSpeedUp, 1)
						if (targetHero.num == 0) then
							globals.belts[targetHero.num]:pause()
							frameNum1 = globals.belts[targetHero.num].frame
							breakfast_normal (targetHero.num, frameNum1)
							globals.belts[targetHero.num]:play()
						elseif (targetHero.num == 1) then
							globals.belts[targetHero.num]:pause()
							frameNum2 = globals.belts[targetHero.num].frame						
							dinner_normal (targetHero.num, frameNum2)
							globals.belts[targetHero.num]:play()
						elseif (targetHero.num == 2) then
							globals.belts[targetHero.num]:pause()
							frameNum3 = globals.belts[targetHero.num].frame						
							dessert_normal (targetHero.num, frameNum3)
							globals.belts[targetHero.num]:play()
						end
					end
					--right swipe makes the lanes go slower
				elseif (event.x - event.xStart ~= 0 and event.x - event.xStart > 7) then
					if ( targetHero.laneSpeed == 2 ) then
						targetHero.laneSpeed = 3
						updateMoveSpeed(targetHero)
						globals.levers[targetHero.num]:setSequence( "slow" )
						globals.levers[targetHero.num]:play()
						playSFX (sfx.audioLaneSlow, 1)
						if (targetHero.num == 0) then
							globals.belts[targetHero.num]:pause()
							frameNum1 = globals.belts[targetHero.num].frame						
							breakfast_slow (targetHero.num, frameNum1)
							globals.belts[targetHero.num]:play()
						elseif (targetHero.num == 1) then
							globals.belts[targetHero.num]:pause()
							frameNum2 = globals.belts[targetHero.num].frame						
							dinner_slow (targetHero.num, frameNum2)
							globals.belts[targetHero.num]:play()
						elseif (targetHero.num == 2) then
							globals.belts[targetHero.num]:pause()
							frameNum3 = globals.belts[targetHero.num].frame						
							dessert_slow (targetHero.num, frameNum3)
							globals.belts[targetHero.num]:play()
						end
					elseif ( targetHero.laneSpeed == 1 ) then
						targetHero.laneSpeed = 2
						updateMoveSpeed(targetHero)
						globals.levers[targetHero.num]:setSequence( "normal" )
						globals.levers[targetHero.num]:play()
						playSFX (sfx.audioLaneSlow, 1)
						if (targetHero.num == 0) then
							globals.belts[targetHero.num]:pause()
							frameNum1 = globals.belts[targetHero.num].frame						
							breakfast_normal (targetHero.num, frameNum1)
							globals.belts[targetHero.num]:play()
						elseif (targetHero.num == 1) then
							globals.belts[targetHero.num]:pause()
							frameNum2 = globals.belts[targetHero.num].frame						
							dinner_normal (targetHero.num, frameNum2)
							globals.belts[targetHero.num]:play()
						elseif (targetHero.num == 2) then
							globals.belts[targetHero.num]:pause()
							frameNum3 = globals.belts[targetHero.num].frame						
							dessert_normal (targetHero.num, frameNum3)
							globals.belts[targetHero.num]:play()
						end
					end
				--checks if the touch didn't move from original position. Meaning that it was a tap
				elseif (event.x - event.xStart == 0) then
					--useItem(targetHero)
				end
			end
		end
	end

	return true
end

