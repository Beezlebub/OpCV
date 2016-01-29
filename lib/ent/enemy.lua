local enemy = {}

function enemy.inherit(x, y, vx, vy, rot)
	local self = {
		imgCoast = LG.newImage('lib/img/enemy1Coast.png'),
		imgBoost = LG.newImage('lib/img/enemy1Boost.png'),
		useImg = "imgCoast",
		x = x,
		y = y,
		vx = vx,
		vy = vy,
		vrot = 0,
		rot = rot,
		force = 2000,
		mass = 1500,
		collides = true,

		action = {
			thrust = false,
			reverse = false,
			turnCW = false,
			turnCCW = false,
			shoot = false,
			canShoot = true,
			canShootTimer = 0
		}
	}


	function self:update(dt)
		self.useImg = "imgCoast"
		local didRot = false
		local accel = self.force/self.mass

		--if self.fuel > 0 then
			if self.action.thrust then
				self.vx = self.vx + math.sin(self.rot) * accel * dt
				self.vy = self.vy + math.cos(self.rot) * -accel * dt
				self.fuel = self.fuel - self.burnRate * dt
				self.useImg = "imgBoost"

			elseif self.action.reverse then
				self.vx = self.vx - math.sin(self.rot) * (accel/2) * dt
				self.vy = self.vy - math.cos(self.rot) * (-accel/2) * dt
				self.fuel = self.fuel - (self.burnRate/2) * dt
			end
		--end

		if self.action.turnCCW then
			didRot = true
			self.vrot = self.vrot - .1 * dt
		elseif self.action.turnCW then	
			didRot = true
			self.vrot = self.vrot + .1 * dt
		end

		self.x = self.x + self.vx
		self.y = self.y + self.vy
		self.rot = self.rot + self.vrot

		if self.vrot > 0 and not didRot then
			self.vrot = self.vrot - .05 * dt
		elseif self.vrot < 0 and not didRot then 
			self.vrot = self.vrot + .05 * dt
		end
		
	end

	function self:draw()
		LG.setColor(255,255,255)
		LG.draw(self[self.useImg], self.x, self.y, self.rot, .2, .2, self.imgCoast:getWidth()/2, self.imgCoast:getHeight()/2)
	end

	return self
end
return enemy
