clear all;
originalfeature=importdata('featureori.mat');
spamfeature=importdata('featurespam.mat');
originalfeature_hist=importdata('featureori_hist.mat');
spamfeature_hist=importdata('featurespam_hist.mat');

originalfeature=originalfeature';
spamfeature=spamfeature';
originalfeature_hist=originalfeature_hist';
spamfeature_hist=spamfeature_hist';

truepositive=0;truenegative=0;
falsepositive=0;falsenegative=0;

for i=1:798
    if originalfeature(i,1) <0.5 || originalfeature_hist(i,1)<0.1
        truenegative=truenegative+1;
    else
        falsepositive=falsepositive+1;
    end
end

for i=1:921
    if spamfeature(i,1) <0.5 || spamfeature_hist(i,1)<0.1
        falsenegative=falsenegative+1;
    else
        truepositive=truepositive+1;
    end
end
truepositive=truepositive/921;truenegative=truenegative/798;
falsepositive=falsepositive/798;falsenegative=falsenegative/921;

    