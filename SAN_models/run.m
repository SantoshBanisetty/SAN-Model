clusters = 2;
loadAppData;
loadInappData;
scatterplots;
[appobject, inappobject] = dualplot_GMM(appData, inappData, clusters);
probabilities (appobject, inappobject, clusters);
debug(appobject, inappobject, clusters);
