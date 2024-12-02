using SymPy
@syms x y
binomial(4,2)
simplify((x^3 + x^2 - x - 1) / (x^2 + 2x + 1))
expand((x+1)^2)
factor(x^3 - x^2 + x - 1)
apart((4x^3 + 21x^2 + 10x + 12) / (x^4 + 5x^3 + 5x^2 + 4x))
solve(x^3 - 2x^2 + 2x - 1,x)
equation1 = x^3 + 9x^2 * y - 10
equation2 = y^3 + x * y^2 - 2
solutions = solve([equation1, equation2], [x, y]) # system of equations
diff(cos(x), x)
diff(x^4,x,3)
integrate(x^2,x)
limit(sin(x) / x, Pair(x, 0.0))
expr = exp(x)
expr.series(x, 0, 5)


# Example 1: Compute the double integral of x^2 + y^2 over [0, 1] x [0, 1]
f1 = x^2 + y^2
integral1 = integrate(integrate(f1, (x, 0, 1)), (y, 0, 1))
println("Double Integral of x^2 + y^2 over [0, 1] x [0, 1]: ", integral1)

# Example 2: Compute the double integral of sin(x) * cos(y) over [0, π] x [0, π/2]
f2 = sin(x) * cos(y)
integral2 = integrate(integrate(f2, (x, 0, π)), (y, 0, π / 2))
println("Double Integral of sin(x) * cos(y) over [0, π] x [0, π/2]: ", integral2)

