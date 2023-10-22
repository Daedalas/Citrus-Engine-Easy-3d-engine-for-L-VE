--[[

    TODO for 10/22/23:

        -Create Rotation Matrices for each vertice
        

]]--

require "citrus/engine"

function love.load()

    citrus.init()

    cube = citrus.newMesh("cube", {0, 0, 0}, {0, 0, 0}, {0, 0, 0})
    thisCam = citrus.newCamera({0, 0, -10}, {0, 0, 0}, 30)

end

function love.update(dt)

    if love.keyboard.isDown("a") then

        thisCam.rotation.y = thisCam.rotation.y - 6*dt

    end

    if love.keyboard.isDown("w") then

        thisCam.position.x = thisCam.position.x + math.cos(thisCam.rotation.y)*3*dt
        thisCam.position.z = thisCam.position.z + math.sin(thisCam.rotation.y)*3*dt

    end
    
    if love.keyboard.isDown("d") then

        thisCam.rotation.y = thisCam.rotation.y + 6*dt

    end

    cube.rotation.y = cube.rotation.y + dt

    if cube.rotation.y > 360 then cube.rotation.y = 0 end

end

function love.draw()

    citrus.drawMesh(cube, thisCam)

end