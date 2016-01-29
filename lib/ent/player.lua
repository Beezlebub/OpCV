local inventory = require 'lib.mod.inventory'
local player = {}

function player.inherit(x, y)
	local self = {
		imgCoast = LG.newImage('lib/img/starterShipCoast.png'),
		imgBoost = LG.newImage('lib/img/starterShipBoost.png'),
		useImg = "imgCoast",
		x = x,
		y = x,
		vx = 0,
		vy = 0,
		vrot = 0,
		rot = 0,
		force = 2500,
		fuel = 100,
		health = 100,
		burnRate = 5,
		collides = true,
		cargo = inventory.load(),
		canShoot = true,
		canShootTimer = 0,

		action = {
			thrust = false,
			reverse = false,
			turnCW = false,
			turnCCW = false,
			shoot = false			
		},

		weapon = {
			bullet = {
				strength = 20,
				lifeTime = 10
			},

			missle = {
				strength = 100,
				lifeTime = 10
			},

			use = "bullet"
		}
	}

	self.w = self.imgCoast:getWidth()
	self.h = self.imgCoast:getHeight()

	function self:update(dt)
		if self.canShootTimer > 0 then
			self.canShootTimer = self.canShootTimer - 1 * dt
		else
			self.canShoot = true
		end

		self.useImg = "imgCoast"
		local didRot = false
		local accel = self.force/(self.cargo.baseWeight + self.cargo.cargoWeight)

		if self.fuel > 0 then
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
		end

		if self.action.turnCCW then
			didRot = true
			self.vrot = self.vrot - .1 * dt
		elseif self.action.turnCW then	
			didRot = true
			self.vrot = self.vrot + .1 * dt
		end

		if not self.action.thrust and self.fuel < 100 then self.fuel = self.fuel + 3 * dt end
		if self.fuel > 100 then self.fuel = 100 end

		self.x = self.x + self.vx
		self.y = self.y + self.vy
		self.rot = self.rot + self.vrot

		if self.vx > 10 then self.vx = 10
		elseif self.vx < -10 then self.vx = -10 end

		if self.vy > 10 then self.vy = 10
		elseif self.vy < -10 then self.vy = -10 end

		if self.vrot > 0 and not didRot then
			self.vrot = self.vrot - .05 * dt
		elseif self.vrot < 0 and not didRot then 
			self.vrot = self.vrot + .05 * dt
		end

	end

	function self:draw()
		LG.setColor(255,255,255)
		LG.draw(self[self.useImg], self.x, self.y, self.rot, .2, .2, self.w/2, self.h/2)
	end

	function self:set(act, val)
		if act == "weapon" then
			self.weapon.use = val
		elseif act == "shoot" then
			self.action.shoot = val
		elseif act == "canShoot" then
			self.canShoot = val
		elseif act == "canShootTimer" then
			self.canShootTimer = val
		else
			self.action[act] = val
		end
	end
	
	return self
end
return player
