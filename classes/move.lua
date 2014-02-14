
--module(..., package.seeall)

--the teleport mechanic
function teleport( event, params )
	--set variables for what is being moved, when it is being moved and the starting y location
	local body = event.target
	local phase = event.phase
	local stage = display.getCurrentStage()
	local markY = body.y
	local oneLaneAtATime = true
	
	if "began" == phase then
		stage:setFocus( body, event.id )
		body.isFocus = true
	elseif body.isFocus then
		if "moved" == phase then
			--when the object have been dragged set myY to where the finger ended
			myY = (event.y - event.yStart) + markY

		elseif "ended" == phase or "cancelled" == phase then
			stage:setFocus( body, nil )
			body.isFocus = false
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

		end
	end

	return true
end

