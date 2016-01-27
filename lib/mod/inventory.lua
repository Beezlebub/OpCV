local itemTable = {
	smCargo = {
		weight = 10,
		price = 100
	},
	mdCargo = {
		weight = 50,
		price = 600
	},
	lgCargo = {
		weight = 100,
		price = 1250
	},
	passengers = {
		weight = 150,
		price = 1700
	}
}

local inventory = {}

function inventory.load()
	local self = {
		baseWeight = 1500,
		cargoWeight = 0,
		maxWeight = 2000,

		items = {
			money = 1000,
			smCargo = 0,
			mdCargo = 0,
			lgCargo = 0,
			passengers = 0
		}
	}

	function self:add(item, qty)
		local remain = self.maxWeight - (self.baseWeight + self.cargoWeight)
		if itemTable[item].weight * qty <= remain then
			self.items[item] = self.items[item] + qty
			return true
		end
	end

	function self:remove(item, qty)
		if self.items[item] > qty then
			self.items[item] = self.items[item] - qty
			return true
		end
	end
	return self
end
return inventory
