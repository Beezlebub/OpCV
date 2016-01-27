local missle = {}

function missle.inherit(x, y, vx, vy, angle)
	local self = {
		x = x,
		y = y, 
		vx = vx,
		vy = vy,
		angle = angle
	}

	function self:update(dt)
		self.x = self.x + math.sin(self.angle) + self.speed * dt
		self.y = self.y + math.cos(self.angle) + -self.speed * dt
	end

	function self:draw()
		LG.setColor(255,255,255)
		LG.circle("fill", self.x, self.y, 2)
	end

	return self
end
return missle
