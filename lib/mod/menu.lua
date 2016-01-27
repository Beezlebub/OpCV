local menu = {}

function menuLoad()
	imgLove = LG.newImage('lib/img/madewithlove2d.png')
	
	intro = {
		x = 150, 
		y = 50,
		w = LG.getWidth()-300,
		text = [[
			Welcome to Operation: Caravan! 

			You are an aspiring young captain in search of getting filthy rich. You start out piloting a small ship, buying and selling goods in the galaxy's numerous markets. Everything would be okay... If not for the pirates!!! 

			You must navigate the openness of space while defending your precious cargo. You have limited ammo, fuel, and health... But they will slowly refill after use. After saving up money you can upgrade your ship's armor, thrusters, cargo space, and weapons all from within the market system!

			** Some features not implemented yet, sorry.
			** Due to technical issues, this game is developed for LOVE v 0.9.2
		]]
	}
	btnStart = {
		x = LG.getWidth()/2 - 100,
		y = LG.getHeight()/2 + 80,
		w = 200,
		h = 50,
		hover = false
	}

	btnQuit = {
		x = LG.getWidth()/2 - 100,
		y = LG.getHeight()/2 + 150,
		w = 200,
		h = 50,
		hover = false
	}
end

function menuUpdate(dt)
	local mx, my = LM.getPosition()
	btnStart.hover = false
	btnQuit.hover = false
	
	if mx < btnStart.x + btnStart.w and btnStart.x < mx and my < btnStart.y + btnStart.h and btnStart.y < my then
		btnStart.hover = true
	elseif mx < btnQuit.x + btnQuit.w and btnQuit.x < mx and my < btnQuit.y + btnQuit.h and btnQuit.y < my then
		btnQuit.hover = true
  	end
end

function menuDraw()
	LG.setColor(120,120,120)
	LG.rectangle("fill", 0, 0, LG.getWidth(), LG.getHeight())

	LG.setColor(50, 50, 50)
	LG.rectangle("fill", btnStart.x, btnStart.y, btnStart.w, btnStart.h)
	LG.rectangle("fill", btnQuit.x, btnQuit.y, btnQuit.w, btnQuit.h)
	
	if btnStart.hover then
		LG.setColor(255, 255, 255, 200)
		LG.rectangle("fill", btnStart.x, btnStart.y, btnStart.w, btnStart.h)
	elseif btnQuit.hover then
		LG.setColor(255, 255, 255, 200)
		LG.rectangle("fill", btnQuit.x, btnQuit.y, btnQuit.w, btnQuit.h)
	end

	LG.setFont(font14)
	LG.setColor(255, 255, 255)
	LG.printf(intro.text, intro.x, intro.y, intro.w, "left")

	LG.setFont(font20)
	LG.printf("START", btnStart.x, btnStart.y+15, btnStart.w, "center")
	LG.printf("QUIT", btnQuit.x, btnQuit.y+15, btnQuit.w, "center")

	LG.draw(imgLove, LG.getWidth()/2, LG.getHeight()/2-50, 0, .8, .8, imgLove:getWidth()/2-50, imgLove:getHeight()/2)
end	

function menuMouse(x, y, b)
	if btnStart.hover then
		entities = nil
		gameLoad()
		stateSet("game")
	elseif btnQuit.hover then
		love.event.quit()
	end
end
