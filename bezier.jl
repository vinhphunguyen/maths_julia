using Plots

function animate_bezier(px,py;steps=100)
    pnt_count  = length(px)         # number of points
    bs         = [zeros(2,r) for r=pnt_count:-1:0] # saving all points
    bs[1][1,:] = px   # the first points are the control Bézier points
    bs[1][2,:] = py
    points     = zeros(2,steps) # points on the Bezier curve, Q
    colors     = [:blue,:orange,:red,:yellow]
    c = 1
    anim = @animate for t in LinRange(0,1,steps)
        # the whole plot
        plot(;size=(400,400), axisratio=:equal, legend=false)
        # then the control points (no joining)
        plot!(px, py, linetype=:scatter)
        # loop
        for i=1:pnt_count-1
            pnt_count_i = size(bs[i],2)
            for j=1:pnt_count_i-1
                p1           = bs[i][:,j]
                p2           = bs[i][:,j+1]
                p12          = (1-t)*p1 + t*p2
                bs[i+1][:,j] = p12
                # plot segment P1-P2
                plot!(bs[i][1,j:j+1],bs[i][2,j:j+1], legend=false, color=colors[i])
                # plot the point p12 too
                plot!([p12[1]],[p12[2]], linetype=:scatter, legend=false, color=colors[i])
                # plot the Bezier curve, which is a collection of final P12 points
                if i==pnt_count-1
                    points[:,c] = p12
                    plot!(points[1,1:c],points[2,1:c], color=:black)
                    c += 1
                end
            end
        end
        filename = string("bezier","$(Int(c)).pdf")
        savefig(filename)
    end
    gif(anim, "bezier_d2.gif", fps=30)
end

px = [0,1,3,4]
py = [0,2,2,0]

animate_bezier(px,py;steps=100)
