%测试LZW编解码算法

%初始化
clear;
close all;
clc;
%输入信号
s = ['ABABBABCABABBA'];
% s = ['AB'];
%创建初始词典
dictLen = 3;
initDict = cell(dictLen,1); %用不固定结构cell存储不定长的短语
initDict{1} = 'A';
initDict{2} = 'B';
initDict{3} = 'C';

%编码
[code,initDict,outNum] = LZWencode(s,initDict,dictLen);
code = code(1:outNum);
code
initDict
outNum

% save('LZWtest.mat','s','code','initDict','dictLen');

%解码
% clear; %清除内存
% load LZWtest.mat;
[s2,dict2] = LZWdecode(code,initDict,dictLen);
s2
dict2
if strcmp(s,s2)==1
    disp('解码数据与原数据一致');
else
    disp('解码数据与原数据不一致');
end
