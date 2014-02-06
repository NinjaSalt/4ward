require("classes.enemies")
recipes = {}
recipes[0] = nil
for i = 1,table.maxn( comboEnemies )+1 do
	recipes[i] = comboEnemies[i-1]
end