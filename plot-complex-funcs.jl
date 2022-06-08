using Plots, ComplexPortraits
@ComplexPortraits.import_normal

using ImageMagick
using FileIO

phaseplot(-1.0 + 1.0im, 1.0 - 1.0im, z -> tan(z);
           no_pixels=(600, 600),
           point_color=cs_m(),
           no_ticks=(7, 7),
           ticks_sigdigits=2)



