% seasonalDependence This script produces a panel plot figure displaying the
% Kendall's Tau correlation coefficients between the following pairs:
%
% Left panel:
% 1) TWL seasonal maxima (conditional) and storm surge (conditioned)
% 2) Storm surge seasonal maxima (conditional) and TWL (conditioned) 
% Right panel:
% 3) TWL seasonal maxima (conditional) and Hs (conditioned)
% 4) Hs seasonal maxima (conditional) and TWL (conditioned)
%
% The pairs are evaluated based on the correlation between the seasonal maxima 
% of the conditional variable and second variable, which is conditioned on 
% the first based within a time range of ±1 days from the seasonal max. event. 
%
% This script reproduces Figure 8 in the paper "The timing, magnitude, and
% relative composition of extreme total water levels vary seasonally along
% the U.S. Atlantic Coast" by  Gabrielle P. Quadrado & Katherine A. Serafin,
% Journal of Geophysical Research: Oceans, 2024. Legend for stations and
% corresponding colors were added in a separate image editing software, not
% in Matlab.
%
% Created by G. Quadrado, University of Florida, June 2023
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% set path to where data is stored
addpath '...\USAtlanticTWLs\kendallsCorrelation\';
clc;close all;clear all
pth = '...\USAtlanticTWLs\kendallsCorrelation\';

load([pth 'pval_TC.mat']);
load([pth 'pval_ET.mat']);
load([pth 'tauCoefficient_TC.mat']);
load([pth 'tauCoefficient_ET.mat']);

%Set colors for each station
colors = [
    "#a50026"; % Fernandina Beach, FL
    "#d73027"; % Fort Pulaski, GA
    "#f46d43"; % Charleston, SC
    "#fdae61"; % Springmaid Pier, SC
    "#fee090"; % Beaufort, NC
    "#ffffbf"; % Duck, NC
    "#e0f3f8"; % Kiptopeke, VA
    "#abd9e9"; % Lewes, DE
    "#4575b4"; % Atlantic City, NJ
    "#313695"; % Sandy Hook, NJ
];


f=figure(5);
f.Position = [86,38.6,1444,771.2];
subplot(1,2,2)

% Create fake elements for legend
plot(-0.5,-0.5,'ko','markersize',15,'markerfacecolor',[0 0 0],'linewidth',1.5)
hold on 
plot(-0.5,-0.5,'ko','markerfacecolor',[1 1 1],'markersize',17,'linewidth',1.5)
hold on 
plot(-0.5,-0.5,'ks','markerfacecolor',[0 0 0],'markersize',15,'linewidth',1.5)
hold on 
plot(-0.5,-0.5,'ks','markerfacecolor',[1 1 1],'markersize',17,'linewidth',1.5)
hold on 
plot(-0.5,-0.5,'k*')
hold on 
plot(-0.5,0.5,'k+')
hold on 
plot(-0.5,0.5,'k.')

% set parameters first because of legend
subplot(1,2,2)
ylim([0 0.6])
xlim([0 0.6])
ylabel(['Kendall''s \tau - Extratropical'])
xlabel(['Kendall''s \tau - Tropical'])
set(gca,'fontsize',14,'fontweight','bold')
grid on 
hline = refline(1);
hline.Color = [0.8 0.8 0.8];
hline.LineWidth = 0.5;
hold on 
lgd = legend('TWL - \eta_{SS}','\eta_{SS} - TWL','TWL - H_S','H_S - TWL','Significant for TC and ET','Significant for TC only','Significant for ET only','1-1 Line','location','southwest','autoupdate','off');
title(lgd,{'Pairs','(conditioning - conditioned)'})



for i = 1:10
subplot(1,2,1)
plot(rho_TC(i,1),rho_ET(i,1),'o','markerfacecolor',colors(i),'markeredgecolor',...
colors(i),'markersize',15,'linewidth',1.25)
hold on
plot(rho_TC(i,2),rho_ET(i,2),'o','markerfacecolor',[1 1 1], ...
'markeredgecolor',colors(i),'markersize',17,'LineWidth',1.5)
hold on 

subplot(1,2,2)
plot(rho_TC(i,3),rho_ET(i,3),'s','markerfacecolor',colors(i), ...
'markeredgecolor',colors(i),'markersize',15,'linewidth',1.25)
hold on 
plot(rho_TC(i,4),rho_ET(i,4),'s','markerfacecolor',[1 1 1], ...
'markeredgecolor',colors(i),'markersize',17,'LineWidth',1.25)
% plot([-0.1 max([xlim ylim])], [-0.1 max([xlim ylim])], 'k','linewidth',1.25)
hold on 
end

