local Player = require("src.player")
local Ball = require("src.ball")
local Score = require("src.score")

local player
local enemy
local ball
local score
local ai
local menu
local pause
local timer

function love.load()
	player = Player.new()
	enemy = Player.new(love.graphics.getWidth() - 40, love.graphics.getHeight() / 2 - 50)
	ball = Ball.new()
	score = Score.new()
	ai = false
	menu = true
	pause = false
	timer = 0
end

function love.update(dt)
	if menu == true then
		if love.keyboard.isDown("1") then
			menu = false
			ai = false
			--ball:reset()
		end
		if love.keyboard.isDown("2") then
			menu = false
			ai = true
			--ball:reset()
		end
	end
	if love.keyboard.isDown("p") and timer == 0 then
		if pause == false then
			pause = true
			timer = 1
		else
			pause = false
			timer = 1
		end
	end
	if timer > 0 then
		timer = timer - 1 * dt
	elseif timer < 0 then
		timer = 0
	end
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
	if pause == false and menu == false then
		player:update(dt)
		enemy:update(dt, "up", "down")
		ball:update(dt, player, enemy, ai)
		score:update(ball)
	end
end

function love.draw()
	if menu == true then
		love.graphics.print("Willkommen zu Pong!", 20, 20)
		love.graphics.print("Drücke 1 um gegen einen Spieler zu spielen.", 20, 40)
		love.graphics.print("Drücke 2 um gegen einen KI zu spielen.", 20, 60)
	end
	if pause == true then
		love.graphics.print("PAUSE", love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 0, 3, 3)
	end
	love.graphics.rectangle("fill", love.graphics.getWidth() / 2, 0, 1, love.graphics.getHeight())
	love.graphics.rectangle("fill", 0, love.graphics.getHeight() / 2, love.graphics.getWidth(), 1)
	love.graphics.circle("line", love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 40)
	ball:draw()
	player:draw()
	enemy:draw()
	score:draw()
end
