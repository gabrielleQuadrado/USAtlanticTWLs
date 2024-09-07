function [allTWL_TC,allTWL_ET,allSWL_TC,allSWL_ET,allR2_TC,allR2_ET,allHS_TC,allHS_ET,allTP_TC,allTP_ET] = setPlotVariables(pthTC,pthET,method)
% This function groups the average, minimum, and maximum magnitudes of
% seasonal maxima and peak-over-threshold (POT) TWL events, along with the 
% associated driving processes (i.e., SWL, R2%, Hs, Tp) during the tropical 
% and extratropical seasons. These estimates are calculated at 10 stations
% along the U.S. Atlantic Coast, from Florida to New Jersey, as presented
% in Quadrado & Serafin (2024). 
%
% INPUT: 
% pth = path where data is stored
% 
% method = specifies the sampling method for extreme TWL events,
% where 1 = seasonal maxima and 2 = POT
%
% OUTPUT: 
%
% allXX_YY = matrix containing average, minimum, and maximum of specified
% XX parameter (i.e., TWL, SWL, R2%, Hs, Tp) during the specified YY season 
% (i.e., TC = tropical season, ET = extratropical season). 
% Rows represent statistic type (1 = minimum, 2 = average, 3 = maximum) and
% columns represent stations from south to north, where
% 1 = Fernandina Beach, FL, 2 = Fort Pulaski, GA, [...], 9 = Atlantic City,
% NJ, and 10 = Sandy Hook, NJ. 
%
% 1.0 Group Statistics for plotting across all locations - Tropical Season
if method == 1
    S = dir(fullfile(pthTC,'*_statsMagnitude_TC_runup.mat'));
elseif method == 2
    S = dir(fullfile(pthTC,'*_POTstatsMagnitude_TC_runup.mat'));
end

for i = 1:numel(S)
    F = fullfile(pthTC,S(i).name);
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


% mean
twl_TC = [nanmean(statsFernandina.stats.mean(1)) nanmean(statsSavannah.stats.mean(1)) nanmean(statsCharleston.stats.mean(1)) ...
    nanmean(statsMyrtle.stats.mean(1)) nanmean(statsBeaufort.stats.mean(1)) nanmean(statsDuck.stats.mean(1)) nanmean(statsVirginia.stats.mean(1)) ...
    nanmean(statsLewes.stats.mean(1)) nanmean(statsAtlanticCity.stats.mean(1)) nanmean(statsSandy.stats.mean(1))];

swl_TC = [nanmean(statsFernandina.stats.mean(2)) nanmean(statsSavannah.stats.mean(2)) nanmean(statsCharleston.stats.mean(2)) ...
    nanmean(statsMyrtle.stats.mean(2)) nanmean(statsBeaufort.stats.mean(2)) nanmean(statsDuck.stats.mean(2)) nanmean(statsVirginia.stats.mean(2)) ...
    nanmean(statsLewes.stats.mean(2)) nanmean(statsAtlanticCity.stats.mean(2)) nanmean(statsSandy.stats.mean(2))];

r2_TC = [nanmean(statsFernandina.stats.mean(8)) nanmean(statsSavannah.stats.mean(8)) nanmean(statsCharleston.stats.mean(8)) ...
    nanmean(statsMyrtle.stats.mean(8)) nanmean(statsBeaufort.stats.mean(8)) nanmean(statsDuck.stats.mean(8)) nanmean(statsVirginia.stats.mean(8)) ...
    nanmean(statsLewes.stats.mean(8)) nanmean(statsAtlanticCity.stats.mean(8)) nanmean(statsSandy.stats.mean(8))];

hs_TC = [nanmean(statsFernandina.stats.mean(9)) nanmean(statsSavannah.stats.mean(9)) nanmean(statsCharleston.stats.mean(9)) ...
    nanmean(statsMyrtle.stats.mean(9)) nanmean(statsBeaufort.stats.mean(9)) nanmean(statsDuck.stats.mean(9)) nanmean(statsVirginia.stats.mean(9)) ...
    nanmean(statsLewes.stats.mean(9)) nanmean(statsAtlanticCity.stats.mean(9)) nanmean(statsSandy.stats.mean(9))];

