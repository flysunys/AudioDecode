function [code,dict,outNum] = LZWencode(s, initDict,dictLen )

outNum = 0;
phrase = s(1); %����1)
nLen = length(s);
code = cell(1,1);%Ϊ�������ݷ���洢�ռ�

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
        code{outNum}=phrase; %�洢�������ı���
        dictLen=dictLen+1; %���´ʵ䳤��
        initDict{dictLen}=stp; %�ʵ���Ӷ���
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


