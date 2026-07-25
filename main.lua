local Player = require("src.player")
local Ball = require("src.ball")
local Score = require("src.score")

local player
local player2
local ball
local score
local state

local doesCollide

function doesCollide(_ball, _player)
	return _ball.x < _player.x + 20
		and _ball.x + _ball.size > _player.x
		and _ball.y < _player.y + 200
		and _ball.y + _ball.size > _player.y
end

function love.load()
	state = "menu"
	player = Player.new()
	player2 = Player.new(true, 760, 200, "up", "down")
	score = Score.new()
	ball = Ball.new()
	ball:reset()
end

function love.update(dt)
	if state == "menu" then
		if love.keyboard.isDown("space") then
			state = "play"
		end
	end

	if state == "play" then
		player:update(dt)
		player2:update(dt, ball.y)
		ball:update(dt)
		if doesCollide(ball, player) then
			ball.x = player.x + ball.size
			ball.vx = -ball.vx
		end
		if doesCollide(ball, player2) then
			ball.x = player2.x - ball.size
			ball.vx = -ball.vx
		end
		score:update(ball.x, ball)
		if love.keyboard.isDown("escape") then
			ball:reset()
		end
	end
end

function love.draw()
	love.graphics.setDefaultFilter("nearest", "nearest")
	if state == "menu" then
		love.graphics.print("Press Space to Play", 200, 200, 0, 5, 5)
	end

	if state == "play" then
		love.graphics.line(400, 0, 400, 600)
		love.graphics.circle("line", 400, 300, 70)

		score:draw()
		ball:draw()
		player:draw()
		player2:draw()
	end
end
