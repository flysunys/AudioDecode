%����LZW������㷨

%��ʼ��
clear;clc;close all;
%�����ź�
%s = 'ABABBABCABABBA';
% s = 'AB';
s ='ababcbababaaaaaaa';
%s = 'ababcababac';
%������ʼ�ʵ�
su =unique(s);%ȥ��
dictLen = length(su);
initDict = cell(dictLen,1); %�ò��̶��ṹcell�洢�������Ķ���
for i =1:dictLen
    initDict{i} = su(i);
end

%����
[code,Dict,outNum] = LZWencode(s,initDict,dictLen);
%code = code(1:outNum);
display(code);%�������
display(Dict);%�����ֵ�
display(outNum);%�������

% save('LZWtest.mat','s','code','initDict','dictLen');

%����
% clear; %����ڴ�
% load LZWtest.mat;
[s2,dict2] = LZWdecode(code,initDict,dictLen);
display(s2)%����֮��Ľ��
display(dict2)%����֮����ֵ�
if strcmp(s,s2)==1
    disp('����������ԭ����һ��');
else
    disp('����������ԭ���ݲ�һ��');
end
