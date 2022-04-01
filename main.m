clear all
load('digits.mat')
data=[Y,X];
%参数初始化
test_num=2000;%测试分类的样本数量
K=50;        %近邻数量
distance_mode=3;
%数据可视化
for i=1:1:32   
    p = reshape(data(i,2:end), [28, 28]);
    subplot(4,8,i);
    imshow(p')
end

count = zeros(1,10);%初始化各类样本判断正确的次数
sum_sample = zeros(1,10);%初始化各类样本判断的次数
[n m] = size(data); % n是数据个数   m是样本维度+1（label+feature）

for i=1:test_num
    sum_sample(data(i,1)+1) = sum_sample(data(i,1)+1)+1;%第label+1类样本判断次数加1
    if Kneighbor(data, data(i,:), K,distance_mode) == data(i,1)
        count(data(i,1)+1) = count(data(i,1)+1)+1;%第label+1类样本判断正确次数加1
    end    
end

["Accuracy Rata：", num2str(sum(count)/test_num)]
%绘制柱状图
figure;
x = 1:1:10;
y = count./sum_sample;
bar(x,y)
axis([0 11 0 1.2])
title('Correctness for Each Sample')



