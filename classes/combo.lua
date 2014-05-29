--circle-based collision detection
require("classes.enemies")
require("classes.score")

function combination( obj1, obj2 )
   hasCollidied = false
   if ( obj1 == nil ) then  --make sure the first object exists
      return false
   end
   if ( obj2 == nil ) then  --make sure the other object exists
      return false
   end
   if ( obj1.x == nil ) then  --make sure the first object exists
      return false
   end
   if ( obj2.x == nil ) then  --make sure the other object exists
      return false
   end
   local dx = obj1.x - obj2.x
   local dy = obj1.y - obj2.y
   local distance = math.sqrt( dx*dx + dy*dy )
   local objectSize = (obj2.contentWidth/4) + (obj1.contentWidth/4)

   if ( distance < objectSize ) then
      newType = foodgroup[obj1.type][obj2.type]
	  if newType == "bad" then
		resetMultiplier()
	  else
		increaseMultiplier()
	  end
      return true
   end

   return false
end

function replaceEnemy (obj1, obj2)
      return foodgroup[obj1.type][obj2.type]
end

-- function for creating a new health based on what the two combined enemies were.
-- some adjusting of numbers may be necessary.
function newHealth (obj1, obj2)
  if (obj1~= nil and obj2~=nil) then
    -- standard combos: average of the two healths combined.
    newHealthTotal = (allEne[obj1].health + allEne[obj2].health)/2
    -- if the current combination doesn't contain a bad ingredient but will make one:
    if (foodgroup[allEne[obj1].type][allEne[obj2].type] == "bad") then
      newHealthTotal= (allEne[obj1].health + allEne[obj2].health)
    end
    -- if one OR both of the items in the current combination already is a "bad":
    if (allEne[obj1].type == "bad" and allEne[obj2].type == "bad") then
      newHealthTotal= (allEne[obj1].health + allEne[obj2].health)*2
    end
    if (allEne[obj1].type == "bad" and allEne[obj2].type ~= "bad") then
      newHealthTotal= (allEne[obj1].health + allEne[obj2].health)*1.5
    end
    if (allEne[obj1].type ~= "bad" and allEne[obj2].type == "bad") then
      newHealthTotal= (allEne[obj1].health + allEne[obj2].health)*1.5
    end
    return newHealthTotal
  end
end

-- function for calculating damage based on what row the enemy is.
-- again, damage numbers may need tweaking. it'd be nice to have globals for the location of heroes.
-- let me know if you want this in a separate file- i didn't know where
-- the best place to put this would be.
function calculateDamage (enemy_obj, bullet_obj)
  local damage = bullet_obj.attack
  if (bullet_obj.y == hero[0].y and enemy_obj.category == "breakfast") then
    damage = damage*2 -- double damage for now
  end 
  if (bullet_obj.y == hero[1].y and enemy_obj.category == "dinner") then
    damage = damage*2
  end 
  if (bullet_obj.y == hero[2].y and enemy_obj.category == "dessert") then
    damage = damage*2
  end 
  if (enemy_obj.type == "bad") then
    damage = damage/2
  end 
    return damage
end


   foodgroup = {}


   foodgroup = {
      egg = {egg = "bad", flour = "pancake", potato = "scrambledPotato", strawberry = "bad", oil = "bad", steak = "steakOm", sugar = "meringue", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad" , sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "bad", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      flour = {egg = "pancake", flour = "bad", potato = "croquette", strawberry = "strawberryTart", oil = "donut", steak = "CFS", sugar = "cake", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "lemonCookie", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      potato = {egg = "scrambledPotato", flour = "croquette", potato = "mashed", strawberry = "bad", oil = "fries", steak = "steakBaked", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "bad", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      strawberry = {egg = "bad", flour = "strawberryTart", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "strawberryCandy", pancake = "strawPancake",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "strawberryCake", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "strawLemonade", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      oil = {egg = "bad", flour = "donut", potato = "fries", strawberry = "bad", oil = "bad", steak = "CFS", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "bad", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      steak = {egg = "steakOm", flour = "CFS", potato = "steakBaked", strawberry = "bad", oil = "CFS", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "sheperdsPie",
       fries = "steakFries", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "lemonSteak", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      sugar = {egg = "meringue", flour = "cake", potato = "bad", strawberry = "strawberryCandy", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "lemonCandy", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      pancake = {egg = "bad", flour = "bad", potato = "bad", strawberry = "strawPancake", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "bad", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      scrambledPotato = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "bad", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      steakOm = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "bad", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      meringue = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "lemonPie", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      croquette = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "bad", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      bad = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       strawberryTart = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "bad", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      donut = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "lemonDonut", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      CFS = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "bad", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      cake = {egg = "bad", flour = "bad", potato = "bad", strawberry = "strawberryCake", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "lemonCake", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      mashed = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "sheperdsPie", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "bad", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      fries = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "steakFries", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "bad", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      steakBaked = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "bad", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      strawberryCandy = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "bad", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      strawberryTart = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "bad", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},
       
      sheperdsPie = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "bad", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      strawberryCake = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "bad", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      steakFries = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "bad", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      strawPancake = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       scrambledPotato = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "bad", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      lemon = {egg = "bad", flour = "lemonCookie", potato = "bad", strawberry = "strawLemonade", oil = "bad", steak = "lemonSteak", sugar = "lemonCandy", pancake = "bad",
       strawberryTart = "bad", steakOm = "bad", meringue = "lemonPie" , croquette = "bad", strawberryTart = "bad", donut = "lemonDonut", CFS = "bad", cake = "lemonCake", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "bad", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      lemonCookie = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       strawberryTart = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "bad", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      strawLemonade = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       strawberryTart = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "bad", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      lemonSteak = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       strawberryTart = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "bad", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      lemonCandy = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       strawberryTart = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "bad", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      lemonDonut = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       strawberryTart = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "bad", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      lemonCake = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
       strawberryTart = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "bad", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"},

      lemonPie = {egg = "bad", flour = "bad", potato = "bad", strawberry = "bad", oil = "bad", steak = "bad", sugar = "bad", pancake = "bad",
      strawberryTart = "bad", steakOm = "bad", meringue = "bad" , croquette = "bad", strawberryTart = "bad", donut = "bad", CFS = "bad", cake = "bad", mashed = "bad",
       fries = "bad", steakBaked = "bad", strawberryCandy = "bad", sheperdsPie = "bad", strawberryCake = "bad" , steakFries = "bad", strawPancake = "bad", bad = "bad", 
       lemon = "bad", lemonCookie = "bad", strawLemonade = "bad", lemonSteak = "bad", lemonCandy = "bad", lemonDonut = "bad", lemonCake = "bad", lemonPie = "bad"}

   }