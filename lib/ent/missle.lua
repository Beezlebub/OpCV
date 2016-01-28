local missle = {}

function missle.inherit(x, y, vx, vy, rot)
	local self = {
		x = x,
		y = y, 
		vx = vx,
		vy = vy,
		thrust = 10,
		rot = rot,
		lifeTime = 10
	}

	function self:update(dt)
		self.vx = self.vx + math.sin(self.rot) * self.thrust * dt
		self.vy = self.vy + math.cos(self.rot) * -self.thrust * dt
		self.lifeTime = self.lifeTime - 1 * dt

		self.x = self.x + self.vx
		self.y = self.y + self.vy
		
		if self.lifeTime <= 0 then
			self.isDead = true
		end
	end

	function self:draw()
		LG.setColor(255,255,255)
		LG.circle("fill", self.x, self.y, 2)
	end

	return self
end
return missle
