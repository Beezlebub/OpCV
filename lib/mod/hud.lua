local hint = require 'lib.mod.hint'

function hudLoad()
	hint.new("Welcome to Operation: Caravan!", "info", 10)

end

function hudUpdate(dt)
	hint.update(dt)
end

function hudDrawStatic()
	
	hint.draw()
end

function hudDrawDynamic()

end
