function s = rle2data( rle)
% ���룺rle�������ݣ������ʽΪ[L1 g1, L2 g2, ..., Ln gn]
% �����s�ǽ����ָ����ź�

nLen = length(rle); %���鳤��
%������Ԫ����
nNum=0;
for i=1:2:nLen-1
    nNum = nNum + rle(1,i);
end
%�����źŴ洢�ռ�
s =zeros(1,nNum);
%��ʼ����
k=1;
for i=1:2:nLen-1  %����2,3,4,5
    %����ӵ�k����Ԫ��ʼ��rle(1,i)���ظ���Ԫ����ֵΪrle(1,i+1)
    s(1,k:k+rle(1,i)-1) = rle(1,i+1);
    k = k+rle(1,i);
end    
end

