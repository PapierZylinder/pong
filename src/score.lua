local score = {}

score.__index = score

function score.new()
	local self = {}

	self.x = 0
	self.y = 0
	self.pointsL = 0
	self.pointsR = 0

	setmetatable(self, score)

	return self
end

function score:update(ball)
	if ball.x <= 0 then
		self.pointsL = self.pointsL + 1
		ball:reset()
	elseif ball.x >= love.graphics.getWidth() then
		self.pointsR = self.pointsR + 1
		ball:reset()
	end
end

function score:draw()
	love.graphics.print(self.pointsL, love.graphics.getWidth() / 2 - 50, 20)
	love.graphics.print(self.pointsR, love.graphics.getWidth() / 2 + 50, 20)
end

return score
