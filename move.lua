
module(..., package.seeall)

--the teleport mechanic
function teleport( event, params )
	--set variables for what is being moved, when it is being moved and the starting y location
	local body = event.target
	local phase = event.phase
	local stage = display.getCurrentStage()
	local markY = body.y
	
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
			--if where the finger eneded is less than where the enemy began move it up if it not already in lane 1
			if myY<markY then
				if body.y ~= lane1 then
					body.y=body.y-70
				end
			--do the same as before but moving down
			elseif myY>markY then
				if body.y ~= lane4 then
					body.y=body.y+70
				end
			end
		end
	end

	return true
end

