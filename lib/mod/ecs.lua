local player = require 'lib.ent.player'
local enemy = require 'lib.ent.enemy'
local bullet = require 'lib.ent.bullet'
local planet = require 'lib.ent.planet'

local ecs = {}

function ecs.new(model)
	if not model then return end
	local self = {}
	self.isDead = false
	
	if model == "player" then
		self = player.inherit()
	elseif model == "enemy" then
		self = enemy.inherit()
	elseif model == "bullet" then
		self = bullet.inherit()
	elseif model == "planet" then
		self = planet.inherit()
	end

	return self
end

return ecs
