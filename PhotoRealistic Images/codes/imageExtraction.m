clear all;
data_location = 'ucid.v2/';
imagefiles = dir([data_location '*.tif']);
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
% save images as natural.mat and CGI.mat resp
