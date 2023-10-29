matrix = {}

function matrix.degtorad(r)

    return (180/math.pi)*r

end

function matrix.getRotationMatrixXZ(x, z, rot)
    return z * math.sin(rot) + x * math.cos(rot), z * math.cos(rot) - x * math.sin(rot)
end

function matrix.getRotationMatrixYZ(y, z, rot)
    return z * math.sin(rot) + y * math.cos(rot), z * math.cos(rot) - y * math.sin(rot)
end

function matrix.getRotationMatrixXY(x, y, rot)
    return y * math.cos(rot) + x * math.sin(rot), y * math.sin(rot) - x * math.cos(rot)
end

function matrix.getProjectionMatrix(vertices, face, cam, pos, rot, size)
    
    -- Rotation Matrix for Object
    local res_x, res_z = matrix.getRotationMatrixXZ(pos.x*size.x+vertices[face][1], pos.z*size.z+vertices[face][3], rot.y)
    local res_y = (0-pos.y*size.y)+vertices[face][2]

    local r_y, r_z = matrix.getRotationMatrixYZ(res_y*size.y, res_z*size.z, rot.x)
    local rr_x, rr_y = matrix.getRotationMatrixXY(res_x*size.x, r_y*size.y, rot.z)
    
    -- Rotation Matrix for Camera
    local rc_x, rc_z = matrix.getRotationMatrixXZ(cam.position.x+rr_x, cam.position.z+r_z, 0-cam.rotation.x)
    local rc_y = cam.position.y+rr_y

    local rrc_y, rrc_z = matrix.getRotationMatrixYZ(rc_y, rc_z, 0-cam.rotation.y)
    local rrc_x, rrc_y2 = matrix.getRotationMatrixXY(rc_x, rrc_y, 0-cam.rotation.z)

    return (rrc_x*cam.fov/rrc_z*cam.fov)+love.graphics.getWidth()/2, rrc_y2*cam.fov/rrc_z*cam.fov+love.graphics.getHeight()/2

end

return matrix