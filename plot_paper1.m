natural=importdata('featureori_hist.mat');
spam=importdata('featurespam_hist.mat');
fx=1:798;
fy=1:921;
plot(fx,natural,'r*',fy,spam,'b+');
legend('Natural Mean','Spam Mean');
xlabel('No. of Images');
ylabel('Lightness');