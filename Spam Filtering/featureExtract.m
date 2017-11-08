% Firstly feature from natural images are taken , then these feature is saved and secondly for spam images.

naturalimages=importdata('NaturalImages_rgb.mat');
%spamimages=importdata('SpamImages_rgb.mat');
[m,n]=size(naturalimages);
for i=1:n
    image=cell2mat(naturalimages(1,i));
    image=double(image);
    image=image./255;
    hslimage=rgb2hsl(image);
    imshow(hslimage(:,:,3));
    f=mean(mean(hslimage(:,:,2)));
    
    featureori(i)=f;
end
% save it as featureori.mat
% forspamimages save it as featurespam.mat
