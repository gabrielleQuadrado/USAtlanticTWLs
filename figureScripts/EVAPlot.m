% EVAPlot This script plots the estimates of return levels based on
% GEV fits for annual maxima, and seasonal maxima events along with
% estimates of return levels based on GPD fits for peak-over-thresholds
% (POT) for the full TWL time series, and for the tropical (TC) and
% extratropical (ET) seasons at Sandy Hook, NJ, Kipopeke, VA, and Fernandina
% Beach, FL. It also plots the combined return period estimates based on
% the GEV Fit - TC and GEV Fit - ET, and GPD Fit - TC and GPD Fit - ET.
% 
% This script reproduces Figure 9 of the paper "The timing, magnitude, and
% relative composition of extreme total water levels vary seasonally along
% the U.S. Atlantic Coast" by Gabrielle P. Quadrado & Katherine A. Serafin,
% Journal of Geophysical Research: Oceans, 2024.
%
% Created by G. Quadrado, University of Florida, July 2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
addpath '...\USAtlanticTWLs/EVAFits'; % set path to where data is stored
% Create figure
f=figure(40);
f.Position = [-1,237,1444,453];
% Load Sandy Hook, NJ files
fname='SandyHook';
load([fname '_blockMaxima_plotvar.mat']);
load([fname '_POT_plotvar.mat']);


% 1.0 Block maxima approach - annual and seasonal maxima
subplot(1,3,1)
plot(1./yp,retgevind,'k-','linewidth',1.25) % GEV Fit - all annual maxima
hold on 
plot(1./yp_tc,retgevind_tc,'k--','linewidth',1.25) % GEV Fit - TC seasonal maxima
hold on 
plot(1./yp_et,retgevind_et,'k:','linewidth',1.5) % GEV Fit - ET seasonal maxima
hold on 
plot(combinedRP(1,1:7:276),RLtc(1,1:7:276),'k+','linewidth',1.25) % Combined probability curve
hold on

% 2.0 Peak-over-threshold (POT) Approach - all and seasonal 

% Calculate confidence intervals around GPD - all POT return level estimates
x2 = n; 
lowerCIGPD = xm-1.96*varxm.^.5; 
upperCIGPD = xm+1.96*varxm.^.5;
idx = (find(isnan(lowerCIGPD)==0));
lowerCIGPD = lowerCIGPD(idx);
upperCIGPD = upperCIGPD(idx);
x2 = x2(idx);

plot(n,xm,'r-','LineWidth',1.25) % GPD Fit - all POT
hold on 
plot(n_tc,xm_tc,'r--','linewidth',1.25) % GPD Fit - POT during TC season
hold on 
plot(n_et,xm_et,'r:','linewidth',1.5) % GPD Fit - POT during ET season
hold on 
plot(combinedRP_POT(1,1:7:276),RLtc_POT(1,1:7:276),'r+','linewidth',1.25) % Combined probability curve
set(gca, 'XScale', 'log')
fill([x fliplr(x)], [CI_lower fliplr(CI_upper)], 'k', 'FaceAlpha', 0.125, 'EdgeColor', 'none')
hold on 
fill([x2 fliplr(x2)], [lowerCIGPD fliplr(upperCIGPD)], 'r', 'FaceAlpha', 0.075, 'EdgeColor', 'none')
xlim(  [1 200])
ylim([2 7.5])
ylabel('TWL (m)')
xlabel('Return Period (years)')
set(gca,'fontsize',14,'fontweight','bold')
title('Sandy Hook, NJ')
grid on
legend('GEV Fit - all','GEV Fit - TC','GEV Fit - ET','GEV Fit - Combined TC & ET','GPD Fit - all','GPD Fit - TC','GPD Fit - ET','GPD Fit - Combined TC & ET',...
    'Confidence Bounds (GEV Fit - all)','Confidence Bounds (GPD Fit - all)','location','southeast','fontsize',8)

%% Kiptopeke, VA
% Load Kiptopeke, VA files
fname='Kiptopeke';
load([fname '_blockMaxima_plotvar.mat']);
load([fname '_POT_plotvar.mat']);

% 1.0 Block maxima approach - annual and seasonal maxima
% For combined GPD curve merge with TC fit at the tail
RPtcfull=1./yp_tc;
idx = find(RPtcfull>=14);
plotRL = retgevind_tc(idx); 
plotRP = RPtcfull(idx);

subplot(1,3,2)
plot(1./yp,retgevind,'k-','linewidth',1.75) % GEV Fit - all annual maxima
hold on 
plot(1./yp_tc,retgevind_tc,'k--','linewidth',1.75) % GEV Fit - TC seasonal maxima
hold on 
plot(1./yp_et,retgevind_et,'k:','linewidth',1.75) % GEV Fit - ET seasonal maxima
hold on 
plot(combinedRP(1,1:7:114),RLtc(1,1:7:114),'k+','linewidth',1.25)
hold on
plot(plotRP(1:50:length(plotRP)),plotRL(1:50:length(plotRP)),'k+','linewidth',1.25) % plot by merging the combined RP with the TC


