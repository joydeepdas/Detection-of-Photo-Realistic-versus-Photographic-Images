clear all;
vid=VideoReader('Real Movies/1.mp4');
frate=vid.FrameRate;
nframe=vid.NumberOfFrames;
for i=1:min(nframe,500);
    x(i,:)=[std2(read(vid,i)) i];
end
sortrows(x,1);
ii=1;
for i=500:-1:450
 I= read(vid,x(i,2));
 I=I(100:600,:,:);
 feature(ii,:)=paper2featureIV(I);
 display(ii);
 ii=ii+1;
end

