clear all;
originalfeature=importdata('naturalfeature_ucid.mat');
spamfeature=importdata('CGIfeature_248.mat');
%originalfeature=originalfeature';
%spamfeature=spamfeature';
random_gen1 = randperm(500,500);
random_gen2 = randperm(248,248);
for i=1:500
    originalrand(i,:)=originalfeature(random_gen1(i),:);
    %spamrand(i)=spamfeature(random_gen2(i),:);
end
for i=1:248
    %originalrand(i,:)=originalfeature(random_gen1(i),:);
    spamrand(i,:)=spamfeature(random_gen2(i),:);
end
%%train
% on 80%data
traindata=[originalrand(1:400,:);spamrand(1:198,:)];
label=[ zeros(400,1);ones(198,1)];
SVMStruct = svmtrain(traindata,label);




%%test
%on 20%data
testdata=[originalrand(401:500,:);spamrand(198:248,:)];
Group = svmclassify(SVMStruct,testdata);
TN=0;FP=0;
for i=1:100
    if Group(i)==0
        TN=TN+1;
    end
    if Group(i)==1
        FP=FP+1;
    end
end
TN=TN/100;FP=FP/100;

TP=0;FN=0;
for i=101:151
    if Group(i)==1
        TP=TP+1;
    end
    if Group(i)==0
        FN=FN+1;
    end
end
TP=TP/51;FN=FN/51;
