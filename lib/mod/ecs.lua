local player = require 'lib.ent.player'
local enemy = require 'lib.ent.enemy'
local bullet = require 'lib.ent.bullet'
local missle = require 'lib.ent.missle'
local planet = require 'lib.ent.planet'
local radio = require 'lib.ent.radio'

local ecs = {}

function ecs.new(model, args)
	local self = {args}
	self.isDead = false
	
	if model == "player" then
		self = player.inherit()
	elseif model == "enemy" then
		self = enemy.inherit(args)
	elseif model == "bullet" then
		self = bullet.inherit(args)
	elseif model == "missle" then
		self = missle.inherit(args)
	elseif model == "planet" then
		self = planet.inherit(args)
	elseif model == "radio" then
		self = radio.inherit(args)
	end

	return self
end

return ecs
