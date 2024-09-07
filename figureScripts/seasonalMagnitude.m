% seasonalMagnitude This script produces a panel plot figure displaying the
% average, minimum, and maximum magnitudes of seasonal maxima and
% peak-over-the-threshold (POT) TWL events, along with the associated 
% driving processes (i.e., SWL, R2%, Hs, Tp) during the tropical and 
% extratropical seasons. By specifying method = 1, it plots results for
% seasonal maxima. By specifying method = 2, it plots results for POT
% during the tropical and extratropical seasons. 
% 
% % This script reproduces Figure 7 and S2, from the supporting information, 
% in the paper "The timing, magnitude, and relative composition of extreme
% total water levels vary seasonally along the U.S. Atlantic Coast" by 
% Gabrielle P. Quadrado & Katherine A. Serafin, Journal of Geophysical 
% Research: Oceans, 2024.
%
% Created by G. Quadrado, University of Florida, July 2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% set paths to where data is stored
addpath '...\USAtlanticTWLs\seasonalMaximaEvents\magnitude\';
addpath '...\USAtlanticTWLs\POTseasonal\magnitude\';
addpath '...\USAtlanticTWLs\figureScripts\'
clc;close all;clear all

method=1; % Select method for reproducing Figure 7 (based on seasonal max.)
% or Figure S2 (based on POT during the tropical and extratropical seasons),
% where method = 1 = seasonal max., method = 2 = POT

%% 1.0 Set variables for plotting
if method == 1
% magnitude directory
pthTC = '...\USAtlanticTWLs\seasonalMaximaEvents\magnitude\tropicalSeason\'; 
pthET = '...\USAtlanticTWLs\seasonalMaximaEvents\magnitude\extratropicalSeason\'; 
[allTWL_TC,allTWL_ET,allSWL_TC,allSWL_ET,allR2_TC,allR2_ET,allHS_TC,allHS_ET,allTP_TC,allTP_ET] = setPlotVariables(pthTC,pthET,method);

elseif method == 2 
pthTC = '...\USAtlanticTWLs\POTseasonal\magnitude\tropicalSeason\'; 
pthET = '...\USAtlanticTWLs\POTseasonal\magnitude\extratropicalSeason\';
[allTWL_TC,allTWL_ET,allSWL_TC,allSWL_ET,allR2_TC,allR2_ET,allHS_TC,allHS_ET,allTP_TC,allTP_ET] = setPlotVariables(pthTC,pthET,method);

end 

y = 1:1:10;
repy = repmat(y,3,1);

% Set colors by location
locations = {'Fernandina Beach, FL','Fort Pulaski, GA','Charleston, SC','Springmaid Pier, SC', ...
  'Beaufort, NC','Duck, NC','Kiptopeke, VA','Lewes, DE','Atlantic City, NJ', ...
  'Sandy Hook, NJ'};

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

letters = 'abcde'; % set letters for subplots
% Define the positions for each subplot 
x_positions = [-6.92259,-5.1926,-3.4519,-1.7185,0.0296];
y_positions = [0.99,0.99,0.99, 0.99, 0.99];

%% 2.0 Plot
f=figure(95)
f.Position = [1,49,1440,775];
subplot(1,5,1)
plot(allTWL_TC(2,:),repy(2,:),'-','linewidth',0.1,'color',[0.27 0.27 0.27])
hold on 
plot(allTWL_ET(2,:),repy(2,:),'k--','linewidth',0.1,'color',[0.27 0.27 0.27])
hold on 
for i = 1:10
ptc(i,:)=plot(allTWL_TC(:,i),repy(:,i),'-','linewidth',5,'Color',colors(i))
hold on 
ptcmarker(i,:)=plot(allTWL_TC(2,i),y(i),'o','markersize',13,'LineWidth',.5,'MarkerEdgeColor',[0.27 0.27 0.27])
hold on 
pet(i,:)=plot(allTWL_ET(:,i),repy(:,i),':','linewidth',3,'Color',[0.6 0.6 0.6]);
hold on
petmarker(i,:)=plot(allTWL_ET(2,i),y(i),'k.','markersize',27,'linewidth',1.25)
hold on 
end
xlabel('TWL (m)','fontsize',16,'fontweight','bold')
grid on 
yticklabels(locations)
xlim([2 8])
xticks([2:2:8])
ylim([1 10])
set(gca,'fontsize',16,'fontweight','bold')

