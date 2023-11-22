using Pkg
using Random
#Pkg.add("JuliaAudio")
#Pkg.add("WAV")
using WAV, Plots, DSP, LinearAlgebra, PyCall 
using DelimitedFiles
using FFTW

#IPython = pyimport("IPython");

sample_rate = 100;
global generated_noises = Float64[];

function gen_wave(secs, sample_rate, amp, freq, shift, filename) 
	x = 0:1/sample_rate:secs;
	y = amp * sin.((2 * pi * freq * x ).+ shift)
	if filename != ""
		wavwrite(y, "$filename.wav", Fs=sample_rate) 
	end
	return y 
end;


# sine wave of 440 Hz frequency, shift = 0 
amp1 = 3.
amp2 = 1.
amp3 = .5

f1 = 1.
f2 = 4.
f3 = 7.

simple_wave1 = gen_wave(1, sample_rate, amp1, f1, 0, "")
simple_wave2 = gen_wave(1, sample_rate, amp2, f2, 0, "")
simple_wave3 = gen_wave(1, sample_rate, amp3, f3, 0, "")

simple_wave  = simple_wave1 + simple_wave2 + simple_wave3

display(plot([0:1/sample_rate:1],simple_wave,legend = false, title="Simple 440Hz Sine wave + Noise", xaxis="Time", yaxis= "Amplitude"))



# Discrete FOurie transform

function get_fourier_transform_matrix(N, given_sign_number)
	actual_sign = sign(given_sign_number) 
	F = zeros(N,N)
	F = complex(F)
	for j = 0:N-1
		for k = 0:N-1
			F[j+1,k+1] = get_ω(j, k, actual_sign)
		end 
    end
	F 
end;
#Generate ω for an j/k entry in the DFT/Fourier Matrix 
function get_ω(j, k, given_sign)
	ℯ^( ((given_sign*2π*im)/N)*j*k ) 
end;

N = length(simple_wave) 
println("Length of our wave: $N")
F = get_fourier_transform_matrix(N, 1)
Ω = get_fourier_transform_matrix(N, -1);
freq_domain = (1/N) * Ω*simple_wave

# plotting

freq_domain_norms = norm.(freq_domain)


display(plot(1:N,freq_domain_norms,legend = false, title="Simple 440Hz Sine wave + Noise", xaxis="freq", yaxis= "Amplitude"))

# write to CSV to be plotted in Asymptote

data = hcat(0:1/sample_rate:1, simple_wave, 1:N, freq_domain_norms)

header = ["t" "ft" "freq" "amp"]
writedlm( "wave.csv",  [header;data], ',')

# noise filtering 

freq_domain[3]=0
filtered_wave=real.(F*freq_domain)


display(plot([0:1/sample_rate:1],filtered_wave,legend = false, title="filtered wave", xaxis="Time", yaxis= "Amplitude"))
