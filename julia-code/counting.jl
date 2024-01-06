A = [-1,0,1,2]
B = [1,2,3,4]
C = [1,2,3,4]

count = 0; res = Tuple[]

for a in A 
	for b in B
		for c in C
			if ( a + b + c == 6 ) 
				global count=count+1; push!(res, (a, b, c))
			end
		end
	end
end

println(count)
println(res)

function counting(A,B,target)
	count = 0
	res = Tuple[]
	for a in A 
		for b in B
			if ( a + b  == target ) 
				count=count+1
				push!(res, (a, b))
			end
		end
	end
	return count,res 
end

count,res = counting([0,2,4,6,8,10],[0,3,6,9],10)
println(count)
println(res)