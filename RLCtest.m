% �����г̱����㷨
clear;clc;close all;
s = [1 2 2 2 2 3 3 3 3 4 4 4 5 5 5 5 5 5 5 6 6 6 7];

rle = data2rle(s); %�г̱���
disp(rle)
save('RLCtest.mat','rle');
clear; %����ڴ�
load RLCtest.mat
sr = rle2data(rle); %�г̽���
disp(sr)

% I=imread('LENA.bmp');
% figure;
% subplot(1,2,1);
% imshow(I);
% title('����ǰͼ��');
% [m,n]=size(I);
% s = reshape(I,1,m*n); % ����άͼ������ת��Ϊһά��ʽ��
% rle = data2rle(s); %�г̱���
% %������������ļ���
% save('RLCtest2.mat','rle','m','n'); % ���ͼ�����
% 
% % clear; %����ڴ�
% load RLCtest2.mat
% sr =rle2data(rle); %�г̽���
% srI = reshape(sr,m,n); %��һάͼ������ת���ɶ�ά��
% subplot(1,2,2);
% imshow(srI,[]); %��ʾ������ͼ��
% title('���������ͼ��');
