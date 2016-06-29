%labels for plots
labels = {'time','from hallway left p1','from hallway right p1','distance b/n pr2 and human p1','from hallway left p2', ...
    'from hallway right p2','distance b/n pr2 and human p2','inter person distance','p1hl - p2hl'};

selectCols = [1 8 9]; %to select required features 
numFeatures = length(selectCols);
clusters = 3;
loadAppData; %loads app data
loadInappData; %loads inapp data
scatterplots; %function to plot the data for visualization 
[appobj, inappobj] = new_GMM(appData(:, selectCols), ...
    inappData(:, selectCols), clusters, selectCols, labels); % fits GMM
%new_probabilities (appobj, inappobj, clusters, numFeatures, selectCols);
threshold = classification_threshold (appobj, inappobj, selectCols); % Threshold calculation
gmm_pdf_and_accuracy(appobj, inappobj, selectCols, threshold); %classification and classification accuracy
quick_prediction(appobj, inappobj, selectCols, threshold); % to predict behavior in t < 1 (normalized time)