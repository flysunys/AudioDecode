function [ code,Range ] = data2ArithCode( s,SymbolSet, SymbolProb )
%输入：信号s,信源符号集SymbolSet, 各符号的概率SymbolProb
%输出：算术编码code,编码过程中各个分析区间的上下界。

nSLen = length(SymbolSet); 
CDF = zeros(1,nSLen+1); %初始化CDF存储空间 
for i=1:nSLen %步骤2)
    CDF(i+1) = CDF(i)+SymbolProb(i);
end

low = 0.0; up=1.0; %步骤3）
N = length(s); 
Range = zeros(N,2);%将其作为间隔变化的记录器
Range(1,:) = [low up];%初始化间隔
i =1;
while(i<=N)
     range = up-low; %步骤4) 
     n = indexOfSymbol(s(i),SymbolSet) + 1; %步骤5)
     up = low + range*CDF(n);
     low = low + range* CDF(n-1);
     i = i+1;
     Range(i,:) = [low up];
end
code = (low + up)/2; %步骤6): 将最后分析区间的中值作为编码输出
end

