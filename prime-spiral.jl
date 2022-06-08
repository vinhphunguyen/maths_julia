using PrettyTables
using Plots
using LaTeXStrings
using Primes
using PyCall

plt = pyimport("matplotlib.pyplot")

function create_plot(nums,name;figsize=8)
    n0   = length(nums)
    x    = zeros(n0)
    y    = zeros(n0)

    for i =1:n0
      p    = nums[i]
      x[i] = p*cos(p)
      y[i] = p*sin(p)
    end

    plt.figure(figsize=(figsize, figsize))
    plt.axis("off")
    plt.scatter(x, y)
    #plt.show()
    plt.savefig(name,bbox_inches="tight")
end

n=100000
nums1 = primes(n)
nums2 = range(1,n,step=1)

create_plot(nums1,"prime-spiral1.pdf")
#create_plot(nums2,"integer-spiral.pdf")






