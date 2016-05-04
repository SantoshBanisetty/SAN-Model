function [] = debug( appobject, inappobject, numberOfClusters )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
disp('-----------------------------------------------------')
disp('App model debug info')
for k = 1:numberOfClusters
    disp('K Value');disp(k)
    u = appobject.mu(k, :);
    sigma = appobject.Sigma(:,:,k);
    d = det(inv(sigma));
    disp('App model means')
    disp(u)
    disp('App model Sigma')
    disp(sigma)
    disp('App model Determinant')
    disp(d)
end

disp('-----------------------------------------------------')
disp('Inapp model debug info')
for k = 1:numberOfClusters
    disp('K Value');disp(k)
    u = inappobject.mu(k, :);
    sigma = inappobject.Sigma(:,:,k);
    d = det(inv(sigma));
    disp('Inapp model means')
    disp(u)
    disp('Inapp model Sigma')
    disp(sigma)
    disp('Inapp model Determinant')
    disp(d)
end

end