subplot(1,2,1)
for i = 1:10 
    if (pval_TC(i,1) < 0.05) && (pval_ET(i,1)<0.05)
    plot(rho_TC(i,1),rho_ET(i,1),'*','markerfacecolor',[0 0 0],'markeredgecolor',...
[0 0 0],'markersize',10,'linewidth',0.75) 
    elseif (pval_ET(i,1)>0.05) && (pval_TC(i,1)<0.05) 
        plot(rho_TC(i,1),rho_ET(i,1),'+','markerfacecolor',[0 0 0],'markeredgecolor',...
[0 0 0],'markersize',10) 
    elseif (pval_TC(i,1)>0.05) && (pval_ET(i,1)<0.05) 
        plot(rho_TC(i,1),rho_ET(i,1),'.','markerfacecolor',[0 0 0],'markeredgecolor',...
[0 0 0],'markersize',13,'linewidth',0.75) 
    elseif (pval_TC(i,1)>0.05) && (pval_ET(i,1)>0.05) 
    end 
    hold on 
end 

subplot(1,2,1)   
for i = 1:10 
    if (pval_TC(i,2) < 0.05) && (pval_ET(i,2)<0.05)
    plot(rho_TC(i,2),rho_ET(i,2),'*','markerfacecolor',[0 0 0],'markeredgecolor',...
[0 0 0],'markersize',9,'linewidth',0.75) 
    elseif (pval_ET(i,2)>0.05) && (pval_TC(i,2)<0.05) 
        plot(rho_TC(i,2),rho_ET(i,2),'+','markerfacecolor',[0 0 0],'markeredgecolor',...
[0 0 0],'markersize',10) 
    elseif (pval_TC(i,2)>0.05) && (pval_ET(i,2)<0.05) 
        plot(rho_TC(i,2),rho_ET(i,2),'.','markerfacecolor',[0 0 0],'markeredgecolor',...
[0 0 0],'markersize',8,'linewidth',0.75) 
    elseif (pval_TC(i,2)>0.05) && (pval_ET(i,2)>0.05) 
    end 
    hold on 
end 

subplot(1,2,2)
for i = 1:10 
    if (pval_TC(i,3) < 0.05) && (pval_ET(i,3)<0.05)
    plot(rho_TC(i,3),rho_ET(i,3),'*','markerfacecolor',[0 0 0],'markeredgecolor',...
[0 0 0],'markersize',9,'linewidth',0.75) 
    elseif (pval_ET(i,3)>0.05) && (pval_TC(i,3)<0.05) 
        plot(rho_TC(i,3),rho_ET(i,3),'+','markerfacecolor',[0 0 0],'markeredgecolor',...
[0 0 0],'markersize',10) 
    elseif (pval_TC(i,3)>0.05) && (pval_ET(i,3)<0.05) 
        plot(rho_TC(i,3),rho_ET(i,3),'.','markerfacecolor',[0 0 0],'markeredgecolor',...
[0 0 0],'markersize',8,'linewidth',0.75) 
    elseif (pval_TC(i,3)>0.05) && (pval_ET(i,3)>0.05) 
    end 
    hold on 
end 

subplot(1,2,2)
for i = 1:10 
    if (pval_TC(i,4) < 0.05) && (pval_ET(i,4)<0.05)
    plot(rho_TC(i,4),rho_ET(i,4),'*','markerfacecolor',[0 0 0],'markeredgecolor',...
[0 0 0],'markersize',9,'linewidth',0.75) 
    elseif (pval_ET(i,4)>0.05) && (pval_TC(i,4)<0.05) 
        plot(rho_TC(i,4),rho_ET(i,4),'+','markerfacecolor',[0 0 0],'markeredgecolor',...
[0 0 0],'markersize',10) 
    elseif (pval_TC(i,4)>0.05) && (pval_ET(i,4)<0.05) 
        plot(rho_TC(i,4),rho_ET(i,4),'.','markerfacecolor',[0 0 0],'markeredgecolor',...
[0 0 0],'markersize',8,'linewidth',0.75) 
    elseif (pval_TC(i,4)>0.05) && (pval_ET(i,4)>0.05) 
    end 
    hold on 
end 

subplot(1,2,1)
ylim([0 0.6])
xlim([0 0.6])
ylabel(['Kendall''s \tau - Extratropical'])
xlabel(['Kendall''s \tau - Tropical'])
set(gca,'fontsize',14,'fontweight','bold')
grid on 
hline = refline(1);
hline.Color = [0.8 0.8 0.8];
hline.LineWidth = 0.5;
hold on 
