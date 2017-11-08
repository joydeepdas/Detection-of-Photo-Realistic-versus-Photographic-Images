clear all;
data_location = 'NaturalImages/';
imagefiles = dir([data_location '*.jpg']);
ii=1;
for i = 1:length(imagefiles)
    filename = [data_location imagefiles(i).name];
    images{i}= (imread(filename));
    image=cell2mat(images(i));
    [m,n,o]=size(image);
    if o==3
        saveimage{ii}=image;
        ii=ii+1;
    end
end
% save the 'saveimage' from workspace to Naturalimages_rgb.mat
