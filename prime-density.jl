using PrettyTables
using Plots
using LaTeXStrings
using Primes
using PyCall


mpl = pyimport("matplotlib")
sym = pyimport("sympy")
plt = pyimport("matplotlib.pyplot")
pat = pyimport("matplotlib.patches")

rcParams = PyDict(mpl["rcParams"])
rcParams["font.size"] = 12
rcParams["text.usetex"] = 1
rcParams["font.family"] = "serif"
rcParams["axes.labelsize"] = 12
rcParams["legend.fontsize"] = 12
rcParams["xtick.labelsize"] = 12
rcParams["ytick.labelsize"] = 12

function set_size()
	width_pt = 300.
	inches_per_pt = 1 / 72.27
	golden_ratio = 1.
	fig_width_in  = width_pt * inches_per_pt # Figure width in inches
	fig_height_in = fig_width_in * golden_ratio
	fig_dim = ( fig_width_in , fig_height_in )
	return fig_dim
end

# count primes from 1 to n π(n)
function prime_n(n)
  counter= 0
  for i=1:n
    if (  isprime(i) ) counter += 1 end
  end
  return counter
end


data = zeros(7,3)
data[:,1] = [100 1000 10000 100000 1000000 10000000 100000000]

for i=1:size(data,1)
  data[i,2] = prime_n(Int(data[i,1]))
  data[i,3] = data[i,2]/data[i,1]
end

pretty_table(data, ["n", "S1", "s3"],formatters = ft_printf("%5.8f"))
pretty_table(data, ["n", "S1", "S3"], backend = :latex)#,formatters = ft_printf("%d %d %5.3f",[1 2 3]))

# plot the prime counting function

range1=1:10^2
range2=1:10^3
range3=1:10^4

pi1 = [sym.primepi(i) for i in range1]
pi2 = [sym.primepi(i) for i in range2]
pi3 = [sym.primepi(i) for i in range3]
log3 = [i/log(i) for i in range3]

# fig , ax = plt.subplots(1, 3)
# ax[1].step(range1,pi1)
# ax[2].step(range2,pi2)
# ax[3].step(range3,pi3)
# plt.tight_layout()
# plt.savefig("counting-prime-func.pdf",bbox_inches="tight")

fig = plt.figure(figsize=set_size())
plt.step(range1,pi1)
plt.savefig("counting-prime-func1.pdf",bbox_inches="tight")

fig = plt.figure(figsize=set_size())
plt.step(range2,pi2)
plt.savefig("counting-prime-func2.pdf",bbox_inches="tight")

fig = plt.figure(figsize=set_size())
plt.step(range3,pi3)
plt.plot(range3,log3)
plt.savefig("counting-prime-func3.pdf",bbox_inches="tight")



data = zeros(4,4)
data[:,1] = [10^6, 10^7,10^8,10^9]

for i=1:size(data,1)
  data[i,2] = sym.primepi(Int(data[i,1]))
  data[i,3] = data[i,1]/data[i,2]
end


for i=1:size(data,1)-1
  data[i,4] = data[i+1,3]-data[i,3]
end

pretty_table(data, ["n", "S1", "s3", "s4"],formatters = ft_printf("%5.8f"))
pretty_table(data, ["n", "S1", "S3","s4"], backend = :latex)#,formatters = ft_printf("%d %d %5.3f",[1 2 3]))
