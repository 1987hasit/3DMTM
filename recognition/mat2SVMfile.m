function mat2SVMfile(Gestures, fileName)
%TRAIN Summary of this function goes here
%   Detailed explanation goes here

%% Format training data
% number of training data
n = length(Gestures);

% label of training data
%tr_label = zeros(n, 1);

file_path = 'D:\\Research\\Codes\\SVM_files\\';

fid = fopen([file_path fileName], 'w');

XOY_MHI = 1:81;
XOY_SHI = 82:162;
XOY_AMI = 163:243;
XOY_ASI = 244:324;

XOZ_MHI = 325:405;
YOZ_MHI = 406:486;

% data of training data
num_features = 81 * 6;

tr_data = zeros(n, num_features);

for i = 1:n
    selected_features = [Gestures(i).Features(XOY_MHI) Gestures(i).Features(XOY_SHI) Gestures(i).Features(XOY_AMI) ...
                         Gestures(i).Features(XOY_ASI) Gestures(i).Features(XOZ_MHI) Gestures(i).Features(YOZ_MHI)];
    
    tr_data(i,:) = selected_features;
    fprintf(fid, '%d ', Gestures(i).Id); 

    for j = 1:num_features
        fprintf(fid, '%d:', j);
        fprintf(fid, '%f ', tr_data(i,j));
    end
    fprintf(fid, '\n'); 
    fprintf([int2str(i), '...\n']);
end
fclose(fid);
end

