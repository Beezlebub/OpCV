require 'lib.mod.menu'
require 'lib.mod.invMenu'
require 'lib.mod.game'
require 'lib.mod.pause'
curState = "menu"

states = {
	
	menu = {
		keys = {
			escape 	= "quit"
		},

		keysReleased = {},

		bindings = {
	        quit = function() love.event.quit() end,
	    }
	},

	pause = {
		keys = {
			escape 	= "unpause"
		},

		keysReleased = {},

		bindings = {
	        unpause = function() stateSet("game") end
	    }
	},

	invMenu = {
		keys = {
			escape 	= "unpause"
		},

		keysReleased = {},

		bindings = {
	        unpause = function() stateSet("game") end
	    }
	},

	game = {
		keys = {
			escape 	= "pause",
			--i 		= "inventory",
			--tab 	= "menu",

			w 		= "thrustOn",
			s 		= "reverseOn",
			a 		= "ccwOn",
			d 		= "cwOn",

			[" "] 	= "shootOn",
			["1"] 	= "weapon1",
			["2"]	= "weapon2",
			["3"]	= "weapon3",
			["4"]	= "weapon4",
			["5"]	= "weapon5"
		},

		keysReleased = {
			w 		= "thrustOff",
			s 		= "reverseOff",
			a 		= "ccwOff",
			d 		= "cwOff",
			[" "]	= "shootOff"
		},

		bindings = {
		    pause   	= function() stateSet("pause") end,
		    inventory	= function() stateSet("invMenu") end,
		    menu 		= function() end,

		    thrustOn	= function() entities[1]:set("thrust", true); entities[1]:set("isSmoke", true) end,
		    thrustOff	= function() entities[1]:set("thrust", false); entities[1]:set("isSmoke", false) end,
		    reverseOn	= function() entities[1]:set("reverse", true) end,
		    reverseOff	= function() entities[1]:set("reverse", false) end,

		    ccwOn		= function() entities[1]:set("turnCCW", true) end,
		    ccwOff		= function() entities[1]:set("turnCCW", false) end,
		    cwOn		= function() entities[1]:set("turnCW", true) end,
		    cwOff		= function() entities[1]:set("turnCW", false) end,

		    shootOn		= function() entities[1]:set("shoot", true) end,
		    shootOff	= function() entities[1]:set("shoot", false) end,

		    weapon1	= function() entities[1]:set("weapon", "bullet") end,
		    weapon2	= function() entities[1]:set("weapon", "missle") end
		    --weapon3	= function() entities[1]:set("weapon.use", 3) end,
		    --weapon4	= function() entities[1]:set("weapon.use", 4) end,
		    --weapon5	= function() entities[1]:set("weapon.use", 5) end
		}
	}
}

function stateLoad()
	menuLoad()
	pauseLoad()
end

function stateSet(s)
	curState = s
end

function stateUpdate(dt)
	if curState == "menu" then menuUpdate(dt) end
	if curState == "invMenu" then invMenuUpdate(dt) end
	if curState == "pause" then pauseUpdate(dt) end
	if curState == "game" then gameUpdate(dt) end
end

function stateDraw()
	if curState == "menu" then menuDraw() end
	if curState == "invMenu" then invMenuDraw() end
	if curState == "pause" then pauseDraw() end
	if curState == "game" then gameDraw() end
end

function stateMouse(x, y, b)
	if curState == "menu" then menuMouse(x, y, b) end
	if curState == "invMenu" then invMenuMouse(x, y, b) end
	if curState == "pause" then pauseMouse(x, y, b) end
end

-------------------------------------------------------

function inputHandler( input )
    local action = states[curState].bindings[input]
    if action then return action() end
end

function stateKeypressed( k )
    INPUTMETHOD = "keyboard"
    local binding = states[curState].keys[k]
    return inputHandler( binding )
end
function stateKeyreleased( k )
    local binding = states[curState].keysReleased[k]
    return inputHandler( binding )
end
