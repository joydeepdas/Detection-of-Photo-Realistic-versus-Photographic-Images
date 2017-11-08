function [mean] =find_mean(channel,index, size);
mean=0;
for i=index-size
    mean=mean+channel(i);
end
mean=mean/(2*size+1);