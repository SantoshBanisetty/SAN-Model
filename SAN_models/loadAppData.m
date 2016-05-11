% import data

% fo
%for each file in good.files
appfileID = fopen('app.files');
i = 0;
appC = [];
appline = fgetl(appfileID);
while 1
	i = i+1;
	appline = fgetl(appfileID);
	if ~ischar(appline), break, end
	if size(appline) ~= [0 0] 
		%import data and add to list
		appfid = fopen(appline);
		appcells = textscan(appfid,'%f%f%f%f%f%f%f%f','Delimiter',',');
        appnC = cell2mat(appcells(:,1:8));
        [numlines q] = size(appnC);
        appfilenum = [repmat(i,numlines,1)];
        appnC = [appfilenum appnC];
        appC = [appC ; appnC];
    end
end
fclose(appfileID);

[n1 q] = size(appC);

ids = {'filename','time','from hallway left p1','from hallway right p1','distance b/n pr2 and human p1','from hallway left p2','from hallway right p2','distance b/n pr2 and human p2' 'inter person distance' 'p1hl - p2hl'};
usedcols = [2 3 4 5 6 7 8 9];
newcols = [2 3 4 5 6 7 8 9];
numappfiles = max(unique(appC(:,1)));
appnormtimes = [];
appnormdists = [];
appnormintdists = [];
appnormintdists5 = [];
appnormintdists6 = [];appnormintdists7 = [];appnormintdists8 = [];appnormintdists9 = [];
for i=1:numappfiles
    maxtime = max(appC(appC(:,1)==i,2));
    appnormtimes_t = appC(appC(:,1)==i,2) ./ maxtime;
    appnormtimes = [appnormtimes ; appnormtimes_t];
    
    maxdist = max(appC(appC(:,1)==i,3));
    appnormdists_t = [appC(appC(:,1)==i,3)]; % removed normalization
    %normdists_t = [C(C(:,1)==i,12) ./ maxdist C(C(:,1)==i,12) ./ maxdist];
    appnormdists = [appnormdists; appnormdists_t];
    
    maxintdist = max(appC(appC(:,1)==i,4));
    appnormintdists_t = [appC(appC(:,1)==i,4)];
    %normintdists_t = [C(C(:,1)==i,13) ./ maxintdist];
    appnormintdists = [appnormintdists; appnormintdists_t]; 
    
    maxintdist5 = max(appC(appC(:,1)==i,5));
    appnormintdists_t5 = [appC(appC(:,1)==i,5)];
    %normintdists_t5 = [C(C(:,1)==i,13) ./ maxintdist5];
    appnormintdists5 = [appnormintdists5; appnormintdists_t5];
    
    maxintdist6 = max(appC(appC(:,1)==i,6));
    appnormintdists_t6 = [appC(appC(:,1)==i,6)];
    %normintdists_t5 = [C(C(:,1)==i,13) ./ maxintdist5];
    appnormintdists6 = [appnormintdists6; appnormintdists_t6];
    
    maxintdist7 = max(appC(appC(:,1)==i,7));
    appnormintdists_t7 = [appC(appC(:,1)==i,7)];
    %normintdists_t5 = [C(C(:,1)==i,13) ./ maxintdist5];
    appnormintdists7 = [appnormintdists7; appnormintdists_t7];
    
    maxintdist8 = max(appC(appC(:,1)==i,8));
    appnormintdists_t8 = [appC(appC(:,1)==i,8)];
    %normintdists_t5 = [C(C(:,1)==i,13) ./ maxintdist5];
    appnormintdists8 = [appnormintdists8; appnormintdists_t8];
    
    maxintdist9 = max(appC(appC(:,1)==i,9));
    appnormintdists_t9 = [appC(appC(:,1)==i,9)];
    %normintdists_t5 = [C(C(:,1)==i,13) ./ maxintdist5];
    appnormintdists9 = [appnormintdists9; appnormintdists_t9];
    
    
end

appData = [appnormtimes appnormdists appnormintdists appnormintdists5 appnormintdists6 appnormintdists7 appnormintdists8 appnormintdists9 appnormdists-appnormintdists6];
%appData = [appnormtimes appnormintdists appnormintdists5 appnormintdists7 appnormintdists8 appnormintdists9 appnormdists-appnormintdists6];
%newData(:, 9) = newData(:, 2) - newData(:, 5);
%figure;

