function my_sequence1(n::Int)

  if ( ( n == 0 ) || ( n == 1 ) ) 
  	return 0
  elseif ( n == 2 )
  	return 1
  else
  	return BigInt(my_sequence1(n-1) + my_sequence1(n-3));
  end
end

#x = my_sequence1(2021);
#display(x);


function my_sequence(n::Int, cache::Vector{BigInt})
    if n <= 2
        return n == 2 ? 1 : 0
    elseif n <= length(cache) && cache[n] != 0
        return cache[n]
    else
        result = BigInt(my_sequence(n - 1, cache) + my_sequence(n - 3, cache))
        ##if n <= length(cache)
            cache[n] = result
        #end
        return result
    end
end

function compute_my_sequence(n::Int)
    cache = zeros(BigInt, n)
    return my_sequence(n, cache)
end

@time x = compute_my_sequence(20210)
#display(x)

function my_sequence2(n::Int)
  res    = zeros(BigInt, n)
  res[1] = 0
  res[2] = 0
  res[3] = 1
  for i=4:n
    res[i] = res[i-1]+res[i-3]
  end
  return res[n]
end

@time x = my_sequence2(20210)
display(x)

