function [ s,Range ] = ArithCode2data( w,SymbolSet,SymbolProb,N )
%输入：算术编码w，信源符号集SymbolSet,各符号的概率SymbolProb，N信源长度
%输出：s信号,Range编码过程中各个分析区间的上下界。
% w,SymbolSet,SymbolProb,N

nSLen = length(SymbolSet);
CDF = zeros(1,nSLen+1); %初始化CDF存储空间
for i=1:nSLen
    CDF(i+1) = CDF(i)+SymbolProb(i);
end

s(1,N) = char(' '); %分配存储空间
Range = zeros(N,2);
k=1;
while k<=N
    for i=2:length(CDF)
        if w<=CDF(i) %步骤2
            %s = [s,SymbolSet(n)]; %步骤2，动态拓展内存效率低
            s(k) = SymbolSet(i-1); %步骤2
            low = CDF(i-1); up=CDF(i); %步骤3
            range = up-low;
            w = (w-low)/range; %步骤4
            Range(k,:) = [low up];
            break;
        end
    end
    k=k+1;
end
end

