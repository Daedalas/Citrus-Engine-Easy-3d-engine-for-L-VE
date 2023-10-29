vector = {}

-- Vector directions
vector.UP = {0, 1, 0}
vector.LEFT = {-1, 0, 0}
vector.DOWN = {0, -1, 0}
vector.RIGHT = {1, 0, 0}
vector.FORWARD = {0, 0, 1}
vector.BACKWARD = {0, 0, -1}

function vector.new(xx, yy)

    if xx and yy then

        return {xx, yy}

    else

        return {0, 0}

    end

end

return vector