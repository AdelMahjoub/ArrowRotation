local arrow = require("arrow")

function love.update(dt)
    arrow.update(dt)
end

function love.draw()
    arrow.draw()
    love.graphics.print(("Center[x,y]: [%d,%d]\nAngle[deg]: %d °\nArrow Keys to Move"):format(arrow.cx, arrow.cy, arrow.angle * 180 / math.pi), 10, 10)
end

























