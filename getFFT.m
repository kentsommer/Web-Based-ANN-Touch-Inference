function [ fftOX, fftOY, fftOZ, fftMX, fftMY, fftMZ, fftrAlpha, fftrBeta, fftrGama, fftMGX, fftMGY, fftMGZ ] = getFFT( OX, OY, OZ, MX, MY, MZ, rAlpha, rBeta, rGama, MGX, MGY, MGZ )
% returns Fast Fourier Transform of Sequence

fftOX = [fft(OX(1,:)) ; OX(2,:)];
fftOY = [fft(OY(1,:)) ; OY(2,:)];
fftOZ = [fft(OZ(1,:)) ; OZ(2,:)];

fftMX = [fft(MX(1,:)) ; MX(2,:)];
fftMY = [fft(MY(1,:)) ; MY(2,:)];
fftMZ = [fft(MZ(1,:)) ; MZ(2,:)];

fftrAlpha = [fft(rAlpha(1,:)) ; rAlpha(2,:)];
fftrBeta = [fft(rBeta(1,:)) ; rBeta(2,:)];
fftrGama = [fft(rGama(1,:)) ; rGama(2,:)];

fftMGX = [fft(MGX(1,:)) ; MGX(2,:)];
fftMGY = [fft(MGY(1,:)) ; MGY(2,:)];
fftMGZ = [fft(MGZ(1,:)) ; MGZ(2,:)];


end

