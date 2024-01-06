using Javis, Colors
function ground(args...)
    background("black")
    sethue("white")
    translate(-args[1].width/2+50, 0)
    scale(700, 150)
end

function wave(xs, ys, opacity, color)
    setline(1.5)
    setopacity(opacity)
    sethue(color)
    points = Vector{Point}(undef, length(xs))
    for (x, y, i) in zip(xs, ys, 1:length(xs))
        points[i] = Point(x, y)
    end
    prettypoly(points, :stroke, ()->())
end

function term(x, i)
    return 4/π * sin.(2π*(2i-1)*x)/(2i-1)
end

function sum_term(x, k)
    k == 0 && return zeros(length(x))
    return sum(term(x, i) for i in 1:k)
end

nframes         = 300
frames_per_wave = 40
video           = Video(800, 600)
Background(1:nframes, ground)

x = 0.0:0.001:1.0
k = 6
colors = [RGB(0.0, 1.0, 0.4), RGB(0, 1.0, 1.0), RGB(1.0, 0.25, 0.25), RGB(1.0, 1.0, 0.0), RGB(1.0, 0.5, 1.0), RGB(0.75, 0.75, 1.0)]
waves = Object[]
for i = 1:k
    frames = frames_per_wave*(i-1)+1:nframes
    push!(waves, Object(frames, (args...; y=term(x,i)) -> wave(x, y, 0.5, colors[i])))
    act!(waves[end], Action(5:frames_per_wave,
                    change(:y, term(x,i) => sum_term(x, i))))
end

sum_wave = Object(1:nframes, (args...; y=zeros(length(x)))->wave(x, y, 1.0, "white"))
for i = 1:k
    act!(sum_wave, Action(frames_per_wave*(i-1)+1:frames_per_wave*i,
                         change(:y, sum_term(x, i-1) => sum_term(x, i))))
end

render(video; pathname="fourier_1D.gif")
