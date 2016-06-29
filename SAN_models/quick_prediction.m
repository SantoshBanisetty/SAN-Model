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

end

