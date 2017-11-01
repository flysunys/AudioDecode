function pos = indexOfSymbol( s, set )
% 输入：获取某个符号s在符号集Set中的位置或索引序号
% 输出：符号s的位置索引
pos =1;
nSLen = length(set);
while((pos<=nSLen)&&(s~=set(pos)))
    pos = pos +1;
end
if (pos>nSLen)
    pos = -1;
end
end