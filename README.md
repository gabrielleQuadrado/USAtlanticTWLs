[![DOI](https://zenodo.org/badge/661040372.svg)](https://zenodo.org/doi/10.5281/zenodo.13736404)

# Assessing Total Water Level Drivers - Data Release
Data release to the paper "The Timing, Magnitude, and Relative Composition of Extreme Total Water Levels Vary Seasonally along the U.S. Atlantic Coast".

The data and scripts provided in this repository are used to reproduce the figures on the paper. This data release includes the following components: 

1) [Annual Maxima TWLs by Month](annualMaximabyMonth) - data for Figures 3 and 5. These figures show, respectively, the percentage of annual maxima (AM) TWL events occurring each month and the average magnitude of AM TWLs by month, and the average percent contribution of individual water level components to AM TWLs by month. Magnitude, number of events (used to calculate the percentage of AM TWL events occurring each month), and relative contribution data are located in separate subfolders. The script to reproduce Figures 3 and 5 can be found [here](figureScripts/timingPanelPlot.m).

2) [Peak-Over-Threshold TWLs by Month](POTbyMonth) - data for Figures 4 and 6. These figures show, respectively, the percentage of peak-over-threshold (POT) TWL events occurring each month, and the average magnitude of POT TWLs by month, and the average percent contribution of individual water level components to POT TWLs by month. Magnitude, number of events (used to calculate the percentage of POT TWL events occurring each month), and relative contribution data are located in separate subfolders. The script to reproduce Figures 4 and 6 can be found [here](figureScripts/relativeContributionbyMonth.m).

3) [Seasonal Maxima Events](seasonalMaximaEvents) - data for Figure 7, which presents the average magnitude of
the TWL and its contributors during seasonal maxima events. The folder also contains data for Figures S3 and S4 in the Supporting Information, which present the average relative contribution of individual components to seasonal maxima TWLs based on a uniform beach slope, based on non-uniform or locally averaged beach slopes, and using wave setup instead of wave runup as the TWL wave-induced component. The folder contains two subfolders: [1. magnitude](seasonalMaximaEvents/magnitude), subdivided into two sub-subfolders for the [1a. tropical](seasonalMaximaEvents/magnitude/tropicalSeason) and [1b. extratropical](seasonalMaximaEvents/magnitude/extratropicalSeason) seasons, and [2. relativeContribution](seasonalMaximaEvents/relativeContribution), subdivided into the [2a. uniform runup analysis](seasonalMaximaEvents/relativeContribution/runup_uniformBeta/), [2b. non-uniform runup analysis](seasonalMaximaEvents/relativeContribution/runup_nonuniformBeta/), and [2c. setup analysis](seasonalMaximaEvents/relativeContribution/setup/). The script to reproduce Figure 7 can be found [here](figureScripts/seasonalMagnitude.m). The script to reproduce Figures S3 and S4 can be found [here](figureScripts/regionsPlot_Seasonal.m).

4) [Peak-Over-Threshold Events during Storm Seasons](POTseasonal) - data for Figure S2 in the Supporting Information, which presents the average magnitude of the TWL and its contributors for POT events during the tropical and extratropical seasons. The script to reproduce Figure S2 can be found [here](figureScripts/seasonalMagnitude.m).

5) [Dependence Characterization](kendallsCorrelation) - data for Figure 8, which shows the dependence between extreme TWL events and storm-driven components (i.e., storm surge and waves) during the tropical and extratropical storm seasons, and for Table S4 in the supporting information, which shows the dependence between seasonal maxima storm surge and significant wave height during the tropical and extratropical storm seasons, all measured using Kendall's correlation coefficient. The script to reproduce Figure 8 can be found [here](figureScripts/seasonalDependence.m).

6) [AM, Seasonal Maxima, and POT TWL Return Levels](EVAFits) - data for Figure 9, which displays estimates of return levels based on Generalized Extreme Value (GEV) distribution fits for annual maximum and seasonal maximum events as well as estimates of return levels based on Generalized Pareto Distribution (GPD) fits for POT events and POT events selected during the tropical and extratropical seasons. Files in this folder also contain data for the combined return period estimates based on the seasonal maxima GEV and POT during the tropical and extratropical fits. The script to reproduce Figure 9 can be found [here](figureScripts/EVAPlot.m).

7) [SWL Residuals](SWLresiduals) - data for Figure S1 in the Supporting Information, which displays empirical cumulative distribution functions of the residuals calculated based on the difference between the reconstructed still water level (SWL) time series and the measured SWL from NOAA water level stations. The script to reproduce Figure S1 can be found [here](figureScripts/SWLresidualsECDF.m).

8) [Figure Scripts](figureScripts)  - folder contains all scripts to reproduce Figures 3 to 9 in the paper and Figures S1 to S4 in the Supporting Information. 

If you have any questions or need further clarification, please contact [Gabrielle P. Quadrado](mailto:gpereiraquadrado@ufl.edu?subject=[GitHub]%20Total%20Water%20Level%20Drivers).

# Suggested Citations

Paper

Quadrado, G. P., & Serafin, K. A. (2024).The timing, magnitude, and relativecomposition of extreme total water levelsvary seasonally along the U.S. Atlanticcoast. Journal of Geophysical Research:Oceans, 129, e2023JC020557.  https://doi.org/10.1029/2023JC020557

Data Release

Quadrado, G. P., & Serafin, K.A. (2024). Data release to the "The Timing, Magnitude, and Relative Composition of Extreme Total Water Levels Vary Seasonally along the U.S. Atlantic Coast" (v1.0.0). Zenodo. https://doi.org/10.5281/zenodo.13736405
