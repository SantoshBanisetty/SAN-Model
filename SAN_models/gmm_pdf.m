function [ ] = gmm_pdf( appobject, inappobject, selCols )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
appDataset = csvread('appdata/Dataset10.txt');
appDataset(:, 9) = appDataset(:, 2)-appDataset(:, 5);
%normalize time
appDataset(:, 1) = appDataset(:, 1)/max(appDataset(:, 1));
appDataset = appDataset(:, selCols);
aapdf = pdf(appobject, appDataset);
sum(aapdf)

inappDataset = csvread('inappdata/Dataset9.txt');
inappDataset(:, 9) = inappDataset(:, 2)-inappDataset(:, 5);
%normalize time
inappDataset(:, 1) = inappDataset(:, 1)/max(inappDataset(:, 1));
inappDataset = inappDataset(:, selCols);
iapdf = pdf(appobject, inappDataset);
sum(iapdf)
end

