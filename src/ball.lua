local collision = require("src.collision")

local ball = {}

ball.__index = ball

function ball.new()
	local self = {}

	self.x = love.graphics.getWidth() / 2
	self.y = love.graphics.getHeight() / 2
	self.height = 20
	self.width = 20
	self.vx = -200
	self.vy = love.math.random(-200, 200)
	self.size = 20

	setmetatable(self, ball)

	return self
end

function ball:update(dt, player, player2)
	if self.y + self.size >= love.graphics.getHeight() then
		self.vy = -self.vy
	end
	if self.y - self.size <= 0 then
		self.vy = -self.vy
	end

	self.x = self.x + self.vx * dt
	self.y = self.y + self.vy * dt

	if collision.check(self, player) then
		self.vx = -self.vx
	elseif collision.check(self, player2) then
		self.vx = -self.vx
	end
end

function ball:draw()
	--love.graphics.circle("fill", self.x, self.y, self.size)
	love.graphics.rectangle("fill", self.x - self.width / 2, self.y - self.height / 2, self.width, self.height)
end

function ball:reset()
	self.x = love.graphics.getWidth() / 2
	self.y = love.graphics.getHeight() / 2
	if love.math.random(2) == 1 then
		self.vx = self.vx
	else
		self.vx = -self.vx
	end
	self.vx = love.math.random(-200, 200)
end

return ball
