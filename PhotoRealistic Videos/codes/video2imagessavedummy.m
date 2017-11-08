clear all;
NoseDetect = vision.CascadeObjectDetector('Nose','MergeThreshold',40);
vid=VideoReader('Geniuine/7.mp4');
k=1;
numFrames = vid.NumberOfFrames;
ii=1;
for i = 1:400
 I= read(vid,i);
 BB = step(NoseDetect,I);
 [m,n]=size(BB);
 if m==1
    img{ii}=I(BB(2):BB(2)+BB(4)-10,BB(1)-10:BB(1)+BB(3)+10,:);
    imshow(I(BB(2):BB(2)+BB(4)-10,BB(1)-10:BB(1)+BB(3)+10,:));
    display(ii)
    ii=ii+1;
 end
end
