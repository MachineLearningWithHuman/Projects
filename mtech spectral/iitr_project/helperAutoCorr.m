function helperAutoCorr(data,w)
% This function is intended only for the 
% HaarTransformsForTimeSeriesDataExample. It may be changed or removed in
% a future release
f = figure;
f.Units = 'normalized';
movegui(f,'center');
f.Position(2:4) = [0.15 0.4 0.7];
f.Units = 'pixels';
lev = 5;
N = length(data);
[xc,lags] = xcorr(data,32,'coef');
subplot(5,1,1)
hs = stem(lags(33:end),xc(33:end));
hs.Marker = 'none';
xlim([0 32])

conf = 1.96;
line(0:32,conf/sqrt(N)*ones(33,1),'LineStyle','--');
line(0:32,-conf/sqrt(N)*ones(33,1),'LineStyle','--');
title('Autocorrelation Sequences for Original Data and Wavelet Coefficients');
for lev = 1:4
    subplot(5,1,lev+1)
    [xc,lags] = xcorr(w{lev},32,'coef');
    hs = stem(lags(33:end),xc(33:end));
    xlim([0 32])
    hs.Marker = 'none';
    ax = gca;
    ylims = ax.YLim;
    xlims = ax.XLim;
    text(ax,xlims(2)-10,ylims(2)-0.2,['Scale ' num2str(2^lev)]);
    line(0:32,conf/sqrt(N/2^lev)*ones(33,1),'LineStyle','--');
    line(0:32,-conf/sqrt(N/2^lev)*ones(33,1),'LineStyle','--');
end
xlabel('Lag (days)');
    