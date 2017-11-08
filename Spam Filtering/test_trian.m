% classification using only brightness as feature.

clear all;
originalfeature=importdata('featureori.mat');
spamfeature=importdata('featurespam.mat');
originalfeature=originalfeature';
spamfeature=spamfeature';
random_gen1 = randperm(798,798);
random_gen2 = randperm(921,921);
for i=1:798
    originalrand(i,:)=originalfeature(random_gen1(i),:);
    %spamrand(i)=spamfeature(random_gen2(i),:);
end
for i=1:921
    %originalrand(i,:)=originalfeature(random_gen1(i),:);
    spamrand(i,:)=spamfeature(random_gen2(i),:);
end

%%train
% on 80%data
traindata=[originalrand(1:640,:);spamrand(1:736,:)];
label=[ zeros(640,1);ones(736,1)];
SVMStruct = svmtrain(traindata,label);

%%test
%on 20%data
testdata=[originalrand(641:798,:);spamrand(737:921,:)];
Group = svmclassify(SVMStruct,testdata);
true=0;false=0;
for i=1:158
    if Group(i)==0
        true=true+1;
    end
    if Group(i)==1
        false=false+1;
    end
end
for i=159:343
    if Group(i)==1
        true=true+1;
    end
    if Group(i)==0
        false=false+1;
    end
end
accuracy=true/343;
falacy=false/343;
