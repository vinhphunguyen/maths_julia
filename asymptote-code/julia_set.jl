

#barnsley_fern(1_000_000)

f(z, c) = z*z + c
function is_stable(iter, z, c)
    for _ in 1:iter
        if abs(z) > 2
            return false
        end
        z = f(z, c)
    end
    true
end

function mandel(precision, X, Y, f) # passing this f will be explained just after
    Points = Tuple{Float64, Float64}[]
    for x in X
        for y in Y
            z = f(x, y)
            if is_stable(precision, z, z)
                push!(Points, (x, y))
            end
        end
    end
    scatter(Points, markersize=1)
end


function julia(precision, X, Y, c, f)
    Points = Tuple{Float64, Float64}[]
    for x in X
        for y in Y
            z = f(x, y)
            if is_stable(precision, z, c)
                push!(Points, (x, y))
            end
        end
    end
    scatter(Points, markersize=4)
end

#mandel(80, -2:0.0025:2, -2:0.0025:2, Complex) |> display
#sleep(10)
#julia(80, -2:0.0005:2, -2:0.0005:2, -0.8im, Complex) |> display

using Colors
using ColorVectorSpace
using FileIO
using REPL
using ImageTransformations
using ImageView

@inline function inv_julia_map(z, c, n)
    ws = (1.0, exp(2/3*pi*im), exp(-2/3*pi*im))
    ws[n]*(z - c)^(1/3)
end

@inline function map_color(color, colors, n)
    weight = 0.7
    weight*colors[n] + (1-weight)*color
end

@inline function iter((z,color), n, c, colors)
    z2 = inv_julia_map(z, c, n)
    color2 = map_color(color, colors, n)
    (z2, color2)
end

function tone_map(col, exposure, exponent)
    if col == RGB(0,0,0)
        return col
    end
    a = xyY(col)
    Y = a.Y
    Y = exposure*Y^exponent
    Y = Y / (1 + Y)
    c = xyY(a.x, a.y, Y)
    typeof(col)(c)
end

function gen_samples(c, xrange, yrange, hdr_exposure, hdr_exponent)
    Col = RGB{Float32}
    julia_purple  = Col(0.584, 0.345, 0.698)
    julia_green   = Col(0.22, 0.596, 0.149)
    julia_red     = Col(0.796, 0.235, 0.2)

    colors = (julia_purple, julia_green, julia_red)

    colored_set = fill(Col(0,0,0), length(xrange), length(yrange))
    hit_counter = fill(UInt8(0), length(xrange), length(yrange))

    hitmax = 20

    state = (0.0 + 0.0im, RGB(0.0,0.0,0.0))
    # Find a point on the attractor
    for i=1:1000
        n = 1
        state = iter(state, n, c, colors)
    end
    to_explore = [state]
    eps_x = step(xrange)/100
    eps_y = step(xrange)/100
    invdx = inv(step(xrange))
    invdy = inv(step(yrange))
    # Determenistically draw a tree of samples from the attractor but avoid
    # sampling the same points. Somewhat inspired by
    # https://www.marksmath.org/scholarship/Julia.pdf
    while !isempty(to_explore)
        state = pop!(to_explore)
        z,col = state
        ix = round(Int, (real(z) - first(xrange))*invdx)
        iy = round(Int, (imag(z) - first(yrange))*invdy)
        if !(1 <= ix <= length(xrange) && 1 <= iy <= length(yrange))
            # Hack: only keep points which remain inside the plot - otherwise
            # we can't bound the growth of to_explore
            @warn "Dropped point $z outside plot range"
            continue
        end
        if hit_counter[ix, iy] < hitmax
            hit_counter[ix, iy] += 1
            colored_set[ix, iy] += col
            push!(to_explore, iter(state, 1, c, colors))
            push!(to_explore, iter(state, 2, c, colors))
            push!(to_explore, iter(state, 3, c, colors))
            # Generate new points from trajectories which explore new parts of
            # the space.
            #=
            for i=-1:1
                for j=-1:1
                    z2 = z + i*eps_x + j*eps_y*im
                    s = (z2,col)
                    push!(to_explore, iter(s, 1, c, colors))
                    push!(to_explore, iter(s, 2, c, colors))
                    push!(to_explore, iter(s, 3, c, colors))
                end
            end
            =#
        end
    end
    tone_map.(colored_set, hdr_exposure, hdr_exponent)
end


function loop_with_arrow_keys(f)
    term = REPL.TerminalMenus.terminal
    raw_mode_enabled = REPL.TerminalMenus.enableRawMode(term)
    try
        # Approach stolen from TerminalMenus
        raw_mode_enabled && print(term.out_stream, "\x1b[?25l") # hide the cursor
        result = nothing
        increment = (0,0)
        while true
            k = REPL.TerminalMenus.readKey()
            if k == 3 # CTRL_C
                break
            end
            inc = k == Int(REPL.TerminalMenus.ARROW_UP)    ? (0,  1) :
                  k == Int(REPL.TerminalMenus.ARROW_DOWN)  ? (0, -1) :
                  k == Int(REPL.TerminalMenus.ARROW_LEFT)  ? (-1, 0) :
                  k == Int(REPL.TerminalMenus.ARROW_RIGHT) ? (1,  0) :
                  (0,0)
            increment = increment .+ inc
            if bytesavailable(term.in_stream) == 0
                # Avoid input lag
                result = f(increment, Char(k))
                increment = (0,0)
            end
        end
        return result
    finally
        if raw_mode_enabled
            print(term.out_stream, "\x1b[?25h") # unhide cursor
            REPL.TerminalMenus.disableRawMode(term)
        end
    end
end


len = 1000
xrange = range(-1.3, 1.3, length=len)
yrange = range(-1.3, 1.3, length=len)

#c = -0.45 + 0.75im
#c = -0.23 + 0.72im
#c = -0.22 + 0.73im
#c = -0.09 + 0.79im
#c = -0.1  + 0.79im
#c = -0.16 + 0.75im
c = -0.067 + 0.766im
#c = -0.033 + 0.769im
@info "Drawing julia set" c
incsize = 0.0001
hdr_exposure = 0.5f0
hdr_exponent = 0.5f0
colored_set = gen_samples(c, xrange, yrange, hdr_exposure, hdr_exponent)
guidict = imshow(colored_set)
loop_with_arrow_keys() do increment, key
    global colored_set, c, hdr_exposure, hdr_exponent
    if key == 's'
        save("julia.png", (colored_set))
        return
    end
    if key == ']'
        hdr_exposure *= 2.0f0
    elseif key == '['
        hdr_exposure /= 2.0f0
    end
    if key == ')'
        hdr_exponent *= 2.0f0
    elseif key == '('
        hdr_exponent /= 2.0f0
    end
    c += incsize*(increment[1] + im*increment[2])
    @info "Drawing julia set" c hdr_exposure hdr_exponent
    colored_set = gen_samples(c, xrange, yrange, hdr_exposure, hdr_exponent)
    imshow!(guidict["gui"]["canvas"], colored_set)
end
ImageView.Gtk.destroy(guidict["gui"]["window"])
