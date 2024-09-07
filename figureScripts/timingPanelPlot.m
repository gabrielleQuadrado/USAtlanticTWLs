% timingPanelPlot This script produces a panel plot figure with the number of 
% annual maxima (AM) or peak-over-threshold (POT) TWL events by month on the 
% right y-axis, and the average magnitude of AM or POT TWL events for each month on the
% left y-axis. By specifying method = 1, it plots results for AM. By
% specifying method = 2, it plots results for POT.
% 
% % This script reproduces Figure 3 and 4 in the paper "The timing, magnitude, 
% and relative composition of extreme total water levels vary seasonally 
% along the U.S. Atlantic Coast" by Gabrielle P. Quadrado & Katherine A.
% Serafin, Journal of Geophysical Research: Oceans, 2024.
%
% Created by G. Quadrado, University of Florida, June 2023
% Modified by G. Quadrado, University of Florida, June 2024 - calculates %
% of events occurring during each month
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
dir1 = 'C:\Users\gpereiraquadrado\OneDrive - University of Florida\Research\MATLAB\output\data_repository\annualMaximabyMonth\magnitude\'; 
% number of events directory
dir2 = 'C:\Users\gpereiraquadrado\OneDrive - University of Florida\Research\MATLAB\output\data_repository\annualMaximabyMonth\numberEvents\'; 

load([dir1 fname '_annualMax_monthlyMagTWL_runup.mat']);
load([dir2 fname '_annualMax_numberEvents_byMonth_runup.mat']);


elseif method == 2
    % magnitude directory
    dir1 = 'C:\Users\gpereiraquadrado\OneDrive - University of Florida\Research\MATLAB\datasets\paper1\gitHubReady_September2024\POTbyMonth\'; 
    % number of events directory
    dir2 = 'C:\Users\gpereiraquadrado\OneDrive - University of Florida\Research\MATLAB\datasets\paper1\gitHubReady_September2024\POTbyMonth\';
load([dir1 'avgMonthlyTWLMag_' fname '.mat']);
load([dir2 'numberEventsbyMonth_' fname '.mat']);
end 



% Calculate percentage occurrence for each month
total = sum(climatologyTWL);
pcent = (climatologyTWL.*100)./total;

% Define the letters to add to each subplot
letters = 'abcdefghij';
numevents = mat2str(total);

% Define the positions for each subplot (adjusted for your layout)
x_positions = [0.0097, 0.015, 0.0089, 0.0097, 0.015, 0.0089, 0.0097, 0.015, 0.0089, 0.02];
y_positions = [0.95,0.95,0.95, 0.948, 0.948, 0.948, 0.96, 0.945, 0.945, 0.945];


f=figure(10);% panel plot
f.Position = [1,49,1440,775];
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

warning('off')
f.Position = [100 100 900 700];
%colororder({'k','b'})
yyaxis left
b=bar([1:12],[pcent(12); pcent(1:11)],'FaceColor',[0.6510    0.6510    0.6510]);
    ylim([0 40])
     a = get(gca,'XTickLabels');
   set(gca,'XTickLabels',a,'fontsize',14,'fontweight','normal','YColor','k')
   xtickangle(0)
    yticks(0:10:40)
    grid on 
    title([fname ' - ' numevents ' events'],'fontsize',12,'fontweight','bold')
    
     if i == 1 || i == 4 || i == 7
ylabel('% of events','fontsize',16,'fontweight','bold')
else
ylabel('') 
end
    
    xticklabels({'D','J','F','M','A','M','J','J','A','S','O','N'})
    hold on 
 yyaxis right
 p=plot([1:12],[monthlyMagTWL(12); monthlyMagTWL(1:11)],'ko','markerfacecolor','b');
 hold on 
 p2 = plot([1:12],[monthlyMagTWL(12); monthlyMagTWL(1:11)],'b--');
 grid on 
 ylim([2.5 5.5])
 yticks(2.5:1:5.5)
  set(gca,'YColor','b')

 if i == 3 || i == 6 || i == 10
ylabel('TWL (m)','fontsize',16,'fontweight','bold')
else
ylabel('') 
end

if i == 7 || i == 8 || i == 9 || i == 10
   xlabel('month','fontsize',16,'fontweight','bold')
else
    xlabel('')
end

 text(x_positions(i), y_positions(i), letters(i), 'Units', 'normalized', 'FontSize', 11, 'FontWeight', 'bold');
end