tp_TC = [nanmean(statsFernandina.stats.mean(10)) nanmean(statsSavannah.stats.mean(10)) nanmean(statsCharleston.stats.mean(10)) ...
    nanmean(statsMyrtle.stats.mean(10)) nanmean(statsBeaufort.stats.mean(10)) nanmean(statsDuck.stats.mean(10)) nanmean(statsVirginia.stats.mean(10)) ...
    nanmean(statsLewes.stats.mean(10)) nanmean(statsAtlanticCity.stats.mean(10)) nanmean(statsSandy.stats.mean(10))];


% min
twlmin_TC = [nanmin(statsFernandina.stats.min(1)) nanmin(statsSavannah.stats.min(1)) nanmin(statsCharleston.stats.min(1)) ...
    nanmin(statsMyrtle.stats.min(1)) nanmin(statsBeaufort.stats.min(1)) nanmin(statsDuck.stats.min(1)) nanmin(statsVirginia.stats.min(1)) ...
    nanmin(statsLewes.stats.min(1)) nanmin(statsAtlanticCity.stats.min(1)) nanmin(statsSandy.stats.min(1))];

swlmin_TC = [nanmin(statsFernandina.stats.min(2)) nanmin(statsSavannah.stats.min(2)) nanmin(statsCharleston.stats.min(2)) ...
    nanmin(statsMyrtle.stats.min(2)) nanmin(statsBeaufort.stats.min(2)) nanmin(statsDuck.stats.min(2)) nanmin(statsVirginia.stats.min(2)) ...
    nanmin(statsLewes.stats.min(2)) nanmin(statsAtlanticCity.stats.min(2)) nanmin(statsSandy.stats.min(2))];

r2min_TC = [nanmin(statsFernandina.stats.min(8)) nanmin(statsSavannah.stats.min(8)) nanmin(statsCharleston.stats.min(8)) ...
    nanmin(statsMyrtle.stats.min(8)) nanmin(statsBeaufort.stats.min(8)) nanmin(statsDuck.stats.min(8)) nanmin(statsVirginia.stats.min(8)) ...
    nanmin(statsLewes.stats.min(8)) nanmin(statsAtlanticCity.stats.min(8)) nanmin(statsSandy.stats.min(8))];

hsmin_TC = [nanmin(statsFernandina.stats.min(9)) nanmin(statsSavannah.stats.min(9)) nanmin(statsCharleston.stats.min(9)) ...
    nanmin(statsMyrtle.stats.min(9)) nanmin(statsBeaufort.stats.min(9)) nanmin(statsDuck.stats.min(9)) nanmin(statsVirginia.stats.min(9)) ...
    nanmin(statsLewes.stats.min(9)) nanmin(statsAtlanticCity.stats.min(9)) nanmin(statsSandy.stats.min(9))];

tpmin_TC = [nanmin(statsFernandina.stats.min(10)) nanmin(statsSavannah.stats.min(10)) nanmin(statsCharleston.stats.min(10)) ...
    nanmin(statsMyrtle.stats.min(10)) nanmin(statsBeaufort.stats.min(10)) nanmin(statsDuck.stats.min(10)) nanmin(statsVirginia.stats.min(10)) ...
    nanmin(statsLewes.stats.min(10)) nanmin(statsAtlanticCity.stats.min(10)) nanmin(statsSandy.stats.min(10))];


% max
twlmax_TC = [nanmax(statsFernandina.stats.max(1)) nanmax(statsSavannah.stats.max(1)) nanmax(statsCharleston.stats.max(1)) ...
    nanmax(statsMyrtle.stats.max(1)) nanmax(statsBeaufort.stats.max(1)) nanmax(statsDuck.stats.max(1)) nanmax(statsVirginia.stats.max(1)) ...
    nanmax(statsLewes.stats.max(1)) nanmax(statsAtlanticCity.stats.max(1)) nanmax(statsSandy.stats.max(1))];

