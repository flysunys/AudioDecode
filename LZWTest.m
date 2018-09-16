%测试LZW编解码算法

%初始化
clear;clc;close all;
%输入信号
%s = 'ABABBABCABABBA';
% s = 'AB';
s ='ababcbababaaaaaaa';
%s = 'ababcababac';
%创建初始词典
su =unique(s);%去重
dictLen = length(su);
initDict = cell(dictLen,1); %用不固定结构cell存储不定长的短语
for i =1:dictLen
    initDict{i} = su(i);
end

%编码
[code,Dict,outNum] = LZWencode(s,initDict,dictLen);
%code = code(1:outNum);
display(code);%编码码段
display(Dict);%编码字典
display(outNum);%编码个数

% save('LZWtest.mat','s','code','initDict','dictLen');

%解码
% clear; %清除内存
% load LZWtest.mat;
[s2,dict2] = LZWdecode(code,initDict,dictLen);
display(s2)%解码之后的结果
display(dict2)%解码之后的字典
if strcmp(s,s2)==1
    disp('解码数据与原数据一致');
else
    disp('解码数据与原数据不一致');
end
