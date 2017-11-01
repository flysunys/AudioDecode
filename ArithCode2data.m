function [ s,Range ] = ArithCode2data( w,SymbolSet,SymbolProb,N )
%���룺��������w����Դ���ż�SymbolSet,�����ŵĸ���SymbolProb��N��Դ����
%�����s�ź�,Range��������и���������������½硣
% w,SymbolSet,SymbolProb,N

nSLen = length(SymbolSet);
CDF = zeros(1,nSLen+1); %��ʼ��CDF�洢�ռ�
for i=1:nSLen
    CDF(i+1) = CDF(i)+SymbolProb(i);
end

s(1,N) = char(' '); %����洢�ռ�
Range = zeros(N,2);
k=1;
while k<=N
    for i=2:length(CDF)
        if w<=CDF(i) %����2
            %s = [s,SymbolSet(n)]; %����2����̬��չ�ڴ�Ч�ʵ�
            s(k) = SymbolSet(i-1); %����2
            low = CDF(i-1); up=CDF(i); %����3
            range = up-low;
            w = (w-low)/range; %����4
            Range(k,:) = [low up];
            break;
        end
    end
    k=k+1;
end
end

