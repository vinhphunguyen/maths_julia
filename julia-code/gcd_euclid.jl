using BenchmarkTools

function gcd_subtraction(a,b)
  if      ( a == b ) return a
  elseif  ( a > b  ) return gcd_subtraction(a-b,b)
  else               return gcd_subtraction(a,b-a)
  end
end


function gcd_division_recursive(a,b)
  if      ( b == 0  )
    return a
  else    
    return gcd_division_recursive(b, a % b)
  end 
end

function gcd_division(a, b)
  if (a < b )
    a = b 
    b = a
  end
  
  while ( a % b != 0)
      r = a % b
      a = b
      b = r
  end
  return b
end

a = 123456
b = 7890
res1 = @btime gcd_subtraction(a,b)
res2 = @btime gcd_division_recursive(a,b)
res3 = @btime gcd_division(a,b)
