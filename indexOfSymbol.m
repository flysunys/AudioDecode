function pos = indexOfSymbol( s, set )
% ���룺��ȡĳ������s�ڷ��ż�Set�е�λ�û��������
% ���������s��λ������
pos =1;
nSLen = length(set);
while((pos<=nSLen)&&(s~=set(pos)))
    pos = pos +1;
end
if (pos>nSLen)
    pos = -1;
end
end