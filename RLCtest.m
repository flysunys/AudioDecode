% 测试行程编码算法
clear;clc;close all;
s = [1 2 2 2 2 3 3 3 3 4 4 4 5 5 5 5 5 5 5 6 6 6 7];

rle = data2rle(s); %行程编码
disp(rle)
save('RLCtest.mat','rle');
clear; %清空内存
load RLCtest.mat
sr = rle2data(rle); %行程解码
disp(sr)

% I=imread('LENA.bmp');
% figure;
% subplot(1,2,1);
% imshow(I);
% title('编码前图像');
% [m,n]=size(I);
% s = reshape(I,1,m*n); % 将二维图像数据转换为一维形式。
% rle = data2rle(s); %行程编码
% %保存编码结果到文件中
% save('RLCtest2.mat','rle','m','n'); % 针对图像编码
% 
% % clear; %清空内存
% load RLCtest2.mat
% sr =rle2data(rle); %行程解码
% srI = reshape(sr,m,n); %将一维图像数据转换成二维的
% subplot(1,2,2);
% imshow(srI,[]); %显示解码后的图像
% title('编码后解码的图像');
