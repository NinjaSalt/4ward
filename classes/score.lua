-- Score Module --


local M = {} 	--create the local module table (this will hold our functions and data)
M.score = 0 	--set the initial score to 0
M.multiplier = 1

--[[fontSize — The size of the displayed score text.
font — The font used for the displayed score text.
x — The x location to draw the score display.
y — The y location to draw the score display.
maxDigits — The estimated number of the max score.
leadingZeros — true or false: do you want leading zeros?
filename — The local filename to save the score to.

If any settings aren’t specified, then we fall back to the 
reasonable defaults, in this case, 24-point Helvetica, centered 
at the top of the screen, with a maximum of 6 digits. By default, 
the local save file target is scorefile.txt, but this can be
changed to another file name.]]
function M.init( options )
	local customOptions = options or {}
	local opt = {}
	opt.fontSize = customOptions.fontSize or 24
	opt.font = customOptions.font or native.systemFontBold
	opt.x = customOptions.x or display.contentCenterX
	opt.y = customOptions.y or opt.fontSize * 0.5
	opt.maxDigits = customOptions.maxDigits or 6
	opt.leadingZeros = customOptions.leadingZeros or false
	M.filename = customOptions.filename or "currencyfile.txt"

	local prefix = ""
	if opt.leadingZeros then 
		prefix = "0"
	end
	M.format = "%" .. prefix .. opt.maxDigits .. "d"

	M.scoreText = display.newText(string.format(M.format, 0), opt.x, opt.y, opt.font, opt.fontSize)
	return M.scoreText
end

-- set the score, the display will update and overwrite the current value with the new one
function M.set( value )
	M.score = value
	M.scoreText.text = string.format(M.format, M.score)
end

--returns the current score for some other use
function M.get()
	return M.score
end

--allows us to add to the current score and update the display
--This could be extended to a subtract function, but it’s more 
--efficient to just pass a negative value to the add function.
function M.add( amount )
	M.score = M.score + amount
	M.scoreText.text = string.format(M.format, M.score)
end

function M.save()
	local path = system.pathForFile( M.filename, system.DocumentsDirectory)
    local file = io.open(path, "w")
    if file then
        local contents = tostring( M.score )
        file:write( contents )
        io.close( file )
        return true
    else
        return false
    end
end

--opens the file, reads the value into a local variable, and returns 
--it. It does not, by design, update the text value on the screen
function M.load()
    local path = system.pathForFile( M.filename, system.DocumentsDirectory)
    local contents = ""
    local file = io.open( path, "r" )
    if file then
         -- read all contents of file into a string
         local contents = file:read( "*a" )
         local score = tonumber(contents);
         io.close( file )
         return score
    end
    return nil
end

function increaseMultiplier()
	M.multiplier = M.multiplier + 1
	if M.multiplier > 10 then
		M.multiplier = 10
	end
end

function resetMultiplier()
	M.multiplier = 1
end

function getMultiplier()
	return M.multiplier
end

function calcServingScore (counter, score, multiplier)
	return (score + (counter*multiplier)*10)
end

return M
