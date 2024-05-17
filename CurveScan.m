%% CurveScan.m

load('Speed.mat');

% ------------Data Prepare -------------- %
lgs=log(speed);
mean_1=mean(ball_1');
mean_2=mean(ball_2');
mean_3=mean(ball_3');
mean_4=mean(ball_4');
Ux=4:0.1:5.5;

% ----------------Fit Scanning -------------------%
for i=1:16
[xData, yData] = prepareCurveData( lgs, mean_1 );
strU=4+(i-1)*0.1;eq=strcat('0.5*(erf((x-',num2str(strU),')/sqrt(2*a*a))+1)');
ft = fittype(eq,'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = 0.899507100861224;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );
a_sse(i)=gof.sse;a_rsquare(i)=gof.rsquare;a_rmse(i)=gof.rmse;
end 
for i=1:16
[xData, yData] = prepareCurveData( lgs, mean_2 );
strU=4+(i-1)*0.1;eq=strcat('0.25*(erf((x-',num2str(strU),')/sqrt(2*a*a))+1)');
ft = fittype(eq,'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = 0.899507100861224;

[fitresult, gof] = fit( xData, yData, ft, opts );
b_sse(i)=gof.sse;b_rsquare(i)=gof.rsquare;b_rmse(i)=gof.rmse;
end

for i=1:16
[xData, yData] = prepareCurveData( lgs, mean_3 );
strU=4+(i-1)*0.1;eq=strcat('0.375/2*(erf((x-',num2str(strU),')/sqrt(2*a*a))+1)');
ft = fittype(eq,'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = 0.899507100861224;

[fitresult, gof] = fit( xData, yData, ft, opts );
c_sse(i)=gof.sse;c_rsquare(i)=gof.rsquare;c_rmse(i)=gof.rmse;
end

for i=1:16
[xData, yData] = prepareCurveData( lgs, mean_4 );
strU=4+(i-1)*0.1;eq=strcat('0.375/2*(erf((x-',num2str(strU),')/sqrt(2*a*a))+1)');
ft = fittype(eq,'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = 0.899507100861224;

[fitresult, gof] = fit( xData, yData, ft, opts );
d_sse(i)=gof.sse;d_rsquare(i)=gof.rsquare;d_rmse(i)=gof.rmse;
end

% ------------------------ Plot ----------------%
figure(1)
title('R Square');
plot(Ux,a_rsquare,'Color', [0,0.6914,0.9414],'LineWidth',1)
hold on
plot(Ux,b_rsquare,'Color',[0.4414, 0.1914,0.6289],'LineWidth',1)
plot(Ux,c_rsquare,'Color',[0,0.6914,0.3125],'LineWidth',1)
plot(Ux,d_rsquare,'Color',[0.75,0,0],'LineWidth',1)