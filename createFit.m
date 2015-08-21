function [fitresult, gof] = createFit(x, y1)
%CREATEFIT1(X,Y1)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : x
%      Y Output: y1
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 17-Aug-2015 11:25:35


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( x', y1 );

% Set up fittype and options.
ft = fittype( 'poly1' );
opts = fitoptions( 'Method', 'LinearLeastSquares' );
% opts.Display = 'Off';
% opts.StartPoint = [1.84150097365895 -0.0124642806504331 -1.44640356306934 -0.0146083999580387];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend( h, 'y1 vs. x', 'untitled fit 1', 'Location', 'NorthEast' );
% Label axes
xlabel x
ylabel y1
grid on

