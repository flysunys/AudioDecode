% ������������

clear all;
clc;
close all;
% s = [2,1,2,2,1,4,3];
s = ['cadacdb'];
XSet=['a','b','c','d']; %��Դ���ż�
Prob = [0.1 0.4 0.2 0.3]; %����Դ���ŵĸ���
% Prob = GetProb(s,XSet); %�������Դ���ŵĸ���

nSLen = length(XSet);
CDF = zeros(1,nSLen+1); %��������Ķ˵�ֵ
for i=1:nSLen %����2)
    CDF(i+1) = CDF(i)+Prob(i);
end
s
Prob
CDF

format long; %���þ���
[code, Range] = data2ArithCode(s,XSet,Prob); %��������
code
Range

%������������������ļ��У��Ա�����ʹ��
N = length(s);
save('ArcodeTest.mat','code','XSet','Prob','N');

clear; %����ڴ�
load ArcodeTest.mat;
[s2,Range2] = ArithCode2data(code,XSet,Prob,N);
s2
Range2