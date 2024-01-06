x=[20, 22, 26, 21, 25, 28, 18, 19]
mu=22

n=length(x)
xb=sum(x)/n
a=[(xi-xb)^2 for xi in x]
s=sqrt(sum(a)/(n-1))

t=(xb-mu)*sqrt(n)/s



P,L,b,d=1400,100,9,5
P*L/b/d^2
