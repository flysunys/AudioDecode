function [ code,Range ] = data2ArithCode( s,SymbolSet, SymbolProb )
%���룺�ź�s,��Դ���ż�SymbolSet, �����ŵĸ���SymbolProb
%�������������code,��������и���������������½硣

nSLen = length(SymbolSet); 
CDF = zeros(1,nSLen+1); %��ʼ��CDF�洢�ռ� 
for i=1:nSLen %����2)
    CDF(i+1) = CDF(i)+SymbolProb(i);
end

low = 0.0; up=1.0; %����3��
N = length(s); 
Range = zeros(N,2);%������Ϊ����仯�ļ�¼��
Range(1,:) = [low up];%��ʼ�����
i =1;
while(i<=N)
     range = up-low; %����4) 
     n = indexOfSymbol(s(i),SymbolSet) + 1; %����5)
     up = low + range*CDF(n);
     low = low + range* CDF(n-1);
     i = i+1;
     Range(i,:) = [low up];
end
code = (low + up)/2; %����6): ���������������ֵ��Ϊ�������
end

