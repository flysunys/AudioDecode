function [code,dict,outNum] = LZWencode(s, initDict,dictLen )

outNum = 0;
phrase = s(1); %步骤1)
nLen = length(s);
code = cell(1,1);%为编码数据分配存储空间

i=2;
while(i<=nLen)
    si = s(i);
    stp = [phrase si];
    isExist = CodeIsExistDict(stp, initDict, dictLen);
    if isExist==1
        phrase = stp;
        if i==nLen
            outNum = outNum+1;
            code{outNum} = phrase;
        end
    else     
        outNum = outNum+1;
        code{outNum}=phrase; %存储输出短语的编码
        dictLen=dictLen+1; %更新词典长度
        initDict{dictLen}=stp; %词典添加短语
        phrase = si;
        if i==nLen
            outNum = outNum+1;
            code{outNum} = phrase;
        end
    end
    i=i+1;
end

dict = initDict;
end


