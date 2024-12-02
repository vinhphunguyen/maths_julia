# code to plot electric field, field lines and equipotential surfaces

using LaTeXStrings, PyCall, LazyGrids

plt = pyimport("matplotlib.pyplot")

# Define the Charge type (2D)
struct Charge
    q::Float64
    pos::Tuple{Float64, Float64}
end

k = 1 # Coulomb's constant

# Function to calculate the electric field of a point charge
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

# Function to calculate the total electric field from multiple charges
# Principle of superposition
function E_total(x, y, charges)
    Ex, Ey = 0.0, 0.0
    for C in charges
        E = E_point_charge(C, x, y)
        Ex += E[1]
        Ey += E[2]
    end
    return Ex, Ey
end

# Function to calculate the direction of the electric field
function E_dir(t, y, charges)
    Ex, Ey = E_total(y[1], y[2], charges)
    n = sqrt(Ex^2 + Ey^2)
    return Ex / n, Ey / n
end

# Function to calculate the electric potential of a point charge
function V_point_charge(c, x, y)
    q, a = c.q, c.pos
    return q / sqrt((x - a[1])^2 + (y - a[2])^2)
end

# Function to calculate the total electric potential from multiple charges
function V_total(x, y, charges)
    V = 0.0
    for C in charges
        Vp = V_point_charge(C, x, y)
        V += Vp
    end
    return V
end


# charges and positions
Q = [Charge(1, (-.5,0)), 
     Charge(-1, (.5,0))
     ] # dipole

# Create the list of charges
# nq  = 8
# Q = [Charge(i % 2 * 2 - 1, (cos(2 * π * i / nq), sin(2 * π * i / nq))) for i in 0:(nq-1)]


xc = [q.pos[1] for q in Q]
yc = [q.pos[2] for q in Q]     

# Define the grid
x1, y1 = -2.0, -2.0
x2, y2 = 2.0, 2.0
m  = 101
xs = LinRange(x1, x2, m)
ys = LinRange(y1, y2, m)

#Ex, Ey = [E_total(x, y, Q) for y in ys, x in xs] |> x -> (reshape(map(first, x), m, m), reshape(map(last, x), m, m))

Ex = zeros(m, m)
Ey = zeros(m, m)
V  = zeros(m, m)

# Compute the total electric field at all points of the grid
for j in 1:m
    for i in 1:m
        Ex[j, i], Ey[j, i] = E_total(xs[i], ys[j], Q)
        V[j,i] = V_total(xs[i], ys[j], Q)
    end
end

epsilon = 1e-9 # Small value to avoid division by zero
min_distance = 0.5 # Minimum distance from charges to plot vectors

# Filter points that are too close to any charge
function filter_points(xs, ys, Ex, Ey, Q, min_distance)
    mask = [all(sqrt((x - c.pos[1])^2 + (y - c.pos[2])^2) > min_distance for c in Q) for y in ys, x in xs]
    indices = findall(mask)
    xs_filtered = [xs[i] for i in indices]
    ys_filtered = [ys[i] for i in indices]
    Ex_filtered = [Ex[i] for i in indices]
    Ey_filtered = [Ey[i] for i in indices]
    return xs_filtered, ys_filtered, Ex_filtered, Ey_filtered
end


xs_filtered, ys_filtered, Ex_filtered, Ey_filtered = filter_points(xs, ys, Ex, Ey, Q, min_distance)


# Plot the results matplotlib 

fig = plt.figure(figsize=(4, 4))
ax = fig.add_subplot(1, 1, 1)
ax.axis("off")

plt.scatter(xc, yc, color=:red, s=16)
ax.quiver(xs_filtered, ys_filtered, Ex_filtered, Ey_filtered, pivot="mid", units="inches", scale=1)
plt.streamplot(xs, ys, Ex, Ey, linewidth=0.12, density=1.1)
#CS = ax.contour(xs, ys, V, collect(-6:1:6), colors="k", linewidths=.6)
#ax.clabel(CS, fontsize=4, inline="True")
plt.savefig("field.pdf")