swlmax_TC = [nanmax(statsFernandina.stats.max(2)) nanmax(statsSavannah.stats.max(2)) nanmax(statsCharleston.stats.max(2)) ...
    nanmax(statsMyrtle.stats.max(2)) nanmax(statsBeaufort.stats.max(2)) nanmax(statsDuck.stats.max(2)) nanmax(statsVirginia.stats.max(2)) ...
    nanmax(statsLewes.stats.max(2)) nanmax(statsAtlanticCity.stats.max(2)) nanmax(statsSandy.stats.max(2))];

r2max_TC = [nanmax(statsFernandina.stats.max(8)) nanmax(statsSavannah.stats.max(8)) nanmax(statsCharleston.stats.max(8)) ...
    nanmax(statsMyrtle.stats.max(8)) nanmax(statsBeaufort.stats.max(8)) nanmax(statsDuck.stats.max(8)) nanmax(statsVirginia.stats.max(8)) ...
    nanmax(statsLewes.stats.max(8)) nanmax(statsAtlanticCity.stats.max(8)) nanmax(statsSandy.stats.max(8))];

hsmax_TC = [nanmax(statsFernandina.stats.max(9)) nanmax(statsSavannah.stats.max(9)) nanmax(statsCharleston.stats.max(9)) ...
    nanmax(statsMyrtle.stats.max(9)) nanmax(statsBeaufort.stats.max(9)) nanmax(statsDuck.stats.max(9)) nanmax(statsVirginia.stats.max(9)) ...
    nanmax(statsLewes.stats.max(9)) nanmax(statsAtlanticCity.stats.max(9)) nanmax(statsSandy.stats.max(9))];

tpmax_TC = [nanmax(statsFernandina.stats.max(10)) nanmax(statsSavannah.stats.max(10)) nanmax(statsCharleston.stats.max(10)) ...
    nanmax(statsMyrtle.stats.max(10)) nanmax(statsBeaufort.stats.max(10)) nanmax(statsDuck.stats.max(10)) nanmax(statsVirginia.stats.max(10)) ...
    nanmax(statsLewes.stats.max(10)) nanmax(statsAtlanticCity.stats.max(10)) nanmax(statsSandy.stats.max(10))];

%% 2.0 Group Statistics for plotting across all locations - Extratropical Season

if method == 1
    S = dir(fullfile(pthET,'*_statsMagnitude_ET_runup.mat'));
elseif method == 2
    S = dir(fullfile(pthET,'*_POT_statsMagnitude_ET_runup.mat'));
end

for i = 1:numel(S)
    F = fullfile(pthET,S(i).name);
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


% mean
twl_ET = [nanmean(statsFernandina.stats.mean(1)) nanmean(statsSavannah.stats.mean(1)) nanmean(statsCharleston.stats.mean(1)) ...
    nanmean(statsMyrtle.stats.mean(1)) nanmean(statsBeaufort.stats.mean(1)) nanmean(statsDuck.stats.mean(1)) nanmean(statsVirginia.stats.mean(1)) ...
    nanmean(statsLewes.stats.mean(1)) nanmean(statsAtlanticCity.stats.mean(1)) nanmean(statsSandy.stats.mean(1))];

swl_ET = [nanmean(statsFernandina.stats.mean(2)) nanmean(statsSavannah.stats.mean(2)) nanmean(statsCharleston.stats.mean(2)) ...
    nanmean(statsMyrtle.stats.mean(2)) nanmean(statsBeaufort.stats.mean(2)) nanmean(statsDuck.stats.mean(2)) nanmean(statsVirginia.stats.mean(2)) ...
    nanmean(statsLewes.stats.mean(2)) nanmean(statsAtlanticCity.stats.mean(2)) nanmean(statsSandy.stats.mean(2))];

