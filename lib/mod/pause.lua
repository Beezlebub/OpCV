local pause = {}

function pauseLoad()
	imgLove = LG.newImage('lib/img/madewithlove2d.png')
	
	int = {
		x = 300, 
		y = 250,
		w = LG.getWidth()-300,
		text = "Game Paused!"
	}
	btnPlay = {
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
		h = 50
	}
end

function pauseUpdate(dt)
	
end

function pauseDraw()
	LG.setColor(120,120,120)
	LG.rectangle("fill", 0, 0, LG.getWidth(), LG.getHeight())

	LG.setColor(50, 50, 50)
	LG.rectangle("fill", btnPlay.x, btnPlay.y, btnPlay.w, btnPlay.h)
	LG.rectangle("fill", btnQuit.x, btnQuit.y, btnQuit.w, btnQuit.h)
	
	if btnPlay.hover then
		LG.setColor(255, 255, 255, 200)
		LG.rectangle("fill", btnPlay.x, btnPlay.y, btnPlay.w, btnPlay.h)
	elseif btnQuit.hover then
		LG.setColor(255, 255, 255, 200)
		LG.rectangle("fill", btnQuit.x, btnQuit.y, btnQuit.w, btnQuit.h)
	end

	LG.setFont(font36)
	LG.setColor(255, 255, 255)
	LG.printf(int.text, 0, int.y, LG.getWidth(), "center")

	LG.setFont(font20)
	LG.printf("Continue", btnPlay.x, btnPlay.y+15, btnPlay.w, "center")
	LG.printf("QUIT", btnQuit.x, btnQuit.y+15, btnQuit.w, "center")
end

function pauseMouse(mx, my, mb)
	if mx < btnPlay.x + btnPlay.w and btnPlay.x < mx and my < btnPlay.y + btnPlay.h and btnPlay.y < my then
		stateSet("game")
	elseif mx < btnQuit.x + btnQuit.w and btnQuit.x < mx and my < btnQuit.y + btnQuit.h and btnQuit.y < my then
		stateSet("menu")
	end
end
