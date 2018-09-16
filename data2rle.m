function rle = data2rle( s )
% ���룺�ź�s
% ������г����� [L1 g1,L2 g2,L3 g3,...,Ln gn],����n���г̣�
%       ���У�Li���г̳��ȣ��ظ���Ԫ�ĸ�������gi����Ԫ��
%�г̱���ĺ�����ѹ���ظ�����
nLen =length(s);%�źų���
%�����г̵ĸ��� n
n =1;
for k=1:nLen-1 
    if s(k)~=s(k+1)
        n=n+1;
    end    
end
%������������Ҫ�Ĵ洢�ռ�,Ϊ2*n.
rle =zeros(1,2*n);
%��ʼ�г̱���
Spre = s(1); % ����1��
i=1;
nL=1; %����2��
k=1;
while(i<nLen) %����6)
    i=i+1; %����3)
    if s(i)~=Spre  %����4),5),6)
        rle(1,2*k-1:2*k) = [nL,Spre];%������
        k = k+1;
        Spre = s(i);
        nL=1;
    else
        nL=nL+1;
    end
end
rle(1,2*k-1:2*k)=[nL,Spre]; %����6)
end

