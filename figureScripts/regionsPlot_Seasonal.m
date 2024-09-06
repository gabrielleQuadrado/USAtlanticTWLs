%regionsPlot_Seasonal This script plots the average relative contribution
% to seasonal maxima TWLs across multiple stations comparing results based
% on uniform vs. non-uniform/locally-averaged beach slope estimates OR
% results based on wave runup vs. wave setup as the TWL wave-induced
% component. By specifying runup = 1, it plots results to compare between
% uniform vs. non-uniform beach slopes. By specifying runup = 0, it plots the
% results to compare between wave runup vs. wave setup as the TWL
% wave-induced component.
%
%
% This script reproduces Figure S3 and S4 in the supporting information of
% the paper "The timing, magnitude, and relative composition of extreme
% total water levels vary seasonally along the U.S. Atlantic Coast" by 
% Gabrielle P. Quadrado & Katherine A. Serafin, Journal of Geophysical 
% Research: Oceans, 2024.
%
% Created by G. Quadrado, University of Florida, April 2023
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
addpath '...\USAtlanticTWLs\seasonalMaximaEvents\'; % set path to where data is stored
clc;close all;clear all
runup=1; % Select wave-induced component for subplots in the 2nd column,
% where runup = 1 (for Figure S3), setup = 0 (for Figure S4)

%% 1.0 Tropical Season Plots
% 1a. Uniform beach slope, wave runup component
% Set path to files location
pth='...\USAtlanticTWLs\seasonalMaximaEvents\relativeContribution\runup_uniformBeta\';
S = dir(fullfile(pth,'*_statsContribution_TC_runup.mat'));

for i = 1:numel(S)
    F = fullfile(pth,S(i).name);
    S(i).data = load(F); 
end

statsAtlanticCity = S(1).data;
statsBeaufort = S(2).data;
statsCharleston = S(3).data;
statsDuck = S(4).data;
statsFernandina = S(5).data;
statsLewes = S(6).data;
statsMyrtle = S(7).data;
statsSandy = S(8).data;
statsSavannah = S(9).data;
statsVirginia = S(10).data;

