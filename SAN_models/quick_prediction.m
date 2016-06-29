function [ ] = quick_prediction( appobject, inappobject, selCols, threshold )
%quick_prediction: to predict as soon as possible. 
%   Detailed explanation goes here
appDataset = csvread('appdata/Dataset10.txt');
appDataset(:, 9) = appDataset(:, 2)-appDataset(:, 5);
%normalize time
appDataset(:, 1) = appDataset(:, 1)/max(appDataset(:, 1));
appDataset = appDataset(:, selCols);

inappDataset = csvread('inappdata/Dataset9.txt');
inappDataset(:, 9) = inappDataset(:, 2)-inappDataset(:, 5);
%normalize time
inappDataset(:, 1) = inappDataset(:, 1)/max(inappDataset(:, 1));
inappDataset = inappDataset(:, selCols);

%implementation
confidence_threshold = 70;
reward = 1;
penality = 5;
index = 0;

applen = length(appDataset)
inapplen = length(inappDataset)

for count = 1:applen
    aapdf = pdf(appobject, appDataset(count, :));
    
    if aapdf < threshold
        confidence_threshold = confidence_threshold + penality;
    else
        confidence_threshold = confidence_threshold - reward;
    end
    if confidence_threshold <= 0
        index = count;
        break;
    end
end

index
appDataset(index, :)

end

