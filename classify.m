function [label_vector, data_matrix] = classify(data, label)
% data = {dqA, dqB, dqC, dqD, dqE};
% label = [1,2,3,4,5];

data_matrix = [];
label_vector = [];
for ll=1:length(data)
   current_samples = data{ll};
   current_label = label(ll);
   for mm = 1:length(current_samples)
       current_sample = current_samples{mm};
       if length(current_sample) < 100
          disp(['there is one sample which length is very short! Its num=data{', num2str(ll), '}{',num2str(mm),'}']);
          continue
       end
       feature = get_statistical_feature(current_sample);
       data_matrix = [data_matrix;feature'];
       label_vector = [label_vector; current_label];
       
   end
end
end
