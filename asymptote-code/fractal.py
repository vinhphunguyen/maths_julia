from PIL import Image
from mandelbrot import MandelbrotSet
from viewport import Viewport
import matplotlib.cm


def paint(mandelbrot_set, viewport, palette, smooth):
     for pixel in viewport:
         stability = mandelbrot_set.stability(complex(pixel), smooth)
         index = int(min(stability * len(palette), len(palette) - 1))
         pixel.color = palette[index % len(palette)]

def denormalize(palette):
     return [
         tuple(int(channel * 255) for channel in color)
         for color in palette
     ]

colormap = matplotlib.cm.get_cmap("Oranges").colors
palette = denormalize(colormap)

mandelbrot_set = MandelbrotSet(max_iterations=30, escape_radius=2)
image          = Image.new(mode="RGB", size=(2000, 2000))
viewport = Viewport(image, center=-.74364990+.131882j, width=.00073801 )
viewport = Viewport(image, center=-0.5, width=2.5 )
paint(mandelbrot_set, viewport, palette, smooth=True)
image.show()