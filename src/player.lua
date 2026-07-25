local player = {}

local Player = {}

function Player:update(dt, ball)
	if self.ai then
		self.y = ball - 100
	end
	if love.keyboard.isDown(self.up) and self.y > 20 then
		self.y = self.y - self.speed * dt
	end
	if love.keyboard.isDown(self.down) and self.y < 380 then
		self.y = self.y + self.speed * dt
	end
end

function Player:draw()
	love.graphics.rectangle("fill", self.x, self.y, 20, 200)
end

function player.new(ai, x, y, up, down)
	local self = {}

	setmetatable(self, { __index = Player })

	self.x = x or 20
	self.y = y or 200
	self.up = up or "w"
	self.down = down or "s"
	self.ai = ai or false

	self.speed = 200

	return self
end

return player
