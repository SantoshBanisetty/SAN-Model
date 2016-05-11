function [] = probabilities( appobject, inappobject, numberOfClusters, nf, selcols)
%Function to calculate probabilities of a dataset in a model


%app->app probability
fid = fopen('app.files');
count = 0;
aaprob = 0;
tline = fgetl(fid);
while ischar(tline)
    if count >= 1
        disp(tline)
        Dataset = load(tline);
        Dataset(:, 9) = Dataset(:, 2)-Dataset(:, 5);
        %normalize time
        Dataset(:, 1) = Dataset(:, 1)/max(Dataset(:, 1));
        Dataset = Dataset(:, selcols);
        l1 = length(Dataset);
        %mahalDist1 = zeros(l1, 8, 2);
        aaprob1 = zeros(l1, 1);
        for index = 1:l1
            sum = 0;
            for k = 1:numberOfClusters
                %Some thing is wrong with the equations in people-aware
                %navigation. multiplication is not compatible. So I using the
                %mahalanobis equation at http://www.mathworks.com/help/stats/mahal.html
                %not the mahal function but its implementation as shown in
                %description. The resaon may be these are not coloum vectors. 
                w = Dataset(index, :);
                u = appobject.mu(k, :);
                sigma = appobject.Sigma(:,:,k);
                %[U,S,V] = svd(sigma);
                delta = ((w-u)*(inv(sigma))*(w-u)')/2;
                sum = sum + ( exp(-delta) / (power(2*pi,nf/2)*sqrt(det(sigma)) ));
            end
            aaprob1(index) = sum;
        end
        aaprob = vertcat(aaprob, aaprob1);
        count = count + 1;
    elseif count == 0
        count = count + 1;
    end
        
    tline = fgetl(fid);
end

fclose(fid);



%inapp->app
fid = fopen('inapp.files');
count = 0;
iaprob = 0;
tline = fgetl(fid);
while ischar(tline)
    if count >= 1
        disp(tline)
        Dataset = load(tline);
        Dataset(:, 9) = Dataset(:, 2)-Dataset(:, 5);
        %normalize time
        Dataset(:, 1) = Dataset(:, 1)/max(Dataset(:, 1));
        Dataset = Dataset(:, selcols);
        l1 = length(Dataset);
        %mahalDist1 = zeros(l1, 8, 2);
        iaprob1 = zeros(l1, 1);
        for index = 1:l1
            sum = 0;
            for k = 1:numberOfClusters
                %Some thing is wrong with the equations in people-aware
                %navigation. multiplication is not compatible. So I using the
                %mahalanobis equation at http://www.mathworks.com/help/stats/mahal.html
                %not the mahal function but its implementation as shown in
                %description. The resaon may be these are not coloum vectors. 
                w = Dataset(index, :);
                u = appobject.mu(k, :);
                sigma = appobject.Sigma(:,:,k);
                %[U,S,V] = svd(sigma);
                delta = ((w-u)*(inv(sigma))*(w-u)')/2;
                sum = sum + ( exp(-delta) / (power(2*pi,nf/2)*sqrt(det(sigma)) ));
                %delta = sqrt((w-u)*(inv(sigma))*(w-u)')/2;
                %sum = sum + ( exp(-delta/2) / (sqrt(2*pi*8)*det(inv(sigma)) ));
            end
            iaprob1(index) = sum;
        end
        iaprob = vertcat(iaprob, iaprob1);
        count = count + 1;
    elseif count == 0
        count = count + 1;
    end
        
    tline = fgetl(fid);
end

fclose(fid);
    


%app->inapp
fid = fopen('app.files');
count = 0;
aiprob = 0;
tline = fgetl(fid);
while ischar(tline)
    if count >= 1
        disp(tline)
        Dataset = load(tline);
        Dataset(:, 9) = Dataset(:, 2)-Dataset(:, 5);
        %normalize time
        Dataset(:, 1) = Dataset(:, 1)/max(Dataset(:, 1));
        Dataset = Dataset(:, selcols);
        l1 = length(Dataset);
        %mahalDist1 = zeros(l1, 8, 2);
        aiprob1 = zeros(l1, 1);
        for index = 1:l1
            sum = 0;
            for k = 1:numberOfClusters
                %Some thing is wrong with the equations in people-aware
                %navigation. multiplication is not compatible. So I using the
                %mahalanobis equation at http://www.mathworks.com/help/stats/mahal.html
                %not the mahal function but its implementation as shown in
                %description. The resaon may be these are not coloum vectors. 
                w = Dataset(index, :);
                u = inappobject.mu(k, :);
                sigma = inappobject.Sigma(:,:,k);
                %[U,S,V] = svd(sigma);
                delta = ((w-u)*(inv(sigma))*(w-u)')/2;
                sum = sum + ( exp(-delta) / (power(2*pi,nf/2)*sqrt(det(sigma)) ));
                %delta = sqrt((w-u)*(inv(sigma))*(w-u)')/2;
                %sum = sum + ( exp(-delta/2) / (sqrt(2*pi*8)*det(inv(sigma)) ));
            end
            aiprob1(index) = sum;
        end
        aiprob = vertcat(aiprob, aiprob1);
        count = count + 1;
    elseif count == 0
        count = count + 1;
    end
        
    tline = fgetl(fid);
end

fclose(fid);



%inapp->inapp
fid = fopen('inapp.files');
count = 0;
iiprob = 0;
tline = fgetl(fid);
while ischar(tline)
    if count >= 1
        disp(tline)
        Dataset = load(tline);
        Dataset(:, 9) = Dataset(:, 2)-Dataset(:, 5);
        %normalize time
        Dataset(:, 1) = Dataset(:, 1)/max(Dataset(:, 1));
        Dataset = Dataset(:, selcols);
        l1 = length(Dataset);
        %mahalDist1 = zeros(l1, 8, 2);
        iiprob1 = zeros(l1, 1);
        for index = 1:l1
            sum = 0;
            for k = 1:2
                %Some thing is wrong with the equations in people-aware
                %navigation. multiplication is not compatible. So I using the
                %mahalanobis equation at http://www.mathworks.com/help/stats/mahal.html
                %not the mahal function but its implementation as shown in
                %description. The resaon may be these are not coloum vectors. 
                w = Dataset(index, :);
                u = inappobject.mu(k, :);
                sigma = inappobject.Sigma(:,:,k);
                %[U,S,V] = svd(sigma);
                delta = ((w-u)*(inv(sigma))*(w-u)')/2;
                sum = sum + ( exp(-delta) / (power(2*pi,nf/2)*sqrt(det(sigma)) ));
                %delta = sqrt((w-u)*(inv(sigma))*(w-u)')/2;
                %sum = sum + ( exp(-delta/2) / (sqrt(2*pi*8)*det(inv(sigma)) ));
            end
            iiprob1(index) = sum;
        end
        iiprob = vertcat(iiprob, iiprob1);
        count = count + 1;
    elseif count == 0
        count = count + 1;
    end
        
    tline = fgetl(fid);
end

fclose(fid);
%BW = 0.000002
figure;
%hold on
histogram(aaprob);
title('app -> app')
%hold on 
figure;
histogram(iaprob);
title('inapp -> app')
%hold on 
figure;
histogram(aiprob);
title('app -> inapp')
%hold on 
figure;
histogram(iiprob);
title('inapp -> inapp')


end

