local state = require 'lib.mod.state'
--	Operation: Caravan
--	Made by Beelz
LG = love.graphics
LK = love.keyboard
LM = love.mouse

font14 = love.graphics.newFont(14)
font20 = love.graphics.newFont(20)
font36 = love.graphics.newFont(36)

function love.load()
	stateLoad()
end

function love.update(dt)
	stateUpdate(dt)
end

function love.draw()
	stateDraw()
end

function love.keypressed(k)
	stateKeypressed(k)
end

function love.keyreleased(k)
	stateKeyreleased(k)
end

function love.mousepressed(x, y, b)
	stateMouse(x, y, b)
end