r2_ET = [nanmean(statsFernandina.stats.mean(8)) nanmean(statsSavannah.stats.mean(8)) nanmean(statsCharleston.stats.mean(8)) ...
    nanmean(statsMyrtle.stats.mean(8)) nanmean(statsBeaufort.stats.mean(8)) nanmean(statsDuck.stats.mean(8)) nanmean(statsVirginia.stats.mean(8)) ...
    nanmean(statsLewes.stats.mean(8)) nanmean(statsAtlanticCity.stats.mean(8)) nanmean(statsSandy.stats.mean(8))];

hs_ET = [nanmean(statsFernandina.stats.mean(9)) nanmean(statsSavannah.stats.mean(9)) nanmean(statsCharleston.stats.mean(9)) ...
    nanmean(statsMyrtle.stats.mean(9)) nanmean(statsBeaufort.stats.mean(9)) nanmean(statsDuck.stats.mean(9)) nanmean(statsVirginia.stats.mean(9)) ...
    nanmean(statsLewes.stats.mean(9)) nanmean(statsAtlanticCity.stats.mean(9)) nanmean(statsSandy.stats.mean(9))];

tp_ET = [nanmean(statsFernandina.stats.mean(10)) nanmean(statsSavannah.stats.mean(10)) nanmean(statsCharleston.stats.mean(10)) ...
    nanmean(statsMyrtle.stats.mean(10)) nanmean(statsBeaufort.stats.mean(10)) nanmean(statsDuck.stats.mean(10)) nanmean(statsVirginia.stats.mean(10)) ...
    nanmean(statsLewes.stats.mean(10)) nanmean(statsAtlanticCity.stats.mean(10)) nanmean(statsSandy.stats.mean(10))];


% min
twlmin_ET = [nanmin(statsFernandina.stats.min(1)) nanmin(statsSavannah.stats.min(1)) nanmin(statsCharleston.stats.min(1)) ...
    nanmin(statsMyrtle.stats.min(1)) nanmin(statsBeaufort.stats.min(1)) nanmin(statsDuck.stats.min(1)) nanmin(statsVirginia.stats.min(1)) ...
    nanmin(statsLewes.stats.min(1)) nanmin(statsAtlanticCity.stats.min(1)) nanmin(statsSandy.stats.min(1))];

swlmin_ET = [nanmin(statsFernandina.stats.min(2)) nanmin(statsSavannah.stats.min(2)) nanmin(statsCharleston.stats.min(2)) ...
    nanmin(statsMyrtle.stats.min(2)) nanmin(statsBeaufort.stats.min(2)) nanmin(statsDuck.stats.min(2)) nanmin(statsVirginia.stats.min(2)) ...
    nanmin(statsLewes.stats.min(2)) nanmin(statsAtlanticCity.stats.min(2)) nanmin(statsSandy.stats.min(2))];

r2min_ET = [nanmin(statsFernandina.stats.min(8)) nanmin(statsSavannah.stats.min(8)) nanmin(statsCharleston.stats.min(8)) ...
    nanmin(statsMyrtle.stats.min(8)) nanmin(statsBeaufort.stats.min(8)) nanmin(statsDuck.stats.min(8)) nanmin(statsVirginia.stats.min(8)) ...
    nanmin(statsLewes.stats.min(8)) nanmin(statsAtlanticCity.stats.min(8)) nanmin(statsSandy.stats.min(8))];

hsmin_ET = [nanmin(statsFernandina.stats.min(9)) nanmin(statsSavannah.stats.min(9)) nanmin(statsCharleston.stats.min(9)) ...
    nanmin(statsMyrtle.stats.min(9)) nanmin(statsBeaufort.stats.min(9)) nanmin(statsDuck.stats.min(9)) nanmin(statsVirginia.stats.min(9)) ...
    nanmin(statsLewes.stats.min(9)) nanmin(statsAtlanticCity.stats.min(9)) nanmin(statsSandy.stats.min(9))];

