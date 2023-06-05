function BendingTrednAnalys(RateData)

time = RateData{1,1};
samples = size(time,1);
trends = size(RateData,2)-1;
weigths = [RateData{3,2:trends+1}];
gels = size(RateData{1,2},2);

fullTime = repmat(time,gels,1);
maxAngle = 0;
for i = 1:trends
    temp = RateData{1,i+1};
    if max(max(temp))>maxAngle
        maxAngle = max(max(temp));
        maxAngle = ceil(maxAngle/10)*10;
    end
end
figure;
for i = 1:trends
    temp = RateData{1,i+1};
    temp = reshape(temp,1,[])';
    %fullRate(1:size(temp,1),i) = temp;
    rate = mean(RateData{2,i+1});
    [xData, yData] = prepareCurveData( fullTime, temp );

    % Set up fittype and options.
    ft = fittype( '(a/(1+exp((x-b)/c)))-(a/(1+exp(-b/c)))', 'independent', 'x', 'dependent', 'y' );
    opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    opts.Display = 'Off';
    opts.StartPoint = [-30 100 10];
    % Fit model to data.
    [fitresult, gof] = fit( xData, yData, ft, opts );
    fittings{i} = fitresult;
    
    subplot(1,trends,i);
    h = plot( fitresult, xData, yData );
    if(i == 1)
        legend('Location','northwest')
    end
    xlabel("Time (s)")
    ylabel("Bending (deg)")
    %title([strcat("Bending Over Time With Weight: ", num2str(weigths(i))) strcat("Mean Bending Rate: ",  num2str(rate))])
    title(["Bending Over Time" strcat("With Weight: ", num2str(weigths(i))," Seconds")])
    ylim([0 maxAngle])
    disp(strcat("for weight: ",num2str(weigths(i))))
    disp(fitresult)
    disp("")
end

end

