
--module(..., package.seeall)

--the chopping mechanic
function chopping( event, params )
	--set variables for what is being moved, when it is being moved and the starting y location
	local body = event.target
	local phase = event.phase
	local stage = display.getCurrentStage()
	local markY = body.y

	--[[local slashsheetSettings ={
	width = 50,
	height = 50,
	numFrames = 4 }
	local slashsheet = graphics.newImageSheet("images/slashsheet.png",slashsheetSettings)
	local slashsequenceData = {
	--higher the time, slower it goes
	{ name = "topleft", start=1,  count=1 },
   { name = "topRight", start=2,  count=1 },   
   { name = "bottomRight", start=3,  count=1 },
   { name = "bottomLeft", start=4,  count=1 }
}
	local slash = display.newSprite(slashsheet,slashsequenceData)
	slash.x = body.x
	slash.y = body.y
	slash:play()]]
	
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
				--if where the finger ended is less than where the enemy began move it up if it not already in lane 1
				--if myY ~= nil and myY<markY then
				if (event.yStart > event.y and event.xStart > event.x) then
					--slash:setSequence( "topleft" )
					--slash:play()
					--transition.to( slash, { time=900, alpha=0, onComplete=function() slash:removeSelf() end } )
					local slash1 = display.newImage( "images/slash01.png", body.x-10, body.y, true )
					slash1.width = body.width+20
					slash1.height = body.width+20
					transition.to( slash1, { time=1000, alpha=0, onComplete=function() slash1:removeSelf() end } )
				--do the same as before but moving down
				--elseif myY ~= nil and myY>markY then
				elseif (event.yStart < event.y and event.xStart < event.x) then
					local slash1 = display.newImage( "images/slash01.png", body.x-10, body.y, true )
					slash1.width = body.width+20
					slash1.height = body.width+20
					transition.to( slash1, { time=1000, alpha=0, onComplete=function() slash1:removeSelf() end } )
					--slash:setSequence( "topRight" )
					--slash:play()
					--transition.to( slash, { time=900, alpha=0, onComplete=function() slash:removeSelf() end } )
				elseif (event.yStart < event.y and event.xStart > event.x) then
					local slash1 = display.newImage( "images/slash01.png", body.x-10, body.y, true )
					slash1.width = body.width+20
					slash1.height = body.width+20
					transition.to( slash1, { time=1000, alpha=0, onComplete=function() slash1:removeSelf() end } )
				--	slash:setSequence( "bottomRight" )
					--slash:play()
					--transition.to( slash, { time=900, alpha=0, onComplete=function() slash:removeSelf() end } )
				elseif (event.yStart > event.y and event.xStart < event.x) then
					local slash1 = display.newImage( "images/slash01.png", body.x-10, body.y, true )
					slash1.width = body.width+20
					slash1.height = body.width+20
					transition.to( slash1, { time=1000, alpha=0, onComplete=function() slash1:removeSelf() end } )
					--slash:setSequence( "bottomLeft" )
					--slash:play()
					--transition.to( slash, { time=900, alpha=0, onComplete=function() slash:removeSelf() end } )
				end
			transition.cancel(body)
			transition.to( body, { time=(moveSpeed(body.x, body.speed, body.y)), x=(50) , tag= "animation"} )

		end
	end

	return true
end

