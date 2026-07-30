local player = {}

player.__index = player

function player.new(x, y)
	local self = {}

	self.x = x or 20
	self.y = y or 250
	self.height = 100
	self.width = 20
	self.speed = 200
	self.up = "w"
	self.down = "s"

	setmetatable(self, player)

	return self
end

function player:update(dt, up, down)
	self.up = up or self.up
	self.down = down or self.down

	if love.keyboard.isDown(self.up) then
		self.y = self.y - self.speed * dt
	elseif love.keyboard.isDown(self.down) then
		self.y = self.y + self.speed * dt
	end
end

function player:draw()
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return player
