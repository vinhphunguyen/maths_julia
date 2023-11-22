import numpy as np
import matplotlib.pyplot as plt
from PIL import Image
from dataclasses import dataclass
from math import log
from typing import Union

# The function  will return a two-dimensional array of complex numbers enclosed in a rectangular area given by four parameters

# def complex_matrix(xmin, xmax, ymin, ymax, pixel_density):
#     re = np.linspace(xmin, xmax, int((xmax - xmin) * pixel_density))
#     im = np.linspace(ymin, ymax, int((ymax - ymin) * pixel_density))
#     return re[np.newaxis, :] + im[:, np.newaxis] * 1j

# # the function creates a two-dimensional mask of Boolean values 

# def is_stable(c, num_iterations):
#     z = 0
#     for _ in range(num_iterations):
#         z = z ** 2 + c
#     return abs(z) <= 2

# # This function will return a one-dimensional array comprised of only those complex numbers that are stable and therefore belong to the Mandelbrot set.

# def get_members(c, num_iterations):
#     mask = is_stable(c, num_iterations)
#     return c[mask]
   

# c = complex_matrix(-2, 0.5, -1.5, 1.5, pixel_density=512)
# plt.imshow(is_stable(c, num_iterations=20), cmap="binary")
# plt.gca().set_aspect("equal")
# plt.axis("off")
# plt.tight_layout()
# plt.show()

# c = complex_matrix(-2, 0.5, -1.5, 1.5, pixel_density=512)
# image = Image.fromarray(~is_stable(c, num_iterations=20))
# image.show()


# mandelbrot.py

from dataclasses import dataclass
from math import log

@dataclass
class MandelbrotSet:
    max_iterations: int
    escape_radius: float = 2.0

    def __contains__(self, c: complex) -> bool:
        return self.stability(c) == 1

    def stability(self, c: complex, smooth=False, clamp=True) -> float:
        value = self.escape_count(c, smooth) / self.max_iterations
        return max(0.0, min(value, 1.0)) if clamp else value

    def escape_count(self, c: complex, smooth=False) -> Union[int, float]:
        z = 0
        for iteration in range(self.max_iterations):
            z = z ** 2 + c
            if abs(z) > self.escape_radius:
                if smooth:
                    return iteration + 1 - log(log(abs(z))) / log(2)
                return iteration
        return self.max_iterations


mandelbrot_set = MandelbrotSet(max_iterations=60)

width, height = 1000, 1000
scale = 0.0075
GRAYSCALE = "RGB" # stands for luminance. In this mode, each pixel takes an integer value between 0 and 255, that's why: int(instability * 255)


image = Image.new(mode=GRAYSCALE, size=(width, height))

for y in range(height):
    for x in range(width):
        # you scale and translate each point from pixel coordinates to world coordinates. 
        c = scale * complex(x - width / 2, height / 2 - y)
        instability = 1 - mandelbrot_set.stability(c,smooth=True)
        image.putpixel((x, y), int(instability * 255))

image.show()