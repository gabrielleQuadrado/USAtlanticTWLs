% relativeContributionbyMonth This script produces a panel plot figure with
% the relative composition of annual maxima (AM) or peak-ove-threshold
% (POT) TWL events by month. By specifying method = 1, it plots results for AM. By
% specifying method = 2, it plots results for POT.
% 
% % This script reproduces Figure 5 and 6 in the paper "The timing, magnitude, 
% and relative composition of extreme total water levels vary seasonally 
% along the U.S. Atlantic Coast" by Gabrielle P. Quadrado & Katherine A.
% Serafin, Journal of Geophysical Research: Oceans, 2024.
%
% Created by G. Quadrado, University of Florida, June 2023
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% set paths to where data is stored
addpath '...\USAtlanticTWLs\annualMaximabyMonth\';
addpath '...\USAtlanticTWLs\POTbyMonth\'; 
clc;close all;clear all

method=1; % Select method for reproducing Figure 3 (based on AM) or Figure
% 4 (based on POT), where method = 1 = AM, method = 2 = POT

for i = 1:10
    if i == 1 
fname='SandyHook';
    elseif i == 2 
        fname='AtlanticCity';
    elseif i == 3
        fname = 'Lewes';
    elseif i == 4 
        fname = 'Kiptopeke';
    elseif i == 5 
        fname = 'Duck';
    elseif i == 6 
        fname = 'Beaufort';
    elseif i == 7 
        fname = 'SpringmaidPier';
    elseif i == 8 
        fname = 'Charleston';
    elseif i == 9
        fname = 'FortPulaski';
    elseif i == 10 
        fname = 'FernandinaBeach';
    end

if method == 1
% magnitude directory
dir = 'C:\Users\gpereiraquadrado\OneDrive - University of Florida\Research\MATLAB\output\AM_paper1\Uniform\Runup_2023\SLR_SLA\AnnualMax_ByMonth\SplittingResiduals\'; 
load([dir fname '_statsContribution_byMonth_runup.mat']);

elseif method == 2
    % magnitude directory
dir = 'C:\Users\gpereiraquadrado\OneDrive - University of Florida\Research\MATLAB\output\AM_paper1\POT\byMonth\';
load([dir fname '_POT_statsContribution_byMonth_runup.mat']);

end 

% Define the letters to add to each subplot
letters = 'abcdefghij';

% Define the positions for each subplot
x_positions = [0.0097, 0.015, 0.0089, 0.0097, 0.015, 0.0089, 0.0097, 0.015, 0.0089, 0.02];
y_positions = [0.95,0.95,0.95, 0.948, 0.948, 0.948, 0.96, 0.945, 0.945, 0.945];


f=figure(4);% max plot
f.Position = [1,49,1440,775]
if i <= 3;
    ax = subplot(3,4,i+0.3);
elseif i == 4 
       subplot(3,4,5.3)
elseif i == 5 
    subplot(3,4,6.3)
elseif i == 6 
    subplot(3,4,7.3)
elseif i > 6
    subplot(3,4,i+2)
end

f.Position = [100 100 900 700];
b=bar(1,maxpcentMonthContribution(12,:),'stacked','FaceColor','flat');
b(1).CData = [0    0.4471    0.7412]; % slr
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual 
b(7).CData = [0.3020    0.7451    0.9333]; % R2% 
ylim([-5 105])

hold on 
b=bar(2:12,maxpcentMonthContribution(1:11,:),'stacked','FaceColor','flat');
title(fname)

xticks([1:12])
xticklabels({'D','J','F','M','A','M','J','J','A','S','O','N'})
xtickangle(0)
ylim([-10 110])

if i == 4
    if method == 1
ylabel('% contribution to annual maxima TWL','FontSize',14,'fontweight','bold')
    elseif method == 2
        ylabel('% contribution to POT TWL','FontSize',14,'fontweight','bold')
    end 
 else
ylabel('') 
end

if i == 7 || i == 8 || i == 9 || i == 10
    xlabel('month','FontSize',14,'fontweight','bold')
else
    xlabel('')
end

grid
set(gca,'fontsize',12)

b(1).CData = [0    0.4471    0.7412]; % slr
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual 
b(7).CData = [0.3020    0.7451    0.9333]; % R2% or Setup

text(x_positions(i), y_positions(i), letters(i), 'Units', 'normalized', 'FontSize', 11, 'FontWeight', 'bold');

end

legend('\eta_{MSL}','\eta_{A}','\eta_{SE}','\eta_{SLA}','\eta_{SS}','Residual','R_{2%}','fontsize',10, ...
    'location','bestoutside','orientation','vertical','fontsize',12,'fontweight','bold')