set(ptcmarker(1),'MarkerFaceColor','#a50026');
set(ptcmarker(2),'MarkerFaceColor','#d73027');
set(ptcmarker(3),'MarkerFaceColor','#f46d43');
set(ptcmarker(4),'MarkerFaceColor','#fdae61');
set(ptcmarker(5),'MarkerFaceColor','#fee090');
set(ptcmarker(6),'MarkerFaceColor','#ffffbf');
set(ptcmarker(7),'MarkerFaceColor','#e0f3f8');
set(ptcmarker(8),'MarkerFaceColor','#abd9e9');
set(ptcmarker(9),'MarkerFaceColor','#4575b4'); % #74add1 excluded tone
set(ptcmarker(10),'MarkerFaceColor','#313695');

% SWL
subplot(1,5,2)
plot(allSWL_TC(2,:),repy(2,:),'-','linewidth',0.1,'color',[0.27 0.27 0.27])
hold on 
plot(allSWL_ET(2,:),repy(2,:),'k--','linewidth',0.1,'color',[0.27 0.27 0.27])
hold on 
for i = 1:10
ptc(i,:)=plot(allSWL_TC(:,i),repy(:,i),'-','linewidth',5,'Color',colors(i));
hold on 
ptcmarker(i,:)=plot(allSWL_TC(2,i),y(i),'o','markersize',13,'LineWidth',.5,'MarkerEdgeColor',[0.27 0.27 0.27]);
hold on 
pet(i,:)=plot(allSWL_ET(:,i),repy(:,i),':','linewidth',3,'Color',[0.6 0.6 0.6]);
hold on
petmarker(i,:)=plot(allSWL_ET(2,i),y(i),'k.','markersize',27,'linewidth',1.25);
hold on 
end
set(gca,'fontsize',16,'fontweight','bold')
xlabel('SWL (m)','fontsize',16,'fontweight','bold')
grid on 
yticklabels('')
xlim([0 4])
xticks([0:1:4])
ylim([1 10])

set(ptcmarker(1),'MarkerFaceColor','#a50026');
set(ptcmarker(2),'MarkerFaceColor','#d73027');
set(ptcmarker(3),'MarkerFaceColor','#f46d43');
set(ptcmarker(4),'MarkerFaceColor','#fdae61');
set(ptcmarker(5),'MarkerFaceColor','#fee090');
set(ptcmarker(6),'MarkerFaceColor','#ffffbf');
set(ptcmarker(7),'MarkerFaceColor','#e0f3f8');
set(ptcmarker(8),'MarkerFaceColor','#abd9e9');
set(ptcmarker(9),'MarkerFaceColor','#4575b4'); % #74add1 excluded tone
set(ptcmarker(10),'MarkerFaceColor','#313695');

% R2
subplot(1,5,3)
plot(allR2_TC(2,:),repy(2,:),'-','linewidth',0.1,'color',[0.27 0.27 0.27])
hold on 
plot(allR2_ET(2,:),repy(2,:),'k--','linewidth',0.1,'color',[0.27 0.27 0.27])
hold on 
for i = 1:10
ptc(i,:)=plot(allR2_TC(:,i),repy(:,i),'-','linewidth',5,'Color',colors(i));
hold on 
ptcmarker(i,:)=plot(allR2_TC(2,i),y(i),'o','markersize',13,'LineWidth',.5,'MarkerEdgeColor',[0.27 0.27 0.27]);
hold on 
pet(i,:)=plot(allR2_ET(:,i),repy(:,i),':','linewidth',3,'Color',[0.6 0.6 0.6]);
hold on
petmarker(i,:)=plot(allR2_ET(2,i),y(i),'k.','markersize',27,'linewidth',1.25);
hold on 
end
xlabel('R_{2%} (m)','fontsize',16,'fontweight','bold')
grid on 
yticklabels('')
xlim([0.5 4.5])
xticks([1:1:4.5])
ylim([1 10])
set(gca,'fontsize',16,'fontweight','bold')

set(ptcmarker(1),'MarkerFaceColor','#a50026');
set(ptcmarker(2),'MarkerFaceColor','#d73027');
set(ptcmarker(3),'MarkerFaceColor','#f46d43');
set(ptcmarker(4),'MarkerFaceColor','#fdae61');
set(ptcmarker(5),'MarkerFaceColor','#fee090');
set(ptcmarker(6),'MarkerFaceColor','#ffffbf');
set(ptcmarker(7),'MarkerFaceColor','#e0f3f8');
set(ptcmarker(8),'MarkerFaceColor','#abd9e9');
set(ptcmarker(9),'MarkerFaceColor','#4575b4'); % #74add1 excluded tone
set(ptcmarker(10),'MarkerFaceColor','#313695');

