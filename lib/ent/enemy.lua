local enemy = {}

function enemy.inherit()
	local self = {
		--imgCoast = LG.newImage('lib/img/enemy1Coast.png'),
		--imgBoost = LG.newImage('lib/img/enemy1Boost.png'),
		useImg = "imgCoast",
		x = 0,
		y = 0,
		--w = imgCoast:getWidth(),
		--h = imgCoast:getHeight(),
		vx = 0,
		vy = 0,
		vrot = 0,
		rot = 0,
		force = 2000
	}


	function self:update(dt)
		self.useImg = "imgCoast"
		
	end

	function self:draw()
		--LG.setColor(255,255,255)
		--LG.draw(self[self.useImg], self.x, self.y, self.rot, .2, .2, self.w/2, self.h/2)
	end

	return self
end
return enemy
