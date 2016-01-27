local bullet = {}

function bullet.inherit(x, y, vx, vy, rot)
	local self = {
		img = LG.newImage('lib/img/bullet.png'),
		x = x,
		y = y, 
		vx = vx,
		vy = vy,
		rot = rot
	}

	function self:update(dt)
		self.vx = self.vx * dt
		self.vy = self.vy * dt

		self.x = self.x + self.vx
		self.y = self.y + self.vy
	end

	function self:draw()
		LG.setColor(255,255,255)
		LG.draw(self.img, self.x, self.y, self.rot, .2, .2, self.img:getWidth()/2, self.img:getHeight()/2)
	end

	return self
end
return bullet
