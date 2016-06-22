%Orders the data when there is a person 1 and person 2 conflict

data = csvread('appdata/Appropriate/Dataset1.txt');
ordered = zeros(size(data));
ordered(:, 1) = data(:, 1);
ordered(:, [2 3 4]) = data(:, [5 6 7]);
ordered(:, [5 6 7]) = data(:, [2 3 4]);
ordered(:, 8) = data(:, 8);
dlmwrite('Dataset.txt', ordered, 'precision', 8)