
% data = { xnA, xnB, xnC, xnD, xnE};
% label = [1,2,3,4,5];
features=[];
path='E:\Lab_data\ANS0708\';
name='rd';
%letter=['A','B','C','D','E'];
letter=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
for i=1:1:length(letter)
    file=[path,name,letter(i),'10','.mat'];
    file
    load(file,'ans');
    %load('E:\Lab_data\ANS0708\dqA10.mat', 'ans')
    data={ans};
    label=[i];
    [label_vector, data_matrix] = classify(data, label);
    ttemp = [label_vector, data_matrix];
    features=[features;ttemp];
end

%     data = {dqA, dqB, dqC, dqD, dqE, xnA, xnB, xnC, xnD, xnE,zyzA,zyzB,zyzC,zyzD,zyzE};
%     label=[i]
%     [label_vector, data_matrix] = classify(data, label);
% 
%     ttemp = [label_vector, data_matrix];