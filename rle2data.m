function s = rle2data( rle)
% 输入：rle码组数据，存放形式为[L1 g1, L2 g2, ..., Ln gn]
% 输出：s是解码后恢复的信号

nLen = length(rle); %码组长度
%计算信元个数
nNum=0;
for i=1:2:nLen-1
    nNum = nNum + rle(1,i);
end
%申请信号存储空间
s =zeros(1,nNum);
%开始解码
k=1;
for i=1:2:nLen-1  %步骤2,3,4,5
    %输出从第k个信元开始的rle(1,i)个重复信元，其值为rle(1,i+1)
    s(1,k:k+rle(1,i)-1) = rle(1,i+1);
    k = k+rle(1,i);
end    
end

