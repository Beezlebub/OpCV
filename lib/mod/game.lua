Entity = require 'lib.mod.ecs'
local Smoke = require 'lib.ent.smoke'
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
									--x, y, vx, vy, rot
	entities[1] = Entity.new("player", 0, 0, 0, 0, 0) -- Call player first! Camera follows first entity!

	for i = 1, 3 do
		--entities[#entities+1] = Entity.new("enemy", entities[1].x, entities[1].y - (i*200)+50)
	end

end

function gameUpdate(dt)
	hudUpdate(dt)
	
	for i = #entities, 1, -1 do		
		if entities[i].isDead then
			table.remove(entities, i)
		else
			entities[i]:update(dt)
		end
	end

	if entities[1].action.shoot and entities[1].action.canShoot then	-- fire weapons
		entities[#entities+1] = Entity.new(entities[1].weapon[entities[1].weapon.use], entities[1].x, entities[1].y, entities[1].vx, entities[1].vy, entities[1].rot)
	end

	if entities[1].action.thrust and entities[1].fuel > 0 then	-- ship smoke trails
		entities[#entities+1] = Entity.new("smoke", entities[1].x, entities[1].y, entities[1].vx, entities[1].vy, entities[1].rot)
	end

end
		
	

function gameDraw()
	LG.push()
    LG.translate(-entities[1].x + LG.getWidth()/2, -entities[1].y + LG.getHeight()/2)

	for i = 1, #stars do
		local x, y, dis = stars[i].x, stars[i].y, 0
		dis = math.abs(entities[1].x - x) + math.abs(entities[1].y - y)
		if dis < LG.getWidth() then
			LG.setColor(255,255,255, stars[i].a)
			LG.point(stars[i].x, stars[i].y)
		end
	end

	for i = #entities, 1, -1 do
		entities[i]:draw()
	end

	hudDrawDynamic()
    love.graphics.pop()
	hudDrawStatic()

end