tpmin_ET = [nanmin(statsFernandina.stats.min(10)) nanmin(statsSavannah.stats.min(10)) nanmin(statsCharleston.stats.min(10)) ...
    nanmin(statsMyrtle.stats.min(10)) nanmin(statsBeaufort.stats.min(10)) nanmin(statsDuck.stats.min(10)) nanmin(statsVirginia.stats.min(10)) ...
    nanmin(statsLewes.stats.min(10)) nanmin(statsAtlanticCity.stats.min(10)) nanmin(statsSandy.stats.min(10))];


% max
twlmax_ET = [nanmax(statsFernandina.stats.max(1)) nanmax(statsSavannah.stats.max(1)) nanmax(statsCharleston.stats.max(1)) ...
    nanmax(statsMyrtle.stats.max(1)) nanmax(statsBeaufort.stats.max(1)) nanmax(statsDuck.stats.max(1)) nanmax(statsVirginia.stats.max(1)) ...
    nanmax(statsLewes.stats.max(1)) nanmax(statsAtlanticCity.stats.max(1)) nanmax(statsSandy.stats.max(1))];

swlmax_ET = [nanmax(statsFernandina.stats.max(2)) nanmax(statsSavannah.stats.max(2)) nanmax(statsCharleston.stats.max(2)) ...
    nanmax(statsMyrtle.stats.max(2)) nanmax(statsBeaufort.stats.max(2)) nanmax(statsDuck.stats.max(2)) nanmax(statsVirginia.stats.max(2)) ...
    nanmax(statsLewes.stats.max(2)) nanmax(statsAtlanticCity.stats.max(2)) nanmax(statsSandy.stats.max(2))];

r2max_ET = [nanmax(statsFernandina.stats.max(8)) nanmax(statsSavannah.stats.max(8)) nanmax(statsCharleston.stats.max(8)) ...
    nanmax(statsMyrtle.stats.max(8)) nanmax(statsBeaufort.stats.max(8)) nanmax(statsDuck.stats.max(8)) nanmax(statsVirginia.stats.max(8)) ...
    nanmax(statsLewes.stats.max(8)) nanmax(statsAtlanticCity.stats.max(8)) nanmax(statsSandy.stats.max(8))];

hsmax_ET = [nanmax(statsFernandina.stats.max(9)) nanmax(statsSavannah.stats.max(9)) nanmax(statsCharleston.stats.max(9)) ...
    nanmax(statsMyrtle.stats.max(9)) nanmax(statsBeaufort.stats.max(9)) nanmax(statsDuck.stats.max(9)) nanmax(statsVirginia.stats.max(9)) ...
    nanmax(statsLewes.stats.max(9)) nanmax(statsAtlanticCity.stats.max(9)) nanmax(statsSandy.stats.max(9))];

tpmax_ET = [nanmax(statsFernandina.stats.max(10)) nanmax(statsSavannah.stats.max(10)) nanmax(statsCharleston.stats.max(10)) ...
    nanmax(statsMyrtle.stats.max(10)) nanmax(statsBeaufort.stats.max(10)) nanmax(statsDuck.stats.max(10)) nanmax(statsVirginia.stats.max(10)) ...
    nanmax(statsLewes.stats.max(10)) nanmax(statsAtlanticCity.stats.max(10)) nanmax(statsSandy.stats.max(10))];

%% 3.0 Output variables for seasonalMagnitude plot
allTWL_TC = [twlmin_TC; twl_TC; twlmax_TC];
allSWL_TC = [swlmin_TC; swl_TC; swlmax_TC];
allR2_TC = [r2min_TC; r2_TC; r2max_TC];
allHS_TC = [hsmin_TC; hs_TC; hsmax_TC];
allTP_TC = [tpmin_TC; tp_TC; tpmax_TC];
allTWL_ET = [twlmin_ET; twl_ET; twlmax_ET];
allSWL_ET = [swlmin_ET; swl_ET; swlmax_ET];
allR2_ET = [r2min_ET; r2_ET; r2max_ET];
allHS_ET = [hsmin_ET; hs_ET; hsmax_ET];
allTP_ET = [tpmin_ET; tp_ET; tpmax_ET];

end
