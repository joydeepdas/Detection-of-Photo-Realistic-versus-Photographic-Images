originalfeature1=importdata('feature1real.mat');
originalfeature2=importdata('feature2real.mat');
originalfeature3=importdata('feature3real.mat');
originalfeature4=importdata('feature4real.mat');
originalfeature5=importdata('feature5real.mat');
originalfeature6=importdata('testreal4.mat');
originalfeature7=importdata('testreal5.mat');
CGfeature1=importdata('feature1CG.mat');
CGfeature2=importdata('feature2CG.mat');
CGfeature3=importdata('feature3CG.mat');
CGfeature4=importdata('testCGV4.mat');
CGfeature5=importdata('testCGV3.mat');
CGfeature6=importdata('testCGV.mat');
orif=[originalfeature1 ;originalfeature2 ;originalfeature3 ;originalfeature4 ;
    originalfeature5 ;originalfeature6;originalfeature7];
cgf=[CGfeature1 ;CGfeature2 ;CGfeature3;CGfeature4;CGfeature5;CGfeature6];

[m,n]= size(orif);
[mm,nn]=size(cgf);
m1=floor(m*0.8);
mm1=floor(mm*0.8);
traindata=[orif(1:m1,:);cgf(1:mm1,:)];
label=[ zeros(m1,1);ones(mm1,1)];
SVMStruct = svmtrain(traindata,label);

testdata=[orif(m1+1:m,:); cgf(mm1+1:mm,:)];
tpavg=m-m1; tnavg=mm-mm1;
Group = svmclassify(SVMStruct,testdata);
TP=0;FP=0;TN=0;FN=0;
for i=1:tpavg
   if  Group(i)== 0
       TP=TP+1;
   end
   if Group(i) == 1
       FP=FP+1;
   end
end
for i=tpavg+1:tpavg+tnavg
   if  Group(i)== 0
       FN=FN+1;
   end
   if Group(i) == 1
       TN=TN+1;
   end
end
