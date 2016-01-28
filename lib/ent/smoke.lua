local smoke = {}

function smoke.inherit( ... )
	local args = { ... }
	local self = {
		x = args[1],
		y = args[2],
		r = 2,
		a = 200,
		lifeTime = 3
	}

	function self:update(dt)
		self.lifeTime = self.lifeTime - 1 * dt
		self.r = self.r + .5 * dt
		self.a = self.a - 25 * dt

		if self.lifeTime <= 0 then
			self.isDead = true
		end
	end

	function self:draw()
		LG.setColor(255,255,255, self.a)
		LG.circle("fill", self.x-1, self.y+2, self.r)
		LG.circle("fill", self.x+2, self.y+1, self.r)
		LG.circle("fill", self.x+2, self.y-2, self.r)
		LG.circle("fill", self.x-1, self.y-1, self.r)
	end

	return self
end
return smoke
