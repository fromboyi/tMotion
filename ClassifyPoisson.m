%% ClassifyPoission.m

load('AmpPoisson.mat')

% ----------- Data Prepare ----------------- %
vioSet=zeros(64,6);
for i=1:6
vioSet(:,i)=Amp(spdOrder==spd(i));
end

list1=vioSet(:,1)';
list2=vioSet(:,2)';
list3=vioSet(:,3)';
list4=vioSet(:,4)';
list5=vioSet(:,5)';
list6=vioSet(:,6)';

% ------------ Poisson Fitting -------------- %
x=0:100;

pd1 = fitdist(list1', 'Poisson');y=pdf(pd1,x);plot(x,y,'Color',[0,0,1],'LineWidth',1);
hold on
pd2 = fitdist(list2', 'Poisson');y=pdf(pd2,x);plot(x,y,'Color',[0.0469,0.6133,1.0000],'LineWidth',1);
pd3 = fitdist(list3', 'Poisson');y=pdf(pd3,x);plot(x,y,'Color',[0.4727,0.6680,0.1953],'LineWidth',1);
pd4 = fitdist(list4', 'Poisson');y=pdf(pd4,x);plot(x,y,'Color',[1,0,1],'LineWidth',1.5);
pd5 = fitdist(list5', 'Poisson');y=pdf(pd5,x);plot(x,y,'Color',[1.0000,0.3906,0.1289],'LineWidth',1);
pd6 = fitdist(list6', 'Poisson');y=pdf(pd6,x);plot(x,y,'Color',[0.6289,0.0508,0.1562],'LineWidth',1);