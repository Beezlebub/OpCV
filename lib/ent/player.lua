local player = {}

function player.inherit()
	local self = {
		imgCoast = LG.newImage('lib/img/starterShipCoast.png'),
		imgBoost = LG.newImage('lib/img/starterShipBoost.png'),
		useImg = "imgCoast",
		x = 0,
		y = 0,
		vx = 0,
		vy = 0,
		vrot = 0,
		rot = 0,
		accel = 5,
		fuel = 100,
		burnRate = 5,

		mass = {
			empty = 1000,
			maxTotal = 1500,
			curCargo = 0
		}
	}

	self.w = self.imgCoast:getWidth()
	self.h = self.imgCoast:getHeight()

	function self:update(dt)
		local didThrust, didRot = false, false
		self.useImg = "imgCoast"

		if self.fuel > 0 then
			if LK.isDown("w") then
				didThrust = true
				self.vx = self.vx + math.sin(self.rot) * self.accel * dt
				self.vy = self.vy + math.cos(self.rot) * -self.accel * dt
				self.fuel = self.fuel - self.burnRate * dt
				self.useImg = "imgBoost"

			elseif LK.isDown("s") then
				didThrust = true
				self.vx = self.vx - math.sin(self.rot) * (self.accel/2) * dt
				self.vy = self.vy - math.cos(self.rot) * (-self.accel/2) * dt
				self.fuel = self.fuel - (self.burnRate/2) * dt
			else
				self.fuel = self.fuel + 3 * dt
			end
		end

		if LK.isDown("a") then
			didRot = true
			self.vrot = self.vrot - .1 * dt
		elseif LK.isDown("d") then	
			didRot = true
			self.vrot = self.vrot + .1 * dt
		end

		self.x = self.x + self.vx
		self.y = self.y + self.vy
		self.rot = self.rot + self.vrot

		if self.vx > 0 and not didThrust then
			self.vx = self.vx - 1 * dt
		elseif self.vx < 0 and not didThrust then 
			self.vx = self.vx + 1 * dt
		end

		if self.vy > 0 and not didThrust then
			self.vy = self.vy - 1 * dt
		elseif self.vy < 0 and not didThrust then 
			self.vy = self.vy + 1 * dt
		end

		if self.vrot > 0 and not didRot then
			self.vrot = self.vrot - .1 * dt
		elseif self.vrot < 0 and not didRot then 
			self.vrot = self.vrot + .1 * dt
		end


	end

	function self:draw()
		LG.draw(self[self.useImg], self.x, self.y, self.rot, .5, .5, self.w/2, self.h/2)
	end

	return self
end
return player
