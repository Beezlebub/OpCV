local Entity = require 'lib.mod.ecs'
require 'lib.mod.hud'

entities = {}

local stars = {}

function gameLoad()	
	
	entities = {}
	hudLoad()
	LG.setPointSize(2)
	for i = 1, 50000 do
		stars[i] = {
			x = math.random(-20000, 20000),
			y = math.random(-20000, 20000),
			a = math.random(150, 255)
		}
	end

	entities[1] = Entity.new("player") -- Call player first! Camera follows first entity!

	for i = 1, 3 do
		--entities[#entities+1] = Entity.new("enemy", "1")
	end

end

function gameUpdate(dt)
	hudUpdate(dt)
	for i, ent in ipairs(entities) do
		if ent.isDead then
			table.remove(entities, i)
		else
			ent:update(dt)
		end
	end
end

function gameDraw()
	LG.translate(-entities[1].x + LG.getWidth()/2, -entities[1].y + LG.getHeight()/2)

	for i = 1, #stars do
		local x, y, dis = stars[i].x, stars[i].y, 0
		dis = math.abs(entities[1].x - x) + math.abs(entities[1].y - y)
		if dis < LG.getWidth() then
			LG.setColor(255,255,255, stars[i].a)
			LG.point(stars[i].x, stars[i].y)
		end
	end

	for i, ent in ipairs(entities) do
		ent:draw()
	end
end

function gameClick(x, y, b)

end

function gameKey(k, i)

end
