return function(meshtype, pos, rot, size)

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
            
            scale = {

                x = size[1],
                y = size[2],
                z = size[3]

            }

        }

    end

    if meshtype == "rectpyramid" then

        return {

            mesh = {

                vertices = {

                    {-1, 1, 1}, --Front Left
                    {1, 1, 1},  --Front Right
                    {-1, 1, -1},--Back Left
                    {1, 1, -1}, --Back Right
                    {0, -1, 0}  --Tip

                },

                faces = {

                    {1, 2, 3, 4},
                    {3, 4, 5},
                    {1, 3, 5},
                    {2, 4, 5},
                    {1, 2, 5},
                    {4, 5, 2}

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
            scale = {

                x = size[1],
                y = size[2],
                z = size[3]

            }

        }

    end

end