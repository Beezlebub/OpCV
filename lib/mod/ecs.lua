local player = require 'lib.ent.player'
local enemy = require 'lib.ent.enemy'
local bullet = require 'lib.ent.bullet'
local missle = require 'lib.ent.missle'
local planet = require 'lib.ent.planet'
local radio = require 'lib.ent.radio'
local smoke = require 'lib.ent.smoke'


local ecs = {}

function ecs.new(model, ... )
	local self = {}
	self.model = model
	self.isDead = false
	
	if model == "player" then
		self = player.inherit()
	elseif model == "enemy" then
		self = enemy.inherit( ... )
	elseif model == "bullet" then
		self = bullet.inherit( ... )
	elseif model == "missle" then
		self = missle.inherit( ... )
	elseif model == "planet" then
		self = planet.inherit( ... )
	elseif model == "radio" then
		self = radio.inherit( ... )
	elseif model == "smoke" then
		self = smoke.inherit( ... )
	end

	return self
end

return ecs
