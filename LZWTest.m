%����LZW������㷨

%��ʼ��
clear;
close all;
clc;
%�����ź�
s = ['ABABBABCABABBA'];
% s = ['AB'];
%������ʼ�ʵ�
dictLen = 3;
initDict = cell(dictLen,1); %�ò��̶��ṹcell�洢�������Ķ���
initDict{1} = 'A';
initDict{2} = 'B';
initDict{3} = 'C';

%����
[code,initDict,outNum] = LZWencode(s,initDict,dictLen);
code = code(1:outNum);
code
initDict
outNum

% save('LZWtest.mat','s','code','initDict','dictLen');

%����
% clear; %����ڴ�
% load LZWtest.mat;
[s2,dict2] = LZWdecode(code,initDict,dictLen);
s2
dict2
if strcmp(s,s2)==1
    disp('����������ԭ����һ��');
else
    disp('����������ԭ���ݲ�һ��');
end
