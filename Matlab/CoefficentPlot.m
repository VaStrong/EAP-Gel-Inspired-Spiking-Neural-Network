function CoefficentPlot(coefficents)

weights = coefficents(:,1);
samples = length(weights);

figure;
hold on
%Plot a --------------------------
plot(weights,coefficents(:,2),'.','Color',[0.6350 0.0780 0.1840],'MarkerSize',10);

[xData, yData] = prepareCurveData( weights, coefficents(:,2) );
ft = fittype( 'a*exp(b*x)+c', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [20 -0.0200 -50]; %[10 0.01 100];
[fitresult{1}, gof(1)] = fit( xData, yData, ft, opts );

disp(fitresult{1})

h1 = plot(fitresult{1});
set(h1,'Color','r');

%Plot b --------------------------
plot(weights,coefficents(:,3),'.','Color',[0 0.4470 0.7410],'MarkerSize',10);

[xData, yData] = prepareCurveData( weights, coefficents(:,3) );
ft = fittype( 'a*exp(b*x)+c', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [100 -0.0200 99]; %[10 -0.01 100];
[fitresult{1}, gof(1)] = fit( xData, yData, ft, opts );

disp(fitresult{1})

h2 = plot(fitresult{1});
set(h2,'Color','b');

%Plot c --------------------------
plot(weights,coefficents(:,4),'.','Color',[0.4660 0.6740 0.1880],'MarkerSize',10);

[xData, yData] = prepareCurveData( weights, coefficents(:,4) );
ft = fittype( 'a*exp(b*x)+c', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [-15 -0.0200 50];
[fitresult{1}, gof(1)] = fit( xData, yData, ft, opts );

disp(fitresult{1})

h2 = plot(fitresult{1});
set(h2,'Color','g');


%meanC = mean(coefficents(:,4));
%plot(weights,ones(samples,1)*meanC,'-','Color','g');

legend('b1','b1-fit','b2','b2-fit','b3','b3-fit')
xlabel("Weight")
ylabel("Coefficient Value")
title(["Coefficient Values Against" "Corresponding Weights Bending Model"])

end

