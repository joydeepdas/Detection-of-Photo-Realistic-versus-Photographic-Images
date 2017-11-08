%naturalimages=importdata('NaturalImages_rgb.mat');
spamimages=importdata('SpamImages_rgb.mat');
[m,n]=size(spamimages);
for i=1:n
    image=cell2mat(spamimages(1,i));
    image=rgb2gray(image);
    f=std2(image);
    featureori(i)=f;
end
