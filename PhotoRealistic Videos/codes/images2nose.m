clear all;
data_location = 'new/images/';
imagefiles = dir([data_location '*.jpg']);
ii=1;

%To detect Nose
NoseDetect = vision.CascadeObjectDetector('Nose','MergeThreshold',40);
ii=1;
for i = 1:length(imagefiles)
    filename = [data_location imagefiles(i).name];
    images{i}= (imread(filename));
    image=cell2mat(images(i));
    BB = step(NoseDetect,image);
    [m,~]=size(BB);
    if m==1
        img{ii}=image(BB(2):BB(2)+BB(4),BB(1):BB(1)+BB(3),:);
        ii=ii+1;
    end
    if m==2
        BB=BB(2,:);
        img{i}=image(BB(2):BB(2)+BB(4),BB(1):BB(1)+BB(3),:);
        ii=ii+1;
    end
    
end
