local score = {}

local Score = {}

function Score:update(x, fun)
	if x <= 20 then
		self.pointL = self.pointL + 1
		fun:reset()
	end

	if x >= 780 then
		self.pointR = self.pointR + 1
		fun:reset()
	end
end

function Score:draw()
	love.graphics.print(self.pointL, 300, 20, 0, 2, 2)
	love.graphics.print(self.pointR, 500, 20, 0, 2, 2)
end

function score.new(player)
	local self = {}

	setmetatable(self, { __index = Score })

	self.pointL = 0
	self.pointR = 0
	self.player = player or 1

	return self
end

return score
