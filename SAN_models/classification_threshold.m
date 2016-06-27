function [ threshold ] = classification_threshold( appobject, inappobject, selcols )
%classification threshold function calculates the threshold to classify 
%navigation behavior

%app->app probability
fid = fopen('app.files');
count = 0;
finalData = zeros(size(selcols)); %vercat at the bottom needs an initial row to concatinate 
%This will be taken care by deleting the first row later in the code.
tline = fgetl(fid);
while ischar(tline)
    if count >= 1
        disp(tline)
        Dataset = load(tline);
        Dataset(:, 9) = Dataset(:, 2)-Dataset(:, 5);
        %normalize time
        Dataset(:, 1) = Dataset(:, 1)/max(Dataset(:, 1));
        Dataset = Dataset(:, selcols);
        finalData = vertcat(finalData, Dataset);
        count = count + 1;
    elseif count == 0
        count = count + 1;
    end
        
    tline = fgetl(fid);
end
finalData = finalData (2:end, :); % correction by deleting the first row

pdfTh = pdf(appobject, finalData);
threshold = mean(pdfTh)/2;


end

