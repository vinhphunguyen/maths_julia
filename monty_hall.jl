using Plots
using LaTeXStrings
using PrettyTables
using PyCall


mpl = pyimport("matplotlib")
plt = pyimport("matplotlib.pyplot")
pat = pyimport("matplotlib.patches")
sns = pyimport("seaborn")

sns.set_style("ticks") # dark_background, 

rcParams = PyDict(mpl["rcParams"])
rcParams["font.size"] = 16
rcParams["text.usetex"] = 1
rcParams["font.family"] = "serif"
rcParams["axes.labelsize"] = 16
rcParams["legend.fontsize"] = 16
rcParams["xtick.labelsize"] = 16
rcParams["ytick.labelsize"] = 16

function set_size()
	width_pt = 468.
	inches_per_pt = 1 / 72.27
	golden_ratio = 0.75
	fig_width_in = width_pt * inches_per_pt # Figure width in inches 
	fig_height_in = fig_width_in * golden_ratio 
	fig_dim = ( fig_width_in , fig_height_in )
	return fig_dim
end


function monty_hall_one_trial(changed)
  # assume that door 1 has the car 
  # we select one door, can be any of (1,2,3,...)
  number_of_doors = 3	
  chosen_number   = rand(1:number_of_doors)

  # if the contestant decided to change
  if changed == 1
    if chosen_number == 1 revealed_number = rand(2,3) end
    if chosen_number == 2 revealed_number = 3 end
    if chosen_number == 3 revealed_number = 2 end

    #availabel_doors = [ d for d in 1:number_of_doors if d ∉ (chosen_number,revealed_number)]
    avai_doors = setdiff(1:number_of_doors, (chosen_number,revealed_number))
    chosen_number = rand(avai_doors)
  end 

  return chosen_number == 1
end 

N = 10000
wins_changed   =sum([monty_hall_one_trial(1) for _ in 1:N])
wins_no_changed=sum([monty_hall_one_trial(0) for _ in 1:N])
println(wins_changed/N)
println(wins_no_changed/N)
