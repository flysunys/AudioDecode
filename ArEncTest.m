% 测试算术编码

clear all;
clc;
close all;
% s = [2,1,2,2,1,4,3];
s = ['cadacdb'];
XSet=['a','b','c','d']; %信源符号集
Prob = [0.1 0.4 0.2 0.3]; %各信源符号的概率
% Prob = GetProb(s,XSet); %计算各信源符号的概率

nSLen = length(XSet);
CDF = zeros(1,nSLen+1); %保存区间的端点值
for i=1:nSLen %步骤2)
    CDF(i+1) = CDF(i)+Prob(i);
end
s
Prob
CDF

format long; %设置精度
[code, Range] = data2ArithCode(s,XSet,Prob); %算术编码
code
Range

%保存编码结果及参数到文件中，以备解码使用
N = length(s);
save('ArcodeTest.mat','code','XSet','Prob','N');

clear; %清空内存
load ArcodeTest.mat;
[s2,Range2] = ArithCode2data(code,XSet,Prob,N);
s2
Range2