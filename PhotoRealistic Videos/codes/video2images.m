workingDir = 'C:\Users\JOYDEEP DAS\Desktop\SEM6\labbased\paper3\image\new';
mkdir(workingDir)
mkdir(workingDir,'images')

FDetect = vision.CascadeObjectDetector;

vid=VideoReader('video1.mp4');
numFrames = vid.NumberOfFrames;
k=1;
for i = 1:500
 I= read(vid,i);
 BB = step(FDetect,I);
 [s,~]=size(BB);
 if s==1
     img=I(BB(2):BB(2)+BB(4),BB(1):BB(1)+BB(3),:);
     filename = [sprintf('%03d',k) '.jpg'];
     fullname = fullfile(workingDir,'images',filename);
     imwrite(img,fullname);
     k=k+1;
 end
 end