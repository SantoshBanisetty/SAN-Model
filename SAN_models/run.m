selectCols = [1 3 4 6 7 8 9];
numFeatures = length(selectCols);
clusters = 2;
loadAppData;
loadInappData;
scatterplots;
[appobject, inappobject] = dualplot_GMM(appData(:, selectCols), inappData(:, selectCols), clusters);
probabilities (appobject, inappobject, clusters, numFeatures, selectCols);
debug(appobject, inappobject, clusters);
