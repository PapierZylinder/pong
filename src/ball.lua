local ball = {}

local Ball = {}

function Ball:update(dt)
	self.x = self.x + self.vx * dt
	self.y = self.y + self.vy * dt

	if self.y <= 20 then
		self.y = 20
		self.vy = -self.vy
	end

	if self.y >= 580 then
		self.y = 580
		self.vy = -self.vy
	end
end

function Ball:draw()
	love.graphics.circle("fill", self.x, self.y, self.size)
end

function Ball:reset()
	self.x = 400
	self.y = 300

	local dir = love.math.random(0, 1) == 0 and -1 or 1

	self.vx = 300 * dir
	self.vy = love.math.random(-200, 200)
end

function ball.new()
	local self = {}

	setmetatable(self, { __index = Ball })

	self.x = 400
	self.vx = 0
	self.y = 300
	self.vy = 0
	self.size = 20

	return self
end

return ball
