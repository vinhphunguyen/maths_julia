
using PyCall

plt = pyimport("matplotlib.pyplot")

struct Charge 
    q::Float64
    pos::Tuple{Float64, Float64} # vitri trong mat phang
end

function E_point_charge(c, x, y)
    q, a = c.q, c.pos
    dx   = x - a[1]
    dy   = y - a[2]
    r    = sqrt(dx^2 + dy^2)
    E    =  q / r^2
    Ex   =  E * (dx/r)
    Ey   =  E * (dy/r)

    return Ex, Ey
end

function E_total(charges, x,y)
    Ex, Ey = 0.0, 0.0
    for C in charges
        E = E_point_charge(C, x, y)
        Ex += E[1]
        Ey += E[2]
    end
    return Ex, Ey
end

# charges and positions
Q = [Charge(1, (0.0, -0.5)),
     Charge(1, (0.0, 0.5))] # dipole