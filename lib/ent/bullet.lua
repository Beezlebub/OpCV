local bullet = {}

function bullet.inherit(x, y, vx, vy, rot)
	local self = {
		img = LG.newImage('lib/img/bullet.png'),
		x = x,
		y = y, 
		vx = vx,
		vy = vy,
		rot = rot,
		lifeTiem = 10,
		collides = true
	}

	function self:update(dt)
		if self.lifeTime <= 0 then
			self.isDead = true
			return
		end
		self.x = self.x + self.vx * dt
		self.y = self.y + self.vy * dt
	end

	function self:draw()
		LG.setColor(255,255,255)
		LG.draw(IMG.bullet, self.x, self.y, self.rot, 1, 1, IMG.bullet:getWidth()/2, IMG.bullet:getHeight()/2)
	end

	return self
end
return bullet
