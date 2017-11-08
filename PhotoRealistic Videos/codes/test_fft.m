bpFilt = designfilt('bandpassfir','FilterOrder',20, ...
         'CutoffFrequency1',4,'CutoffFrequency2',8, ...
         'SampleRate',24);
%fvtool(bpFilt)

x=importdata('x.mat');
ans=fft(x);
xdft = ans(1:length(x)/2+1); 
freq = 0:24/length(x):12;
plot(freq,abs(xdft));

dataIn1 = x;
d=fdesign.bandpass('N,F3dB1,F3dB2',20,5/6,8/6,24);
Hd=design(d,'butter');
xf=filter(Hd,dataIn1);

%dataOut1 = filter(bpFilt,x);
ans=fft(xf);
xdft = ans(1:length(x)/2+1); 
freq = 0:24/length(x):12;
aa=abs(xdft);
plot(freq,abs(xdft));

% y=importdata('y.mat');
% dataIn1 = x;
% dataOut1 = filter(bpFilt,x);
% dataIn2 = y;
% dataOut2 = filter(bpFilt,y);
% alpha=std(dataOut1)/std(dataOut2);
% S=dataOut1-alpha*dataOut2;
% 
% ans=fft(S);
% %% important
% xdft = ans(1:length(x)/2+1); 
% freq = 0:24/length(x):12;
% plot(freq,abs(xdft));