% 2.0 Peak-over-threshold (POT) Approach - all and seasonal 
% For combined GPD curve merge with TC fit at the tail
RPtcfull=n_tc;
idx = find(RPtcfull>=10);
plotRL = xm_tc(idx); 
plotRP = RPtcfull(idx);

% Calculate confidence intervals around GPD - all POT return level estimates
x2 = n; 
lowerCIGPD = xm-1.96*varxm.^.5;
upperCIGPD = xm+1.96*varxm.^.5;
idx = (find(isnan(lowerCIGPD)==0));
lowerCIGPD = lowerCIGPD(idx);
upperCIGPD = upperCIGPD(idx);
x2 = x2(idx);

plot(n,xm,'r-','LineWidth',1.5) % GPD Fit - all POT
hold on 
plot(n_tc,xm_tc,'r--','linewidth',1.5) % GPD Fit - POT during TC season
hold on 
plot(n_et,xm_et,'r:','linewidth',1.5) % GPD Fit - POT during ET season
hold on
plot(combinedRP_POT(1,1:7:99),RLtc_POT(1,1:7:99),'r+','linewidth',1.25)
hold on 
plot(plotRP(1:50:length(plotRP)),plotRL(1:50:length(plotRP)),'r+','linewidth',1.25) % plot by merging the combined curve with the TC curve at the tail

set(gca, 'XScale', 'log')
fill([x fliplr(x)], [CI_lower fliplr(CI_upper)], 'k', 'FaceAlpha', 0.125, 'EdgeColor', 'none')
hold on 
fill([x2 fliplr(x2)], [lowerCIGPD fliplr(upperCIGPD)], 'r', 'FaceAlpha', 0.075, 'EdgeColor', 'none')
xlim(  [1 200])
ylim([2 7.5])
ylabel('TWL (m)')
xlabel('Return Period (years)')
set(gca,'fontsize',14,'fontweight','bold')
title('Kiptopeke, VA')
grid on

%% Fernandina Beach, FL
% Load Fernandina Beach, FL files
fname='FernandinaBeach'
load([fname '_blockMaxima_plotvar.mat']);
load([fname '_POT_plotvar.mat']);

% 1.0 Block maxima approach - annual and seasonal maxima
% For combined GPD curve merge with TC fit at the tail
RPtcfull=1./yp_tc;
idx = find(RPtcfull>=29);
plotRL = retgevind_tc(idx); 
plotRP = RPtcfull(idx);


subplot(1,3,3)
plot(1./yp,retgevind,'k-','linewidth',1.75) % GEV Fit - all annual maxima
hold on 
plot(1./yp_tc,retgevind_tc,'k--','linewidth',1.75) % GEV Fit - TC seasonal maxima
hold on 
plot(1./yp_et,retgevind_et,'k:','linewidth',1.75) % GEV Fit - ET seasonal maxima
hold on 
plot(combinedRP(1,1:7:154),RLtc(1,1:7:154),'k+','linewidth',1.25)
hold on
plot(plotRP(1:50:length(plotRP)),plotRL(1:50:length(plotRP)),'k+','linewidth',1.25) % plot by merging the combined RP with the TC

% 2.0 Peak-over-threshold (POT) Approach - all and seasonal 
% For combined GPD curve merge with TC fit at the tail
RPtcfull=n_tc;
idx = find(RPtcfull>=8);
plotRL = xm_tc(idx); 
plotRP = RPtcfull(idx);

% 2.0 Peak-over-threshold (POT) Approach - all and seasonal 
% Calculate confidence intervals around GPD - all POT return level estimates
x2 = n; 
lowerCIGPD = xm-1.96*varxm.^.5;
upperCIGPD = xm+1.96*varxm.^.5;
idx = (find(isnan(lowerCIGPD)==0));
lowerCIGPD = lowerCIGPD(idx);
upperCIGPD = upperCIGPD(idx);
x2 = x2(idx);

plot(n,xm,'r-','LineWidth',1.5) % GPD Fit - all POT
hold on 
plot(n_tc,xm_tc,'r--','linewidth',1.5) % GPD Fit - POT during TC season
hold on 
plot(n_et,xm_et,'r:','linewidth',1.5) % GPD Fit - POT during ET season
hold on 
hold on
plot(combinedRP_POT(1,1:7:98),RLtc_POT(1,1:7:98),'r+','linewidth',1.25)
hold on 
plot(plotRP(1:50:length(plotRP)),plotRL(1:50:length(plotRP)),'r+','linewidth',1.25) % plot by merging the combined RP with the TC
set(gca, 'XScale', 'log')
fill([x fliplr(x)], [CI_lower fliplr(CI_upper)], 'k', 'FaceAlpha', 0.125, 'EdgeColor', 'none')
hold on 
fill([x2 fliplr(x2)], [lowerCIGPD fliplr(upperCIGPD)], 'r', 'FaceAlpha', 0.075, 'EdgeColor', 'none')
xlim(  [1 200])
ylim([2 7.5])
ylabel('TWL (m)')
xlabel('Return Period (years)')
set(gca,'fontsize',14,'fontweight','bold')
title('Fernandina Beach, FL')
grid on