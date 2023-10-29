return function(pos, rot, fs)

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