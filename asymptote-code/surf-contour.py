import numpy as np
#from mpl_toolkits.mplot3d import axes3d
import matplotlib.pyplot as plt

fig = plt.figure()

N_points=100
x = np.linspace(-10, 10, N_points)  
y = np.linspace(-10, 10, N_points)  
  
X, Y = np.meshgrid(x, y)
Z=np.sin(np.sqrt(X**2 + Y**2))/np.sqrt( X**2 + Y**2 )

fig = plt.figure()
ax = fig.add_subplot(projection='3d')

ax.plot_surface(X, Y, Z)

ax.contour(X, Y, Z, 10, lw=3, colors="k", linestyles="solid", offset=1.2)
#ax.contour(X, Y, Z, 10, lw=3, colors="k", linestyles="solid")

plt.savefig("surf-contour.pdf",bbox_inches='tight')

   

plt.show()
