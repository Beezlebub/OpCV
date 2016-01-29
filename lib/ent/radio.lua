local radio = {}

function radio.inherit(id, x, y, strength)
	local self = {
		id = id,
		x = x,
		y = y,
		strength = strength
	}

	--	im not exactly sure what i want to do with radios, if i use them at all...
	
	function self:update(dt)

	end

	function self:draw()
		
	end

	return self
end
return radio
