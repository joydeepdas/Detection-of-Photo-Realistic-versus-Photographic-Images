Fs = 1e3;
t = linspace(0,1,1e3);
x = cos(2*pi*250*t)+randn(size(t));
xdft = fft(x);
xdft = xdft(1:length(x)/2+1); % only retaining the positive frequencies
freq = 0:Fs/length(x):500; % frequency vector from 0 to the Nyquist
[~,maxindex] = max(abs(xdft));
fprintf('The maximum occurs at %2.1f Hz\n', freq(maxindex));