function weightModelPlot()

maxW = 160;

w = 0:0.1:maxW;
t = 0:10:300;

b1 = 21.92*exp(-0.02851*w)-57.41;
b2 = 59.02*exp(-0.02298*w)+99.72;
b3 = -16.72*exp(-0.02913*w)+45.67;

A = (b1'./(1+exp((t-b2')./b3')))-(b1'./(1+exp((-b2')./b3')));

figure;
% subplot(1,2,1)
% surf(t,w,A);
% xlabel("Time (s)")
% ylabel("Weight (s)")
% zlabel("Angle (deg)")
% 
% title({'Modelled EAP Hydrogel Motion';'over Time with Varied Weight'})
% 
% shading interp

%subplot(1,2,2)
colormap turbo
C = turbo(length(w));
hold on
for i = 1:length(w)
    plot(t,A(i,:),"Color",C(i,:))
end

xlabel("Time (s)")
ylabel("Angle (deg)")

title({'Modelled EAP Hydrogel Motion';'over Time with Varied Weight'})

hcb = colorbar();
caxis([min(w) max(w)]);
set(hcb,'YTick',0:20:maxW)
colorTitleHandle = get(hcb,'Title');
titleString = {'Weight (s)';''};
set(colorTitleHandle ,'String',titleString);
end