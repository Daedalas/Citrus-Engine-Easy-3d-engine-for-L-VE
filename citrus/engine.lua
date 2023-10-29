--[[
------------------------------------------------------------------------------
Citrus Engine is licensed under the MIT Open Source License.
(http://www.opensource.org/licenses/mit-license.html)
------------------------------------------------------------------------------

Copyright (c) 2023 Jorrell Gibbs

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
]]--

citrus = {}

--citrus.vectors = require "vectors"

-- Stop near polygons from overlaping far polygons
love.graphics.setDepthMode("lequal", true)

function citrus.init()
    
    --[[
    function citrus.newModel(model, pos, rot, scale)

        

    end
    ]]--

    -- Preset colors
    citrus.colors = {}
    citrus.colors.white = {1, 1, 1, 1}
    citrus.colors.green = {0, 1, 0, 1}
    citrus.colors.red = {1, 0, 0, 1}
    citrus.colors.blue = {0, 0, 1, 1}

    -- Deal with Vector Math
    vector = require "citrus/vectors"
    citrus.newMesh = require "citrus/geomesh"
    citrus.newCamera = require "citrus/camera"
    citrus.matrix = require "citrus/matrix"

    citrus.degtorad = function(d)

        return d*math.pi/180

    end

    citrus.radtodeg = function(r)

        return r*180/math.pi

    end

end

function citrus.drawMesh(model, camera)
    
    for i = 1, #model.mesh.faces do

        local currentFace = model.mesh.faces[i]

        local px, py = citrus.matrix.getProjectionMatrix(model.mesh.vertices, currentFace[1], camera, model.position, model.rotation, model.scale)
        local px2, py2 = citrus.matrix.getProjectionMatrix(model.mesh.vertices, currentFace[2], camera, model.position, model.rotation, model.scale)
        local px3, py3 = citrus.matrix.getProjectionMatrix(model.mesh.vertices, currentFace[3], camera, model.position, model.rotation, model.scale)

        --love.graphics.line(px, py, px2, py2)
        --love.graphics.line(px, py, px3, py3)

        love.graphics.polygon("line", {px, py, px2, py2, px3, py3})
        
        if currentFace[4] then
        
            local px4, py4 = citrus.matrix.getProjectionMatrix(model.mesh.vertices, currentFace[4], camera, model.position, model.rotation, model.scale)
            --love.graphics.line(px2, py2, px4, py4)
            --love.graphics.line(px3, py3, px4, py4)
            
            love.graphics.polygon("line", {px, py, px2, py2, px3, py3})
            love.graphics.polygon("line", {px2, py2, px3, py3, px4, py4})  
        
        end

        --love.graphics.polygon("line", {px, py, px2, py2, px3, py3})
        --love.graphics.polygon("line", {px2, py2, px3, py4, px4, py4})
        
        --love.graphics.line(px2, py2, px3, py3)

    end

end