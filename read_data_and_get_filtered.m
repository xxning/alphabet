function [ samples,segment ] = read_data_and_get_filtered( I_filename, Q_filename )
%READ_DATA_AND_GET_FILTERED 此处显示有关此函数的摘要
%   此处显示详细说明
fs = 200000;
I = read_data(I_filename);
Q = read_data(Q_filename);
if length(I) ~= length(Q)
    min_len = min(length(I), length(Q));
    I = I(1:min_len);
    Q = Q(1:min_len);
end
z = complex(I,Q);
energy = abs(z);
t = (0:length(I)-1)/fs;

smoothed = smooth(energy, 4000);

temp=smoothed(3*fs:length(I)-3*fs);
[segment] = autoSegment(temp);
segment 

figure;
plot(t(3*fs:length(I)-3*fs), smoothed(3*fs:length(I)-3*fs));


num_point = input('总共有多少个segment？');
if num_point==0
    samples=[];
else
    samples = cell(1,num_point);
    for ll = 1:num_point
    %     start_point = input('起点是');
        [points, ~, ~] = ginput(2);
        start_point = points(1) * fs;
    %     end_point = input('终点是');
        end_point = points(2) * fs;
        samples{ll} = smoothed(start_point:end_point);
    %     close;
    %     figure;
    %     plot(t((end_point + fs * 1):length(I)-3*fs), smoothed((end_point + fs * 1):length(I)-3*fs));
    end
end
close;
end

