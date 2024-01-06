function ground(args...)
    background("white") # canvas background
    sethue("black") # pen color
end

function object(p=O, color="black")
    sethue(color)
    circle(p, 25, :fill)
    return p
end

function path!(points, pos, color)
    sethue(color)
    push!(points, pos) # add pos to points
    circle.(points, 2, :fill) # draws a circle for each point using broadcasting
end

function connector(p1, p2, color)
    sethue(color)
    line(p1,p2, :stroke)
end

myvideo = Video(500, 500)

path_of_red = Point[]
path_of_blue = Point[]

Background(1:70, ground)
red_ball = Object(1:70, (args...)->object(O, "red"), Point(100,0))
act!(red_ball, Action(anim_rotate_around(2π, O)))
blue_ball = Object(1:70, (args...)->object(O, "blue"), Point(200,80))
act!(blue_ball, Action(anim_rotate_around(2π, 0.0, red_ball)))
Object(1:70, (args...)->connector(pos(red_ball), pos(blue_ball), "black"))
Object(1:70, (args...)->path!(path_of_red, pos(red_ball), "red"))
Object(1:70, (args...)->path!(path_of_blue, pos(blue_ball), "blue"))

render(myvideo; pathname="tutorial_1.gif")
