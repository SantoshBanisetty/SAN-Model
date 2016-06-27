function [ ] = gmm_pdf_and_accuracy( appobject, inappobject, selCols, threshold )
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
y = [sumaapdf sumaipdf sumiapdf sumiipdf; 0 0 0 0] % used dummy data [0 0 0 0] to get the color.
bar(y)
title('probability density functions')
xlabel ('Number')
ylabel('Probability')
legend('app data in app model', 'app data in inapp model', 'inapp data in app model', 'inapp data in inappmodel')

%Accuracy calculations, used number of non zeros to calculate accuracy. 
%if less then threshold, inapp and greater than threshold, app 
applen = length (appDataset)
inapplen = length (inappDataset)

temp_app_app = pdf(appobject, appDataset);
temp_app_app(temp_app_app < threshold) = 0;
temp_app_app(temp_app_app >= threshold) = 1;
aapositive = nnz(temp_app_app)

temp_inapp_app = pdf(appobject, inappDataset);
temp_inapp_app(temp_inapp_app < threshold) = 0;
temp_inapp_app(temp_inapp_app >= threshold) = 1;
iapositive = inapplen - nnz(temp_inapp_app)

aa_accuracy = (aapositive / applen)*100
ia_accuracy = (iapositive / inapplen)*100

accuracy = mean([aa_accuracy, ia_accuracy])
disp('overall accuracy of the model is: ');
disp(accuracy);


