function fitresult = CurrentAnalys(Current_Data)

time = Current_Data(:,1)/1000;

samples = size(Current_Data,2)-1;
data = Current_Data(:,2:samples+1);
fullData = reshape(data,1,[])';
fullTime = repmat(time,samples,1);

fullTime(sum(isnan(fullData), 2) == 1, :) = [];
fullData(sum(isnan(fullData), 2) == 1, :) = [];

[xData, yData] = prepareCurveData( fullTime, fullData );

% Set up fittype and options.
ft = fittype( 'a*exp(b*x)+c', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [140 -0.002 1];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );
%coefficents = coeffvalues(fitresult);
lables = [];
hold on
for i = 1:samples
    scatter(time,data(:,i),'.');%'markersize',2
    lables = [lables strcat("Gel ",num2str(i))];
end
h = plot(fitresult);
h.LineWidth = 2;
h.Color = 'k';
lables = [lables "Fit"];
title("Current Draw of Gel Over Time with Weight Applied");
xlabel("Time (s)");
ylabel("Current (mA)");
legend(lables);
%disp("Coefficients for a b & c in a*exp(b*x)+c are:");
%disp(coefficents)
%disp(fitresult)
end

