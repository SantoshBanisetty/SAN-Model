labels = {'time','from hallway left p1','from hallway right p1','distance b/n pr2 and human p1','from hallway left p2', ...
    'from hallway right p2','distance b/n pr2 and human p2','inter person distance','p1hl - p2hl'};
selectCols = [1 8 9]; %9 
numFeatures = length(selectCols);
clusters = 3;
loadAppData;
loadInappData;
scatterplots;
[appobj, inappobj] = new_GMM(appData(:, selectCols), inappData(:, selectCols), clusters, selectCols, labels);
new_probabilities (appobj, inappobj, clusters, numFeatures, selectCols);