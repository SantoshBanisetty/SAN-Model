% import data

% for each file in good.files
fileID = fopen('moves.files');
i = 0;
C = [];
tline = fgetl(fileID);
while 1
	i = i+1;
	tline = fgetl(fileID);
	if ~ischar(tline), break, end
	if size(tline) ~= [0 0] 
		%import data and add to list
		fid = fopen(tline);
		cells = textscan(fid,'%f%f%f%f%f%f%f%f','Delimiter',',');
        nC = cell2mat(cells(:,1:8));
        [numlines q] = size(nC);
        filenum = [repmat(i,numlines,1)];
        nC = [filenum nC];
        C = [C ; nC];
    end
end
fclose(fileID);

[n1 q] = size(C);

ids = {'filename','time','from hallway left p1','from hallway right p1','distance b/n pr2 and human p1','from hallway left p2','from hallway right p2','distance b/n pr2 and human p2' 'inter person distance' 'p1hl - p2hl'};
usedcols = [2 3 4 5 6 7 8 9];
newcols = [2 3 4 5 6 7 8 9];
numfiles = max(unique(C(:,1)));
normtimes = [];
normdists = [];
normintdists = [];
normintdists5 = [];
normintdists6 = [];normintdists7 = [];normintdists8 = [];normintdists9 = [];
for i=1:numfiles
    maxtime = max(C(C(:,1)==i,2));
    normtimes_t = C(C(:,1)==i,2) ./ maxtime;
    normtimes = [normtimes ; normtimes_t];
    
    maxdist = max(C(C(:,1)==i,3));
    normdists_t = [C(C(:,1)==i,3)]; % removed normalization
    %normdists_t = [C(C(:,1)==i,12) ./ maxdist C(C(:,1)==i,12) ./ maxdist];
    normdists = [normdists; normdists_t];
    
    maxintdist = max(C(C(:,1)==i,4));
    normintdists_t = [C(C(:,1)==i,4)];
    %normintdists_t = [C(C(:,1)==i,13) ./ maxintdist];
    normintdists = [normintdists; normintdists_t]; 
    
    maxintdist5 = max(C(C(:,1)==i,5));
    normintdists_t5 = [C(C(:,1)==i,5)];
    %normintdists_t5 = [C(C(:,1)==i,13) ./ maxintdist5];
    normintdists5 = [normintdists5; normintdists_t5];
    
    maxintdist6 = max(C(C(:,1)==i,6));
    normintdists_t6 = [C(C(:,1)==i,6)];
    %normintdists_t5 = [C(C(:,1)==i,13) ./ maxintdist5];
    normintdists6 = [normintdists6; normintdists_t6];
    
    maxintdist7 = max(C(C(:,1)==i,7));
    normintdists_t7 = [C(C(:,1)==i,7)];
    %normintdists_t5 = [C(C(:,1)==i,13) ./ maxintdist5];
    normintdists7 = [normintdists7; normintdists_t7];
    
    maxintdist8 = max(C(C(:,1)==i,8));
    normintdists_t8 = [C(C(:,1)==i,8)];
    %normintdists_t5 = [C(C(:,1)==i,13) ./ maxintdist5];
    normintdists8 = [normintdists8; normintdists_t8];
    
    maxintdist9 = max(C(C(:,1)==i,9));
    normintdists_t9 = [C(C(:,1)==i,9)];
    %normintdists_t5 = [C(C(:,1)==i,13) ./ maxintdist5];
    normintdists9 = [normintdists9; normintdists_t9];
    
    
end

newData = [normtimes normdists normintdists normintdists5 normintdists6 normintdists7 normintdists8 normintdists9];
%newData(:, 9) = newData(:, 2) - newData(:, 5);
%figure;
subplot(3,3,1);
scatter(newData(:,1), newData(:,2))
xlabel('Normalized Time'); ylabel('Per1 and hallway left (cm)');
%figure;
subplot(3,3,2);
scatter(newData(:,1), newData(:,3))
xlabel('Normalized Time'); ylabel('Per1 and hallway right (cm)');
%figure;
subplot(3,3,3);
scatter(newData(:,1), newData(:,4))
xlabel('Normalized Time'); ylabel('Per1 and the robot (cm)');

%figure;
subplot(3,3,7);
scatter(newData(:,1), newData(:,5))
xlabel('Normalized Time'); ylabel('Per2 and hallway left (cm)');
%figure;
subplot(3,3,8);
scatter(newData(:,1), newData(:,6))
xlabel('Normalized Time'); ylabel('Per2 and hallway right (cm)');
%figure;
subplot(3,3,9);
scatter(newData(:,1), newData(:,7))
xlabel('Normalized Time'); ylabel('Per2 and the robot (cm)');

%figure;
subplot(3,3,4);
scatter(newData(:,1), newData(:,8))
xlabel('Normalized Time'); ylabel('Per1-Per2 (cm)');

%figure;
%subplot(3,3,6);
%scatter(newData(:,1), newData(:,9))
%xlabel('Normalized Time'); ylabel('Per1 and hallway left - Per2 and hallway left(cm)');


