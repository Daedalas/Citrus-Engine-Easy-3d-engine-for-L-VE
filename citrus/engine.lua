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
    citrus.vectors = require "citrus/vectors"
    
    function citrus.getRotationMatrixXZ(x, z, rot)
        return z * math.sin(rot) + x * math.cos(rot), z * math.cos(rot) - x * math.sin(rot)
    end

    function citrus.getProjectionMatrix(vertices, face, cam, pos, rot)

        local res_x, res_z = citrus.getRotationMatrixXZ(pos.x+vertices[face][1], pos.z+vertices[face][3], rot.y)
        local res_y = pos.y+vertices[face][2]

        return ((cam.position.x+res_x)*cam.fov/(cam.position.z+res_z)*cam.fov)+love.graphics.getWidth()/2, (cam.position.y+res_y)*cam.fov/(cam.position.z+res_z)*cam.fov+love.graphics.getHeight()/2

    end

    function citrus.newMesh(meshtype, pos, rot, size)

        if meshtype == "cube" then

            return {

                mesh = {

                    vertices = {
                    
                        {-1, 1, 1},
                        {1, 1, 1},
                        {-1, -1, 1},
                        {1, -1, 1},

                        {-1, 1, -1},
                        {1, 1, -1},
                        {-1, -1, -1},
                        {1, -1, -1}

                    },

                    faces = {

                        {1, 2, 3, 4},
                        {1, 5, 3, 7},
                        {1, 2, 5, 6},
                        {5, 6, 7, 8},
                        {3, 4, 7, 8},
                        {6, 2, 8, 4}

                    }

                },

                position = {

                    x = pos[1],
                    y = pos[2],
                    z = pos[3]

                },
                rotation = {

                    x = rot[1],
                    y = rot[2],
                    z = rot[3]

                },
                scale = size

            }

        end

    end

    function citrus.newCamera(pos, rot, fs)

        return {

            position = {

                x = pos[1],
                y = pos[2],
                z = pos[3]

            },
            
            rotation = {

                x = rot[1],
                y = rot[2],
                z = rot[3]

            },
            
            fov = fs

        }
    
    end

end

function citrus.drawMesh(model, camera)
    
    for i = 1, #model.mesh.faces do

        local currentFace = model.mesh.faces[i]

        local px, py = citrus.getProjectionMatrix(model.mesh.vertices, currentFace[1], camera, model.position, model.rotation)
        local px2, py2 = citrus.getProjectionMatrix(model.mesh.vertices, currentFace[2], camera, model.position, model.rotation)
        local px3, py3 = citrus.getProjectionMatrix(model.mesh.vertices, currentFace[3], camera, model.position, model.rotation)
        local px4, py4 = citrus.getProjectionMatrix(model.mesh.vertices, currentFace[4], camera, model.position, model.rotation)

        --love.graphics.polygon("line", {px, py, px2, py2, px3, py3})
        --love.graphics.polygon("line", {px2, py2, px3, py4, px4, py4})

        love.graphics.line(px, py, px2, py2)
        love.graphics.line(px, py, px3, py3)
        love.graphics.line(px2, py2, px4, py4)
        love.graphics.line(px3, py3, px4, py4)
        --love.graphics.line(px2, py2, px3, py3)

    end

end