%FDetect = vision.CascadeObjectDetector;
function [vel]=video2imagessave(vid);
NoseDetect = vision.CascadeObjectDetector('Nose','MergeThreshold',40);
%vid=VideoReader('Forged/1.mp4');
k=1;
numFrames = vid.NumberOfFrames;
ii=1;
for i = 1:500
 I= read(vid,i);
 %BB = step(FDetect,I);
 BB = step(NoseDetect,I);
 [m,n]=size(BB);
 if m==1
    img{ii}=I(BB(2):BB(2)+BB(4),BB(1)-40:BB(1)+BB(3)+40,:);
    %imshow(I(BB(2):BB(2)+BB(4),BB(1)-40:BB(1)+BB(3)+40,:));
    %display(ii)
    ii=ii+1;
 end
end
vel=img;