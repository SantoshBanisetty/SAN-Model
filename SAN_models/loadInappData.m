% import data

% fo
%for each file in good.files
inappfileID = fopen('inapp.files');
i = 0;
inappC = [];
inappline = fgetl(inappfileID);
while 1
	i = i+1;
	inappline = fgetl(inappfileID);
	if ~ischar(inappline), break, end
	if size(inappline) ~= [0 0] 
		%import data and add to list
		inappfid = fopen(inappline);
		inappcells = textscan(inappfid,'%f%f%f%f%f%f%f%f','Delimiter',',');
        inappnC = cell2mat(inappcells(:,1:8));
        [numlines q] = size(inappnC);
        inappfilenum = [repmat(i,numlines,1)];
        inappnC = [inappfilenum inappnC];
        inappC = [inappC ; inappnC];
    end
end
fclose(inappfileID);

[n1 q] = size(inappC);

ids = {'filename','time','from hallway left p1','from hallway right p1','distance b/n pr2 and human p1','from hallway left p2','from hallway right p2','distance b/n pr2 and human p2' 'inter person distance' 'p1hl - p2hl'};
usedcols = [2 3 4 5 6 7 8 9];
newcols = [2 3 4 5 6 7 8 9];
numinappfiles = max(unique(inappC(:,1)));
inappnormtimes = [];
inappnormdists = [];
inappnormintdists = [];
inappnormintdists5 = [];
inappnormintdists6 = [];inappnormintdists7 = [];inappnormintdists8 = [];inappnormintdists9 = [];
for i=1:numinappfiles
    maxtime = max(inappC(inappC(:,1)==i,2));
    inappnormtimes_t = inappC(inappC(:,1)==i,2) ./ maxtime;
    inappnormtimes = [inappnormtimes ; inappnormtimes_t];
    
    maxdist = max(inappC(inappC(:,1)==i,3));
    inappnormdists_t = [inappC(inappC(:,1)==i,3)]; % removed normalization
    %normdists_t = [C(C(:,1)==i,12) ./ maxdist C(C(:,1)==i,12) ./ maxdist];
    inappnormdists = [inappnormdists; inappnormdists_t];
    
    maxintdist = max(inappC(inappC(:,1)==i,4));
    inappnormintdists_t = [inappC(inappC(:,1)==i,4)];
    %normintdists_t = [C(C(:,1)==i,13) ./ maxintdist];
    inappnormintdists = [inappnormintdists; inappnormintdists_t]; 
    
    maxintdist5 = max(inappC(inappC(:,1)==i,5));
    inappnormintdists_t5 = [inappC(inappC(:,1)==i,5)];
    %normintdists_t5 = [C(C(:,1)==i,13) ./ maxintdist5];
    inappnormintdists5 = [inappnormintdists5; inappnormintdists_t5];
    
    maxintdist6 = max(inappC(inappC(:,1)==i,6));
    inappnormintdists_t6 = [inappC(inappC(:,1)==i,6)];
    %normintdists_t5 = [C(C(:,1)==i,13) ./ maxintdist5];
    inappnormintdists6 = [inappnormintdists6; inappnormintdists_t6];
    
    maxintdist7 = max(inappC(inappC(:,1)==i,7));
    inappnormintdists_t7 = [inappC(inappC(:,1)==i,7)];
    %normintdists_t5 = [C(C(:,1)==i,13) ./ maxintdist5];
    inappnormintdists7 = [inappnormintdists7; inappnormintdists_t7];
    
    maxintdist8 = max(inappC(inappC(:,1)==i,8));
    inappnormintdists_t8 = [inappC(inappC(:,1)==i,8)];
    %normintdists_t5 = [C(C(:,1)==i,13) ./ maxintdist5];
    inappnormintdists8 = [inappnormintdists8; inappnormintdists_t8];
    
    maxintdist9 = max(inappC(inappC(:,1)==i,9));
    inappnormintdists_t9 = [inappC(inappC(:,1)==i,9)];
    %normintdists_t5 = [C(C(:,1)==i,13) ./ maxintdist5];
    inappnormintdists9 = [inappnormintdists9; inappnormintdists_t9];
    
    
end

inappData = [inappnormtimes inappnormdists inappnormintdists inappnormintdists5 inappnormintdists6 inappnormintdists7 inappnormintdists8 inappnormintdists9 inappnormdists-inappnormintdists6];
%inappData = [inappnormtimes inappnormintdists inappnormintdists5 inappnormintdists7 inappnormintdists8 inappnormintdists9 inappnormdists-inappnormintdists6];


%newData(:, 9) = newData(:, 2) - newData(:, 5);
%figure;
