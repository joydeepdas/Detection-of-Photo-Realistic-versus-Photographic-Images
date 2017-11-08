clear all;
%% filter
d=fdesign.bandpass('N,F3dB1,F3dB2',20,5/6,8/6,29.97);
Hd=design(d,'butter');

%% data
x=importdata('kunal_X.mat');
y=importdata('kunal_Y.mat');
xf=filter(Hd,x);
yf=filter(Hd,y);

%% pulse extraction

alpha = std(xf)/std(yf);
S=xf-alpha*yf;
ans=fft(S);

%% important
xdft = ans(1:length(x)/2+1); 
freq = 0:30/length(x):15;
freq = freq*60;
plot(freq,abs(xdft));


