local hint = require 'lib.mod.hint'

function hudLoad()
	hint.new("Welcome to Operation: Caravan!", "info", 10)
end

function hudMsg(msg, mode, time)
	hint.new(msg, mode, time)
end

function hudUpdate(dt)
	hint.update(dt)
end

function hudDrawStatic()
	hint.draw()
	LG.setColor(180, 180, 180)
	LG.rectangle("fill", 180, 510, 200, 150)
	LG.setColor(0,0,0)
	LG.printf("x= " ..  entities[1].x, 200, 520, 500)
	LG.printf("y= " ..  entities[1].y, 200, 540, 500)
	LG.printf("vx= " ..  entities[1].vx, 200, 560, 500)
	LG.printf("vy= " ..  entities[1].vy, 200, 580, 500)
	LG.printf("health= " ..  entities[1].health, 200, 600, 500)
	LG.printf("fuel= " ..  entities[1].fuel, 200, 620, 500)
	LG.printf("weapon= " ..  entities[1].weapon.use, 200, 640, 500)
end

function hudDrawDynamic()

end
