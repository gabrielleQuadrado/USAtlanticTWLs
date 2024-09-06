% SWLresidualsECDF This script plots the empirical cumulative distribution
% function (ECDF) of the residuals calculated based on the difference
% between the reconstructed still water level (SWL) time series and the
% measured SWL from NOAA water level stations. 
% 
% This script reproduces Figure S1 in the supporting information of the
% paper "The timing, magnitude, and relative composition of extreme total
% water levels vary seasonally along the U.S. Atlantic Coast" by 
% Gabrielle P. Quadrado & Katherine A. Serafin, Journal of Geophysical 
% Research: Oceans, 2024.
%
% Created by G. Quadrado, University of Florida, June 2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Add & set path to where data is stored
addpath '...\USAtlanticTWLs\SWLresiduals\'; 
pth = '...\USAtlanticTWLs\SWLresiduals\'; 

stationNames = {'SandyHook', 'AtlanticCity', 'Lewes', 'Virginia', 'Duck', ...
                'Beaufort', 'MyrtleBeach', 'Charleston', 'Savannah', 'FernandinaBeach'};

colors = {'#313695', '#4575b4', '#abd9e9', '#e0f3f8', '#ffffbf', ...
          '#fee090', '#fdae61', '#f46d43', '#d73027', '#a50026'};


f=figure(15);
f.Position=[440,118,753,580];
for i = 1:length(stationNames)
    fname = stationNames{i};
    name = [fname '_hourly.mat'];
    data = load(name);
    
    % Create data and time variables
    residualData = data.hourlyData.residual; 
    residualTime = data.hourlyData.time;
    % Set save path
    savepath = 'C:\Users\gpereiraquadrado\OneDrive - University of Florida\Research\MATLAB\datasets\paper1\gitHubReady_September2024\twlResiduals\';
  
    filename = [savepath fname '_SWLresiduals.mat'];
    save(filename,'residualData','residualTime','-mat');

    % Plot the ECDF
    distp= cdfplot(residualData);
    set(distp, 'Color', colors{i}, 'LineWidth', 1.25,'LineStyle','-');
    hold on
end


set(gca,'fontsize',14,'FontWeight','bold')
xline(0)
title('ECDF - Reconstructed TWL Residuals')
xlabel('residuals (m)')
legend({'Sandy Hook, NJ', 'Atlantic City, NJ', 'Lewes, DE', 'Kiptopeke, VA', ...
    'Duck, NC', 'Beaufort, NC', 'Springmaid Pier, SC', 'Charleston, SC', ...
    'Fort Pulaski, GA', 'Fernandina Beach, FL',''},'Location','southeast')
