function [ ] = gmm_pdf( appobject, inappobject, selCols )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
appDataset = csvread('appdata/Dataset10.txt');
appDataset(:, 9) = appDataset(:, 2)-appDataset(:, 5);
%normalize time
appDataset(:, 1) = appDataset(:, 1)/max(appDataset(:, 1));
appDataset = appDataset(:, selCols);
%app data pdf in app model
aapdf = pdf(appobject, appDataset);
disp('-----------------------------------------------------')
disp('App data pdf in app model (sum)')
sumaapdf = sum(aapdf)
%app data pdf in inapp model
aipdf = pdf(inappobject, appDataset);
disp('-----------------------------------------------------')
disp('App data pdf in inapp model (sum)')
sumaipdf = sum(aipdf)
inappDataset = csvread('inappdata/Dataset9.txt');
inappDataset(:, 9) = inappDataset(:, 2)-inappDataset(:, 5);
%normalize time
inappDataset(:, 1) = inappDataset(:, 1)/max(inappDataset(:, 1));
inappDataset = inappDataset(:, selCols);
%inapp data pdf in app model
iapdf = pdf(appobject, inappDataset);
disp('-----------------------------------------------------')
disp('Inapp data pdf in app model (sum)')
sumiapdf = sum(iapdf)
%inapp data pdf in inapp model
iipdf = pdf(inappobject, inappDataset);
disp('-----------------------------------------------------')
disp('Inapp data pdf in Inapp model (sum)')
sumiipdf = sum(iipdf)
x = [1,2,3,4]
y = [sumaapdf sumaipdf sumiapdf sumiipdf; 0 0 0 0]
bar(y)
title('probability density functions')
xlabel ('Number')
ylabel('Probability')
legend('aa', 'ai', 'ia', 'ii')
end

