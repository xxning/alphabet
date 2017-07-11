function [segment] =  autoSegment(data)

l=length(data);
sample=200000;
tw=0.5;
ws=tw*sample;
sum1=mean(data(1:ws));
sum2=0;
seg=[];
for i=1e6:0.1*sample:l-2*ws
    sum=0;
    for j=i:i+ws
        sum=sum+data(i);
    end
    sum2=sum/ws;
    diff1=abs(sum2-sum1)/sum1;
    sum1=sum2;
    if diff1>0.02        
        seg=[seg;i];
    end
end

Max=max(data);
figure;
subplot(211);
plot(data);
hold on;
for i=1:length(seg)
    plot([seg(i) seg(i)],[0 Max]);
end

diff2=diff(seg);
seg1=[];
Max1=max(diff2);
threhold=0.5;
for i=2:length(diff2)-1
    if diff2(i)>threhold*Max1 && diff2(i)>diff2(i+1)
        seg1=[seg1;i];
    end
end

seg2=[];
for i=1:length(seg1)
    seg2=[seg2;seg(seg1(i))+0.4e5;seg(seg1(i)+1)-1e5];
end

seg2=[seg(1)-0.6e5;seg2;seg(end)];
subplot(212);
plot(data);
hold on;
for i=1:length(seg2)
    plot([seg2(i) seg2(i)],[0 Max]);
end

segment={};

if length(seg2)==20
    for i=1:10
        segment{i}=data(seg2(2*i-1):seg2(2*i));
    end
end

end