local player = require 'lib.ent.player'
local enemy = require 'lib.ent.enemy'
local bullet = require 'lib.ent.bullet'
local missle = require 'lib.ent.missle'
local planet = require 'lib.ent.planet'
local radio = require 'lib.ent.radio'
local smoke = require 'lib.ent.smoke'


local ecs = {}

function ecs.new(model, x, y ,vx, vy, rot)
	local self = {}
	self.model = model
	self.isDead = false
	
	if model == "player" then
		self = player.inherit(x, y)
	elseif model == "enemy" then
		self = enemy.inherit(x, y)
	elseif model == "bullet" then
		self = bullet.inherit(x, y, vx, vy, rot)
	elseif model == "missle" then
		self = missle.inherit(x, y, vx, vy, rot)
	elseif model == "planet" then
		self = planet.inherit(x, y)
	elseif model == "radio" then
		self = radio.inherit(x, y)
	elseif model == "smoke" then
		self = smoke.inherit(x, y)
	end

	return self
end

return ecs
