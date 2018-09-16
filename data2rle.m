function rle = data2rle( s )
% 输入：信号s
% 输出：行程序列 [L1 g1,L2 g2,L3 g3,...,Ln gn],共有n个行程，
%       其中，Li是行程长度（重复信元的个数），gi是信元。
%行程编码的核心是压缩重复数字
nLen =length(s);%信号长度
%计算行程的个数 n
n =1;
for k=1:nLen-1 
    if s(k)~=s(k+1)
        n=n+1;
    end    
end
%申请码组所需要的存储空间,为2*n.
rle =zeros(1,2*n);
%开始行程编码
Spre = s(1); % 步骤1）
i=1;
nL=1; %步骤2）
k=1;
while(i<nLen) %步骤6)
    i=i+1; %步骤3)
    if s(i)~=Spre  %步骤4),5),6)
        rle(1,2*k-1:2*k) = [nL,Spre];%存放输出
        k = k+1;
        Spre = s(i);
        nL=1;
    else
        nL=nL+1;
    end
end
rle(1,2*k-1:2*k)=[nL,Spre]; %步骤6)
end

