% This computes FREM for different number of states the sources can get
% into (uniformly distributed over these states).
savethis =0;

% int1_multi{1}=[0 1];
% int2_multi{1}=[0 1];
% int1_multi{2}=[0 1];
% int2_multi{2}=[0 1];
% int1_multi{3}=[0 1];
% int2_multi{3}=[0 1];
% int1_multi{4}=[0 1];
% int2_multi{4}=[0 1];
% 
int1_multi{1}=[1];
int2_multi{1}=[1];
% int1_multi{2}=[0 1];
% int2_multi{2}=[0 1];
% int1_multi{3}=[0 .5 1];
% int2_multi{3}=[0 .5 1];
% int1_multi{4}=[0:.1:1];
% int2_multi{4}=[0:.1:1];

% int1_multi{1}=1;
% int2_multi{1}=1;
% int1_multi{2}=0:.1:1;
% int2_multi{2}=0:.1:1;
% int1_multi{3}=0:.1:1;
% int2_multi{3}=0:.1:1;
% int1_multi{4}=0:.1:1;
% int2_multi{4}=0:.1:1;
% int1_multi{5}=0:.1:1;
% int2_multi{5}=0:.1:1;


% tau1_vec = [0 .2 .4 .8 2];
tau1_vec = [0 .2 .5 .9];
% tau1_vec = [0 0 0 0];
% tau1_vec = 0;
tau2_vec = tau1_vec;
clear int1_mat;
int1_mat{1}=[0 1];
clear('y_multi')

x=-15:.01:25;
% positions
l1=0;
l2=2:1:8;
% l2=[2];

% sigma
sig1=1;
sig2=1;

probfunction='binomial';
nameappendix = 'Ind';
correctIntensity = 0;
if correctIntensity
    nameappendix = [nameappendix 'CorrInt'];
end
pixelizeversion = 0;
% int1maxlength = max(cellfun('length',int1_multi));
vard=zeros(length(l2), length(int1_multi));

for mm=1:length(int1_multi)   
    tau= cat(1,tau1_vec(mm),tau2_vec(mm));
    int_vec=cat(1,int1_multi{mm},int2_multi{mm});
    [pint, int_out]=generateDistribution(int_vec,tau, probfunction, correctIntensity);
    vard(:,mm)=computeSeparationVariance(x,l1,l2,[sig1,sig2],int_vec, pint, pixelizeversion);    
end

plotledacos