y = 1:10;
f=figure(1);
f.Position = [1 40 1540 750]
subplot(2,2,1)
b = barh(y(1),statsFernandina.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
b(7).CData = [0.3020    0.7451    0.9333]; % R2%
hold on 

b = barh(y(2),statsSavannah.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
b(7).CData = [0.3020    0.7451    0.9333]; % R2%
hold on 

b = barh(y(3),statsCharleston.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
b(7).CData = [0.3020    0.7451    0.9333]; % R2%
hold on 

b = barh(y(4),statsMyrtle.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
b(7).CData = [0.3020    0.7451    0.9333]; % R2%
hold on 

b = barh(y(5),statsBeaufort.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
b(7).CData = [0.3020    0.7451    0.9333]; % R2%
hold on 

b = barh(y(6),statsDuck.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
b(7).CData = [0.3020    0.7451    0.9333]; % R2%
hold on 

b = barh(y(7),statsVirginia.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
b(7).CData = [0.3020    0.7451    0.9333]; % R2%
hold on 

b = barh(y(8),statsLewes.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
b(7).CData = [0.3020    0.7451    0.9333]; % R2%
hold on 

b = barh(y(9),statsAtlanticCity.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
b(7).CData = [0.3020    0.7451    0.9333]; % R2%
hold on 

b = barh(y(10),statsSandy.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
b(7).CData = [0.3020    0.7451    0.9333]; % R2%
 
if runup == 0
% create fake bar to make legend have 8 entries for wave setup plot
hold on 
b2 = barh(nan,nan,'FaceColor',[1 0.0745 0.6510]); % wave setup 
legend([b, b2], {'\eta_{SLR}','\eta_{A}','\eta_{SE}','\eta_{SLA}','\eta_{SS}','Residual','R_{2%}','<\eta>'}, ...
    'fontsize',10,'Location', 'best', 'Orientation', 'vertical');
else
legend('\eta_{SLR}','\eta_{A}','\eta_{SE}','\eta_{SLA}','\eta_{SS}','Residual','R_{2%}', ...
    'fontsize',10,'Location', 'best', 'Orientation', 'vertical');
end 

grid on
ax = gca;
ax.FontSize = 14;
ax.FontWeight = 'bold';
xlabel('% contribution to TWL','FontSize',14,'FontWeight',"bold");
yticks([1:1:11]);
xlim([-6 100])
if runup == 1
title(['Tropical Season - uniform']) 
elseif runup == 0
    title(['Tropical Season - wave runup']) 
end

yticklabels({'Fernandina Beach, FL','Fort Pulaski, GA','Charleston, SC','Springmaid Pier, SC', ...
    'Beaufort, NC','Duck, NC','Kiptopeke, VA','Lewes, DE','Atlantic City, NJ', ...
    'Sandy Hook, NJ'});

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1b. Non-uniform beach slope and wave runup component OR 
% uniform beach slope and wave setup component 

% Set path where non-uniform or wave setup data is stored
if runup == 1 
   pth='...\USAtlanticTWLs\seasonalMaximaEvents\relativeContribution\runup_nonuniformBeta\';
    S = dir(fullfile(pth,'*_statsContribution_TC_runup.mat'));
elseif runup == 0 
    pth = '...\USAtlanticTWLs\seasonalMaximaEvents\relativeContribution\setup\';
    S = dir(fullfile(pth,'*_statsContribution_TC_setup.mat'));
end 

for i = 1:numel(S)
    F = fullfile(pth,S(i).name);
    S(i).data = load(F); 
end

statsAtlanticCity = S(1).data;
statsBeaufort = S(2).data;
statsCharleston = S(3).data;
statsDuck = S(4).data;
statsFernandina = S(5).data;
statsLewes = S(6).data;
statsMyrtle = S(7).data;
statsSandy = S(8).data;
statsSavannah = S(9).data;
statsVirginia = S(10).data;

subplot(2,2,2)
b = barh(y(1),statsFernandina.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
if runup == 1
    b(7).CData = [0.3020    0.7451    0.9333]; % R2%
    hold on
elseif runup == 0 
b(7).CData = [ 1.0000    0.0745    0.6510]; % setup
hold on 
end

b = barh(y(2),statsSavannah.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
if runup == 1
    b(7).CData = [0.3020    0.7451    0.9333]; % R2%
    hold on
elseif runup == 0 
b(7).CData = [ 1.0000    0.0745    0.6510]; % setup
hold on 
end

b = barh(y(3),statsCharleston.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
if runup == 1
    b(7).CData = [0.3020    0.7451    0.9333]; % R2%
    hold on
elseif runup == 0 
b(7).CData = [ 1.0000    0.0745    0.6510]; % setup
hold on 
end

b = barh(y(4),statsMyrtle.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
if runup == 1
    b(7).CData = [0.3020    0.7451    0.9333]; % R2%
    hold on
elseif runup == 0 
b(7).CData = [ 1.0000    0.0745    0.6510]; % setup
hold on 
end

b = barh(y(5),statsBeaufort.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
if runup == 1
    b(7).CData = [0.3020    0.7451    0.9333]; % R2%
    hold on
elseif runup == 0 
b(7).CData = [ 1.0000    0.0745    0.6510]; % setup
hold on 
end

b = barh(y(6),statsDuck.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
if runup == 1
    b(7).CData = [0.3020    0.7451    0.9333]; % R2%
    hold on
elseif runup == 0 
b(7).CData = [ 1.0000    0.0745    0.6510]; % setup
hold on 
end

b = barh(y(7),statsVirginia.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
if runup == 1
    b(7).CData = [0.3020    0.7451    0.9333]; % R2%
    hold on
elseif runup == 0 
b(7).CData = [ 1.0000    0.0745    0.6510]; % setup
hold on 
end

b = barh(y(8),statsLewes.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
if runup == 1
    b(7).CData = [0.3020    0.7451    0.9333]; % R2%
    hold on
elseif runup == 0 
b(7).CData = [ 1.0000    0.0745    0.6510]; % setup
hold on 
end

b = barh(y(9),statsAtlanticCity.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
if runup == 1
    b(7).CData = [0.3020    0.7451    0.9333]; % R2%
    hold on
elseif runup == 0 
b(7).CData = [ 1.0000    0.0745    0.6510]; % setup
hold on 
end

b = barh(y(10),statsSandy.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
if runup == 1
    b(7).CData = [0.3020    0.7451    0.9333]; % R2%
    hold on
elseif runup == 0 
b(7).CData = [ 1.0000    0.0745    0.6510]; % setup
hold on 
end

grid on
ax = gca;
ax.FontSize = 14;
ax.FontWeight = 'bold';
xlabel('% contribution to TWL','FontSize',14,'FontWeight',"bold");
yticks([1:1:11]);
xlim([-6 100])
yticklabels('');
if runup == 1 
title(['Tropical Season - non-uniform']) 
elseif runup  == 0 
    title('Tropical Season - wave setup')
end


%% 2.0 Extratropical Season Plots
% 2a. Uniform beach slope, wave runup component
% Set path to files location
pth='...\USAtlanticTWLs\seasonalMaximaEvents\relativeContribution\runup_uniformBeta\';
S = dir(fullfile(pth,'*_statsContribution_ET_runup.mat'));


for i = 1:numel(S)
    F = fullfile(pth,S(i).name);
    S(i).data = load(F); 
end

statsAtlanticCity_TC = S(1).data;
statsBeaufort = S(2).data;
statsCharleston = S(3).data;
statsDuck = S(4).data;
statsFernandina = S(5).data;
statsLewes = S(6).data;
statsMyrtle = S(7).data;
statsSandy = S(8).data;
statsSavannah = S(9).data;
statsVirginia = S(10).data;

y = 1:10;
subplot(2,2,3)
b = barh(y(1),statsFernandina.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
b(7).CData = [0.3020    0.7451    0.9333]; % R2%
hold on 

b = barh(y(2),statsSavannah.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
b(7).CData = [0.3020    0.7451    0.9333]; % R2%
hold on 

b = barh(y(3),statsCharleston.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
b(7).CData = [0.3020    0.7451    0.9333]; % R2%
hold on 

b = barh(y(4),statsMyrtle.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
b(7).CData = [0.3020    0.7451    0.9333]; % R2%
hold on 

b = barh(y(5),statsBeaufort.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
b(7).CData = [0.3020    0.7451    0.9333]; % R2%
hold on 

b = barh(y(6),statsDuck.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
b(7).CData = [0.3020    0.7451    0.9333]; % R2%
hold on 

b = barh(y(7),statsVirginia.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
b(7).CData = [0.3020    0.7451    0.9333]; % R2%
hold on 

b = barh(y(8),statsLewes.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
b(7).CData = [0.3020    0.7451    0.9333]; % R2%
hold on 

b = barh(y(9),statsAtlanticCity_TC.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
b(7).CData = [0.3020    0.7451    0.9333]; % R2%
hold on 

b = barh(y(10),statsSandy.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
b(7).CData = [0.3020    0.7451    0.9333]; % R2%
hold on 

grid on
if runup == 1
title(['Extratropical Season - uniform']) 
elseif runup == 0
    title(['Extratropical Season - wave runup']) 
end

ax = gca;
ax.FontSize = 14;
ax.FontWeight = 'bold';
xlabel('% contribution to TWL','FontSize',14,'FontWeight',"bold");
yticks([1:1:11]);
xlim([-6 100])
yticklabels('')
yticklabels({'Fernandina Beach, FL','Fort Pulaski, GA','Charleston, SC','Springmaid Pier, SC', ...
    'Beaufort, NC','Duck, NC','Kiptopeke, VA','Lewes, DE','Atlantic City, NJ', ...
    'Sandy Hook, NJ'});

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2b. Non-uniform beach slope and wave runup component OR 
% uniform beach slope and wave setup component 
% Set path where non-uniform or wave setup data is stored

if runup == 1 
   pth='...\USAtlanticTWLs\seasonalMaximaEvents\relativeContribution\runup_nonuniformBeta\'; S = dir(fullfile(pth,'*_statsContribution_ET_runup.mat'));
elseif runup == 0 
    pth='...\USAtlanticTWLs\seasonalMaximaEvents\relativeContribution\setup\';
    S = dir(fullfile(pth,'*_statsContribution_ET_setup.mat'));
end 

for i = 1:numel(S)
    F = fullfile(pth,S(i).name);
    S(i).data = load(F); 
end

statsAtlanticCity_TC = S(1).data;
statsBeaufort = S(2).data;
statsCharleston = S(3).data;
statsDuck = S(4).data;
statsFernandina = S(5).data;
statsLewes = S(6).data;
statsMyrtle = S(7).data;
statsSandy = S(8).data;
statsSavannah = S(9).data;
statsVirginia = S(10).data;

y = 1:10;
subplot(2,2,4)
b = barh(y(1),statsFernandina.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
if runup == 1
    b(7).CData = [0.3020    0.7451    0.9333]; % R2%
    hold on
elseif runup == 0 
b(7).CData = [ 1.0000    0.0745    0.6510]; % setup
hold on 
end

b = barh(y(2),statsSavannah.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
if runup == 1
    b(7).CData = [0.3020    0.7451    0.9333]; % R2%
    hold on
elseif runup == 0 
b(7).CData = [ 1.0000    0.0745    0.6510]; % setup
hold on 
end

b = barh(y(3),statsCharleston.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
if runup == 1
    b(7).CData = [0.3020    0.7451    0.9333]; % R2%
    hold on
elseif runup == 0 
b(7).CData = [ 1.0000    0.0745    0.6510]; % setup
hold on 
end

b = barh(y(4),statsMyrtle.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
if runup == 1
    b(7).CData = [0.3020    0.7451    0.9333]; % R2%
    hold on
elseif runup == 0 
b(7).CData = [ 1.0000    0.0745    0.6510]; % setup
hold on 
end

b = barh(y(5),statsBeaufort.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
if runup == 1
    b(7).CData = [0.3020    0.7451    0.9333]; % R2%
    hold on
elseif runup == 0 
b(7).CData = [ 1.0000    0.0745    0.6510]; % setup
hold on 
end

b = barh(y(6),statsDuck.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
if runup == 1
    b(7).CData = [0.3020    0.7451    0.9333]; % R2%
    hold on
elseif runup == 0 
b(7).CData = [ 1.0000    0.0745    0.6510]; % setup
hold on 
end

b = barh(y(7),statsVirginia.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
if runup == 1
    b(7).CData = [0.3020    0.7451    0.9333]; % R2%
    hold on
elseif runup == 0 
b(7).CData = [ 1.0000    0.0745    0.6510]; % setup
hold on 
end

b = barh(y(8),statsLewes.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
if runup == 1
    b(7).CData = [0.3020    0.7451    0.9333]; % R2%
    hold on
elseif runup == 0 
b(7).CData = [ 1.0000    0.0745    0.6510]; % setup
hold on 
end

b = barh(y(9),statsAtlanticCity_TC.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
if runup == 1
    b(7).CData = [0.3020    0.7451    0.9333]; % R2%
    hold on
elseif runup == 0 
b(7).CData = [ 1.0000    0.0745    0.6510]; % setup
hold on 
end

b = barh(y(10),statsSandy.stats.mean,'stacked','FaceColor',"flat");
b(1).CData = [0    0.4471    0.7412]; % msl
b(2).CData = [0.4941    0.1843    0.5569]; % tide
b(3).CData = [0.9294    0.6941    0.1255]; % seasonality
b(4).CData = [0.8510    0.3255    0.0980]; % SLA
b(5).CData = [0.4667    0.6745    0.1882]; % SS
b(6).CData = [0.6353    0.0784    0.1843]; % Residual
if runup == 1
    b(7).CData = [0.3020    0.7451    0.9333]; % R2%
    hold on
elseif runup == 0 
b(7).CData = [ 1.0000    0.0745    0.6510]; % setup
hold on 
end

grid on
ax = gca;
ax.FontSize = 14;
ax.FontWeight = 'bold';
xlabel('% contribution to TWL','FontSize',14,'FontWeight',"bold");
yticks([1:1:11]);
xlim([-6 100])
yticklabels('')

if runup == 1 
title(['Extratropical Season - non-uniform']) 
elseif runup  == 0 
    title('Extratropical Season - wave setup')
end




