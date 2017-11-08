clear all;
noses=importdata('ravi/kunal.mat');
[m,n]=size(noses);
for i=1:n
    image_nose=cell2mat(noses(i));
    R=image_nose(:,:,1);
    G=image_nose(:,:,2);
    B=image_nose(:,:,3);
    avg_r=mean(mean(R));
    avg_g=mean(mean(G));
    avg_b=mean(mean(B));
    r(i)=avg_r;
    g(i)=avg_g;
    b(i)=avg_b;
end
% n has be defined over 1 pulse = 0.833fs to 1.333fs 
% fs= 24;
%  plot(1:n,g);
% x=fft(g);
% xdft = x(1:length(x)/2+1); 
% freq = 0:30/length(x):15;
% freq = freq*60;
% absxdft=abs(xdft);
% absxdft(1)=0;
% plot(freq(1:45),absxdft(1:45));


s=50;
for i=s+1:n-s
    Rn(i-s)=find_mean(r,i,s);
    Gn(i-s)=find_mean(g,i,s);
    Bn(i-s)=find_mean(b,i,s);
end

X=3*Rn-2*Gn;
Y=1.5*Rn+Gn-1.5*Bn;

% X=3*r-2*g;
% Y=1.5*r+g-1.5*b;
