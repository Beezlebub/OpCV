local missle = {}

function missle.inherit(x, y, vx, vy, rot)
	local self = {
		img = LG.newImage('lib/img/missleFired.png'),
		x = x,
		y = y, 
		vx = vx,
		vy = vy,
		thrust = 10,
		rot = rot,
		lifeTime = 10,
		collides = true,

		action = {
			thrust = true,
			explode = false
		}
	}

	function self:update(dt)
		if self.lifeTime <= 0 then
			self.isDead = true
			return
		end

		self.vx = self.vx + math.sin(self.rot) * self.thrust * dt
		self.vy = self.vy + math.cos(self.rot) * -self.thrust * dt
		self.lifeTime = self.lifeTime - 1 * dt

		self.x = self.x + self.vx
		self.y = self.y + self.vy
	end

	function self:draw()
		LG.setColor(255,255,255)
		LG.draw(IMG.missle, self.x, self.y, self.rot, 1, 1, IMG.missle:getWidth()/2, IMG.missle:getHeight()/2)
	end

	return self
end
return missle