% HS
subplot(1,5,4)
plot(allHS_TC(2,:),repy(2,:),'-','linewidth',0.1,'color',[0.27 0.27 0.27])
hold on 
plot(allHS_ET(2,:),repy(2,:),'k--','linewidth',0.1,'color',[0.27 0.27 0.27])
hold on 
for i = 1:10
ptc(i,:)=plot(allHS_TC(:,i),repy(:,i),'-','linewidth',5,'Color',colors(i));
hold on 
ptcmarker(i,:)=plot(allHS_TC(2,i),y(i),'o','markersize',13,'LineWidth',.5,'MarkerEdgeColor',[0.27 0.27 0.27]);
hold on 
pet(i,:)=plot(allHS_ET(:,i),repy(:,i),':','linewidth',3,'Color',[0.6 0.6 0.6]);
hold on
petmarker(i,:)=plot(allHS_ET(2,i),y(i),'k.','markersize',27,'linewidth',1.25);
hold on 
end
xlabel('H_S (m)','fontsize',16,'fontweight','bold')
grid on 
yticklabels('')
xlim([1 15])
xticks([1:4:15])
ylim([1 10])
set(gca,'fontsize',16,'fontweight','bold')
xtickangle(0)

set(ptcmarker(1),'MarkerFaceColor','#a50026');
set(ptcmarker(2),'MarkerFaceColor','#d73027');
set(ptcmarker(3),'MarkerFaceColor','#f46d43');
set(ptcmarker(4),'MarkerFaceColor','#fdae61');
set(ptcmarker(5),'MarkerFaceColor','#fee090');
set(ptcmarker(6),'MarkerFaceColor','#ffffbf');
set(ptcmarker(7),'MarkerFaceColor','#e0f3f8');
set(ptcmarker(8),'MarkerFaceColor','#abd9e9');
set(ptcmarker(9),'MarkerFaceColor','#4575b4'); % #74add1 excluded tone
set(ptcmarker(10),'MarkerFaceColor','#313695');


% TP
subplot(1,5,5)
plot(1.5,y(1,1),'o','MarkerSize',13,'MarkerFaceColor',[1 1 1],'MarkerEdgeColor',[0.27 0.27 0.27],'linewidth',0.5);
hold on 
plot(allTP_TC(2,:),repy(2,:),'-','linewidth',0.1,'color',[0.27 0.27 0.27])
hold on 
plot(allTP_ET(2,:),repy(2,:),'k--','linewidth',0.1,'color',[0.27 0.27 0.27])
hold on 
for i = 1:10
ptc(i,:)=plot(allTP_TC(:,i),repy(:,i),'-','linewidth',5,'Color',colors(i));
hold on 
ptcmarker(i,:)=plot(allTP_TC(2,i),y(i),'o','markersize',13,'LineWidth',.5,'MarkerEdgeColor',[0.27 0.27 0.27]);
hold on 
pet(i,:)=plot(allTP_ET(:,i),repy(:,i),':','linewidth',3,'Color',[0.6 0.6 0.6]);
hold on
petmarker(i,:)=plot(allTP_ET(2,i),y(i),'k.','markersize',27,'linewidth',1.25);
hold on 
end
xlabel('T_P (s)','fontsize',16,'fontweight','bold')
grid on 
yticklabels('')
xlim([7 20])
xticks([7:4:20])
ylim([1 10])
set(gca,'fontsize',16,'fontweight','bold')
xtickangle(0)

set(ptcmarker(1),'MarkerFaceColor','#a50026');
set(ptcmarker(2),'MarkerFaceColor','#d73027');
set(ptcmarker(3),'MarkerFaceColor','#f46d43');
set(ptcmarker(4),'MarkerFaceColor','#fdae61');
set(ptcmarker(5),'MarkerFaceColor','#fee090');
set(ptcmarker(6),'MarkerFaceColor','#ffffbf');
set(ptcmarker(7),'MarkerFaceColor','#e0f3f8');
set(ptcmarker(8),'MarkerFaceColor','#abd9e9');
set(ptcmarker(9),'MarkerFaceColor','#4575b4'); % #74add1 excluded tone
set(ptcmarker(10),'MarkerFaceColor','#313695');

for i = 1:length(letters)
 text(x_positions(i), y_positions(i), letters(i), 'Units', 'normalized', 'FontSize', 11, 'FontWeight', 'bold');
end

l=legend('Tropical Season','','','','','','Extratropical Season','Orientation','horizontal');
l.Position=[0.360031030327992,0.950107527843086,0.306944437407785,0.037419353877344];