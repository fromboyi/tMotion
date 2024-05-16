%% GetRosePlots.m

load('WholeDirections.mat')
% ---------------- Plot Figure 2A for LEFT HAND-------------------%
meanLeftLow = mean(Left_Whole_LowSpeed');
meanLeftHigh= mean(Left_Whole_HighSpeed');

stdLow=std(Left_Whole_LowSpeed')/sqrt(width(Left_Whole_LowSpeed));
stdHigh=std(Left_Whole_HighSpeed')/sqrt(width(Left_Whole_HighSpeed));

[~,idx]=sort(orddir);
sortMeanLow=meanLeftLow(idx);
sortMeanHigh=meanLeftHigh(idx);
sortSTDLow=stdLow(idx);
sortSTDHigh=stdHigh(idx);

LowAxesLimits(1,:)=sortMeanLow+sortSTDLow;
LowAxesLimits(2,:)=sortMeanLow-sortSTDLow;
HighAxesLimits(1,:)=sortMeanHigh+sortSTDHigh;
HighAxesLimits(2,:)=sortMeanHigh-sortSTDHigh;

P=[sortMeanLow;sortMeanHigh];
figure(1)
spider_plot(P,'AxesShaded', 'on','AxesShadedLimits', {LowAxesLimits,HighAxesLimits}, 'AxesShadedColor', {'b','r'},'AxesShadedTransparency', 0.1,'AxesLimits',[-45*ones(1,24);3*ones(1,24)],'AxesLabels','none','AxesDisplay','none');

% ---------------- Plot Figure S2A for RIGHT HAND-------------------%
meanRightLow = mean(Right_Whole_LowSpeed');
meanRightHigh= mean(Right_Whole_HighSpeed');

stdLowR=std(Right_Whole_LowSpeed')/sqrt(width(Right_Whole_LowSpeed));
stdHighR=std(Right_Whole_HighSpeed')/sqrt(width(Right_Whole_HighSpeed));

sortMeanLowR=meanRightLow(idx);
sortMeanHighR=meanRightHigh(idx);
sortSTDLowR=stdLowR(idx);
sortSTDHighR=stdHighR(idx);

LowAxesLimitsR(1,:)=sortMeanLowR+sortSTDLowR;
LowAxesLimitsR(2,:)=sortMeanLowR-sortSTDLowR;
HighAxesLimitsR(1,:)=sortMeanHighR+sortSTDHighR;
HighAxesLimitsR(2,:)=sortMeanHighR-sortSTDHighR;

PR=[sortMeanLowR;sortMeanHighR];
figure(2)
spider_plot(PR,'AxesShaded', 'on','AxesShadedLimits', {LowAxesLimitsR,HighAxesLimitsR}, 'AxesShadedColor', {'b','r'},'AxesShadedTransparency', 0.1,'AxesLimits',[-10*ones(1,24);50*ones(1,24)],'AxesLabels','none','AxesDisplay','none');