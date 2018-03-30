local window = require("window")

local arrow = {}
arrow.angle = 0
arrow.width = 100
arrow.height = 20
arrow.speed = 300
arrow.cx = math.floor(window.width * 0.5)
arrow.cy = math.floor(window.height * 0.5)

function arrow.update(dt)
    arrow.move(dt)
    arrow.rotate()
end

function arrow.draw()
    love.graphics.push()
    love.graphics.translate(arrow.cx, arrow.cy)
    love.graphics.rotate(arrow.angle)
    love.graphics.line(-arrow.width * 0.5, 0, arrow.width * 0.5, 0)
    love.graphics.line(arrow.width * 0.5 - arrow.height, arrow.height * 0.5, arrow.width * 0.5, 0)
    love.graphics.line(arrow.width * 0.5 - arrow.height, -arrow.height * 0.5, arrow.width * 0.5, 0)
    love.graphics.pop()
end

function arrow.rotate()
    local mouseX = love.mouse.getX()
    local mouseY = love.mouse.getY()
    local dx = mouseX - arrow.cx
    local dy = mouseY - arrow.cy
    arrow.angle = math.atan2(dy, dx)
end

function arrow.move(dt)
    if(love.keyboard.isDown("up") and not love.keyboard.isDown("down")) then
        arrow.cy = arrow.cy - arrow.speed * dt
    elseif(love.keyboard.isDown("down") and not love.keyboard.isDown("up")) then
        arrow.cy = arrow.cy + arrow.speed * dt
    end

    if(love.keyboard.isDown("left") and not love.keyboard.isDown("right")) then
        arrow.cx = arrow.cx - arrow.speed * dt
    elseif(love.keyboard.isDown("right") and not love.keyboard.isDown("left")) then
        arrow.cx = arrow.cx + arrow.speed * dt
    end
    arrow.warp()
end

function arrow.warp()
    if(arrow.cx <= 0) then
        arrow.cx = window.width
    elseif(arrow.cx >= window.width) then
        arrow.cx = 0
    end
    
    if(arrow.cy <= 0) then
        arrow.cy = window.height
    elseif(arrow.cy >= window.height) then
        arrow.cx = 0
    end
end

return arrow
