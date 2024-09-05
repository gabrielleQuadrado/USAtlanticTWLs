This folder contains 6 matfiles, two for each station (i.e., Fernandina Beach, FL, Kiptopeke, VA, and Sandy
Hook, NJ), with data used to create Figure 9. 

'_blockMaxima_plotvar.mat' 
Files contain double arrays corresponding to the following variables:
- CI_lower: Lower confidence intervals for the annual maxima GEV fit.
- CI_upper: Upper confidence intervals for the annual maxima GEV fit.
- combinedRP: Combined return periods associated with seasonal maxima, calculated by taking the inverse of the sum of the extratropical and tropical TWL exceedance probabilities for a given TWL elevation.
- plotRL: Return levels at the intersection of the GEV seasonal maxima fit during the tropical season with the tail of the combined probability curve.
- plotRP: Return periods corresponding to plotRL.
- retgevind: Return levels for the annual maxima GEV fit. 
- retgevind_et: Return levels for the seasonal maxima GEV fit during the extratropical season.
- retgevind_tc: Return levels the seasonal maxima GEV fit during the tropical season.
- RLtc: Return levels for the seasonal maxima GEV fit during the tropical season, used to plot combined probability curves.
- x: Return periods used to calculate and plot confidence intervals for the GEV fit. 
- yp: Exceedance probabilities for the annual maxima GEV fit.
- yp_et: Exceedance probabilities for the extratropical seasonal maxima GEV fit.
- yp_tc: Exceedance probabilities for the tropical seasonal maxima GEV fit.


'_POT_plotvar.mat'
Files contain double arrays corresponding to the following variables:
- combinedRP_POT: Combined return periods associated with POT during the tropical and extratropical seasons, calculated by taking the inverse of the sum of the extratropical and tropical TWL exceedance probabilities for a given TWL elevation.
- lowerCIGPD: Lower confidence intervals for the POT GPD fit.
- n: Return periods for the POT GPD fit. 
- n_et: Return periods for the POT GPD fit during the extratropical season. 
- n_tc: Return periods for the POT GPD fit during the tropical season. 
- plotRL: Return levels at the intersection of the GPD fit during the tropical season with the tail of the combined probability curve.
- plotRP: Return periods corresponding to plotRL.
- RLtc_POT: Return levels for POT TWLs during the tropical season, used to plot combined probability 
curves. 
- upperCIGPD: Upper confidence intervals for the POT GPD fit.
- x2: Return periods used to calculate and plot confidence intervals for the GPD fit. 
- xm: Return levels for the POT GPD fit. 
- xm_et: Return levels for the POT GPD fit during the extratropical season. 
- xm_tc: Return levels for the POT GPD fit during the tropical season. 


