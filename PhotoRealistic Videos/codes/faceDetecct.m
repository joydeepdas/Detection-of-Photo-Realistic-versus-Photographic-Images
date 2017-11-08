clear all;
clc
%Detect objects using Viola-Jones Algorithm

%To detect Face
NoseDetect = vision.CascadeObjectDetector('Nose','MergeThreshold',40);



%Read the input image
I = imread('Image178.jpg');

%Returns Bounding Box values based on number of objects
BB = step(NoseDetect,I);
%BB=BB(2,:);
img=I(BB(2):BB(2)+BB(4),BB(1):BB(1)+BB(3),:);
figure,
imshow(img); hold on
for i = 1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','r');
end
title('Face Detection');
hold off;