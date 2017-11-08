%naturalimages=importdata('NaturalImages_rgb.mat');
spamimages=importdata('SpamImages_rgb.mat');
[m,n]=size(spamimages);
for ii=1:n
    image=cell2mat(spamimages(1,5));
    image=double(image);
    image=image./255;
    hslimage=rgb2hsl(image);
    lightness=hslimage(:,:,3);
    hx=imhist(lightness)/numel(lightness);
    maxhx=max(hx);
    [mm,nn]=size(hx);
    maxi=-1;
    for i=1:mm
        if hx(i)<=0.05 
            if hx(i) >maxi
                maxi=hx(i);
            end
        end
    end
    result=abs(maxi-maxhx);
    result=result/maxhx;
    f(ii)=result; 
end



%% 

