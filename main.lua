local Player = require("src.player")
local Ball = require("src.ball")
local Score = require("src.score")

local player
local player2
local ball
local score

function love.load()
	player = Player.new()
	player2 = Player.new(love.graphics.getWidth() - 40, love.graphics.getHeight() / 2 - 50)
	ball = Ball.new()
	score = Score.new()
end

function love.update(dt)
	player:update(dt)
	player2:update(dt, "up", "down")
	ball:update(dt, player, player2)
	score:update(ball)
end

function love.draw()
	love.graphics.rectangle("fill", love.graphics.getWidth() / 2, 0, 1, love.graphics.getHeight())
	love.graphics.rectangle("fill", 0, love.graphics.getHeight() / 2, love.graphics.getWidth(), 1)
	love.graphics.circle("line", love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 40)
	ball:draw()
	player:draw()
	player2:draw()
	score:draw()
end
