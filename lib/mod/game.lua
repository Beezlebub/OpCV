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
	entities[1] = Entity.new("player", 0, 0, 0, 0, 0)

	for i = 1, 3 do
		--entities[#entities+1] = Entity.new("enemy", entities[1].x, entities[1].y - (i*200)+500, 0, 0, 0)
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

	if entities[1].action.shoot and entities[1].canShoot then	-- fire weapons
		if entities[1].weapon.use == "bullet" then
			entities[#entities+1] = Entity.new("bullet", entities[1].x, entities[1].y, entities[1].vx, entities[1].vy, entities[1].rot)
			entities[1]:set("canShoot", false)
			entities[1]:set("canShootTimer", .3)

		elseif entities[1].weapon.use == "missle" then
			entities[#entities+1] = Entity.new("missle", entities[1].x, entities[1].y, entities[1].vx, entities[1].vy, entities[1].rot)
			entities[1]:set("canShoot", false)
			entities[1]:set("canShootTimer", 3)
		end
	end

	--[[if entities[1].action.thrust and entities[1].fuel > 0 then	-- ship smoke trail
		entities[#entities+1] = Entity.new("smoke", entities[1].x, entities[1].y)
	end]]

	for i, ent in ipairs(entities) do
		if ent.action.smoke then	-- smoke trails
			if ent.action.isSmoke then
				entities[#entities+1] = Entity.new("smoke", ent.x, ent.y)
			end
		end
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

function checkColl(x1, y1, r1, x2, y2, r2)
	if (x1 + r1 + r2 > x2 and x1 < x2 + r1 + r2 and 
		y1 + r1 + r2 > y2 and y1 < y2 + r1 + r2) then
		collided = true
	end
return collided
end

function checkDis(x1, y1, x2, y2)
	local tx = x2 - x1
	local ty = y2 - y1

	local angle = math.atan2(ty, tx)
	local dis = ((tx^2) + (ty^2))
	dis = math.sqrt(dis)
return dis, angle
end
