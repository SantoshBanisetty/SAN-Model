function [] = debug( appobject, inappobject, numberOfClusters )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
disp('-----------------------------------------------------')
disp('App model debug info')
for k = 1:numberOfClusters
    disp('K Value');disp(k)
    u = appobject.mu(k, :);
    sigma = appobject.Sigma(:,:,k);
    %[U,S,V] = svd(sigma);
    d = sqrt(det(sigma));
    disp('App model means')
    disp(u)
    disp('App model Sigma')
    disp(sigma)
    disp('App model Denominator')
    disp(d)
end

disp('-----------------------------------------------------')
disp('Inapp model debug info')
for k = 1:numberOfClusters
    disp('K Value');disp(k)
    u = inappobject.mu(k, :);
    sigma = inappobject.Sigma(:,:,k);
    %[U,S,V] = svd(sigma);
    d = sqrt(det(sigma));
    disp('Inapp model means')
    disp(u)
    disp('Inapp model Sigma')
    disp(sigma)
    disp('Inapp model Denominator')
    disp(d)
end

end

