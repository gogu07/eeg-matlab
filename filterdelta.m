function Hd = filterdelta
%FILTER Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 8.3 and the DSP System Toolbox 8.6.
% Generated on: 24-May-2016 21:28:02

% Equiripple Lowpass filter designed using the FIRPM function.

% All frequency values are in Hz.
Fs = 1000;  % Sampling Frequency

Fpass = 3.8;             % Passband Frequency
Fstop = 4.2;             % Stopband Frequency
Dpass = 0.057501127785;  % Passband Ripple
Dstop = 0.0001;          % Stopband Attenuation
dens  = 20;              % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fpass, Fstop]/(Fs/2), [1 0], [Dpass, Dstop]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dsp.FIRFilter('Numerator', b);

% [EOF]
