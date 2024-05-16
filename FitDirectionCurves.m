%% FitDirecionCurves.m

load('ExptII_Dir_Data.mat')

%-------------------- Data Preparation -----------------------%
dir=0:22.5:157.5;
dirrad=dir/180*pi;
spd20=[ball_4(1:8,:),ball_3(1:8,:),ball_2(1:8,:),ball_1(1:8,:)];
spd40=[ball_4(9:16,:),ball_3(9:16,:),ball_2(9:16,:),ball_1(9:16,:)];
spd80=[ball_4(17:24,:),ball_3(17:24,:),ball_2(17:24,:),ball_1(17:24,:)];
spd160=[ball_4(25:32,:),ball_3(25:32,:),ball_2(25:32,:),ball_1(25:32,:)];
spd240=[ball_4(33:40,:),ball_3(33:40,:),ball_2(33:40,:),ball_1(33:40,:)];
spd320=[ball_4(41:48,:),ball_3(41:48,:),ball_2(41:48,:),ball_1(41:48,:)];

spd20_Bd=mean(spd20');
spd40_Bd=mean(spd40');
spd80_Bd=mean(spd80');
spd160_Bd=mean(spd160');
spd240_Bd=mean(spd240');
spd320_Bd=mean(spd320');

spd20_std=std(spd20')/sqrt(16);
spd40_std=std(spd40')/sqrt(16);
spd80_std=std(spd80')/sqrt(16);
spd160_std=std(spd160')/sqrt(16);
spd240_std=std(spd240')/sqrt(16);
spd320_std=std(spd320')/sqrt(16);

SysBias(1)=mean(spd20_Bd);
SysBias(2)=mean(spd40_Bd);
SysBias(3)=mean(spd80_Bd);
SysBias(4)=mean(spd160_Bd);
SysBias(5)=mean(spd240_Bd);
SysBias(6)=mean(spd320_Bd);

spd20_Bns=spd20_Bd-SysBias(1);
spd40_Bns=spd40_Bd-SysBias(2);
spd80_Bns=spd80_Bd-SysBias(3);
spd160_Bns=spd160_Bd-SysBias(4);
spd240_Bns=spd240_Bd-SysBias(5);
spd320_Bns=spd320_Bd-SysBias(6);

% ------------------ Systematic Bias Plots ------------ %
figure(1)
plot(dir,dir,'k--')
hold on
errorbar(dir,dir+spd20_Bd,spd20_std,'o','Color',[0,0,1]);
plot(dir,dir+SysBias(1),'Color',[0,0,1])

figure(2)
plot(dir,dir,'k--')
hold on
errorbar(dir,dir+spd40_Bd,spd40_std,'o','Color',[0.0469,0.6133,1.0000]);
plot(dir,dir+SysBias(2),'Color',[0.0469,0.6133,1.0000])

figure(3)
plot(dir,dir,'k--')
hold on
errorbar(dir,dir+spd80_Bd,spd80_std,'o','Color',[0.4727,0.6680,0.1953]);
plot(dir,dir+SysBias(3),'Color',[0.4727,0.6680,0.1953])

figure(4)
plot(dir,dir,'k--')
hold on
errorbar(dir,dir+spd160_Bd,spd20_std,'o','Color',[1,0,1]);
plot(dir,dir+SysBias(4),'Color',[1,0,1])

figure(5)
plot(dir,dir,'k--')
hold on
errorbar(dir,dir+spd240_Bd,spd240_std,'o','Color',[1.0000,0.3906,0.1289]);
plot(dir,dir+SysBias(5),'Color',[1.0000,0.3906,0.1289])

figure(6)
plot(dir,dir,'k--')
hold on
errorbar(dir,dir+spd320_Bd,spd320_std,'o','Color',[0.6289,0.0508,0.1562]);
plot(dir,dir+SysBias(6),'Color',[0.6289,0.0508,0.1562])


% ------------------- Curve Fitting ------------------- %
figure(7)
[xData, yData] = prepareCurveData( dirrad, spd20_Bns );
ft = fittype( 'a*cos(2*(x+b))', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.8002804688888 0.141886338627215];
[fitresult, gof] = fit( xData, yData, ft, opts );
plot( fitresult, xData, yData)
hold on

[xData, yData] = prepareCurveData( dirrad, spd40_Bns );
ft = fittype( 'a*cos(2*(x+b))', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.8002804688888 0.141886338627215];
[fitresult, gof] = fit( xData, yData, ft, opts );
plot( fitresult, xData, yData)

[xData, yData] = prepareCurveData( dirrad, spd80_Bns );
ft = fittype( 'a*cos(2*(x+b))', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.8002804688888 0.141886338627215];
[fitresult, gof] = fit( xData, yData, ft, opts );
plot( fitresult, xData, yData)


[xData, yData] = prepareCurveData( dirrad, spd160_Bns );
ft = fittype( 'a*cos(2*(x+b))', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.8002804688888 0.141886338627215];
[fitresult, gof] = fit( xData, yData, ft, opts );
plot( fitresult, xData, yData )


[xData, yData] = prepareCurveData( dirrad, spd240_Bns );
ft = fittype( 'a*cos(2*(x+b))', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.8002804688888 0.141886338627215];
[fitresult, gof] = fit( xData, yData, ft, opts );
plot( fitresult, xData, yData )


[xData, yData] = prepareCurveData( dirrad, spd320_Bns );
ft = fittype( 'a*cos(2*(x+b))', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.8002804688888 0.141886338627215];
[fitresult, gof] = fit( xData, yData, ft, opts );
plot( fitresult, xData, yData )