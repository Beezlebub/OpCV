local menu = {}
local lg = love.graphics

function menuLoad()
	menu = {
		intro = {
			x = 150, 
			y = 200,
			w = lg.getWidth()-300,
			h = 300,
			text = [[
				Welcome to Operation: Caravan! You are an aspiring young captain in search of 
				getting filthy rich. You start out piloting a small ship, buying and selling goods in the 
				galaxy's numerous markets. Everything would be okay... If not for the pirates!!!	
				You must navigate the openness of 	space while defending your precious cargo. 	
				You have limited ammo, fuel, and health... But they will slowly refill after use. After 
				saving up money you can upgrade your ship's armor, thrusters, cargo space, and 
				weapons all from within the market system!
			]]
		},

		imgLove = lg.newImage('lib.img.madewithlove2d.png')


	}
end

function menuUpdate(dt)

end

function menuDraw()
	lg.setcolor(180,180,180)
	lg.rectangle("fill", 0, 0, lg.getWidth(), lg.getHeight())
end

function menuClick(x, y, b)

end
