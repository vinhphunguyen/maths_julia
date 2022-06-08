using PrettyTables
using Plots
using LaTeXStrings

function ramanujan_pi()
  print("Enter the number of terms: ")
  iter_count = parse(Int32, readline())

  data = zeros(iter_count,2)

  over_pi = 0.
  fac  = 2*sqrt(2) / 9801
  for k=0:iter_count
     over_pi += factorial(4*k)*(1103+26390*k)/(factorial(k))^4/396^(4*k)
  end
  over_pi *= fac
  pi = 1 / over_pi
  println(pi)
end 

ramanujan_pi()
