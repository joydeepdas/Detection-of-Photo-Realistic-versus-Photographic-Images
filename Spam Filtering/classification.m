% joinning of all the features developed and classifying the two classes using SVM classifier.


clear all;
originalfeature=importdata('featureori.mat');
spamfeature=importdata('featurespam.mat');
originalfeature_hist=importdata('featureori_hist.mat');
spamfeature_hist=importdata('featurespam_hist.mat');
originalf_mody=importdata('modify_nat.mat');
spamf_mody=importdata('modify_spam.mat');
originalfeature=originalfeature';
spamfeature=spamfeature';
originalfeature_hist=originalfeature_hist';
spamfeature_hist=spamfeature_hist';
originalf_mody=originalf_mody';
spamf_mody=spamf_mody';

orif=[originalfeature originalfeature_hist originalf_mody];
spamf=[ spamfeature spamfeature_hist spamf_mody];

random_gen1 = randperm(798,798);
random_gen2 = randperm(921,921);
for i=1:798
    originalrand(i,:)=orif(random_gen1(i),:);
    %spamrand(i)=spamfeature(random_gen2(i),:);
end
for i=1:921
    %originalrand(i,:)=originalfeature(random_gen1(i),:);
    spamrand(i,:)=spamf(random_gen2(i),:);
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
true1=0;false1=0;
for i=1:158
    if Group(i)==0
        true1=true1+1;
    end
    if Group(i)==1
        false1=false1+1;
    end
end
true1=true1/158; false1=false1/158;
true=0;false=0;
for i=159:343
    if Group(i)==1
        true=true+1;
    end
    if Group(i)==0
        false=false+1;
    end
end
true=true/185; false=false/185;
% TP=false,FN=true
% TN=true1, FP= false1;
