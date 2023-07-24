

function gcd_subtraction(a,b)
  if      ( a == b ) return a
  elseif  ( a > b  ) return gcd_subtraction(a-b,b)
  else               return gcd_subtraction(a,b-a)
  end
end


function gcd_division(a,b)
  if      ( a == 0  )
    return b
  elseif  ( a >  b  )
    return gcd_division(a%b,b)
  else    ( a <  b  )
    return gcd_division(b%a,a)
  end
end

println(gcd_subtraction(210,42))
println(gcd_division(210,84))
