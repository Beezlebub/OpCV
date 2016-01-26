--	Operation: Caravan
--	Made by Beelz
LG = love.graphics
LK = love.keyboard
LM = love.mouse

local Entity = require 'lib.mod.ecs'
entities = {}
local stars = {}

function love.load()
	LG.setPointSize(2)
	for i = 1, 10000 do
		stars[i] = {
			x = math.random(-10000, 10000),
			y = math.random(-10000, 10000),
			a = math.random(150, 255)
		}
	end

	entities[#entities+1] = Entity.new("player") -- Call player first! Camera follows first entity!

	for i = 1, 10 do
		--entities[#entities+1] = Entity.new("enemy", math.random(-10000, 10000), math.random(-10000, 10000))
	end

end

function love.update(dt)
	
	for i, ent in ipairs(entities) do
		if ent.isDead then
			table.remove(entities, i)
		else
			ent:update(dt)
		end
	end
end

function love.draw()
	LG.translate(-entities[1].x + LG.getWidth()/2, -entities[1].y + LG.getHeight()/2)

	for i, star in ipairs(stars) do
		local x, y, dis = star.x, star.y, 0
		dis = (entities[1].x - x) + (entities[1].y - y)
		if dis < LG.getWidth() then
			LG.setColor(255,255,255, star.a)
			LG.point(star.x, star.y)
		end
	end

	for i, ent in ipairs(entities) do
		ent:draw()
	end
end

function checkDis(x1, y1, x2, y2)

end

function love.keypressed(k, i)
	if  k == "escape" then love.event.quit() end
end

function love.mousepressed(x, y, b)

end
