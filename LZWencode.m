function [code,dict,outNum] = LZWencode(s, initDict,dictLen )

outNum = 0;
phrase = s(1); %����1)
nLen = length(s);
code = zeros(1,nLen);%Ϊ�������ݷ���洢�ռ�

i=2;
while(i<=nLen)
    si = s(i);
    stp = [phrase si];
    isExist = codeIsExistDict(stp, initDict, dictLen);
    if isExist==1
        phrase = stp;
    else
        [exist,pos]= codeIsExistDict(phrase, initDict, dictLen);
        fprintf('%s %d\n',phrase,pos) %������Ｐ����     
        outNum = outNum+1; 
        code(outNum)=pos; %�洢�������ı���
        dictLen=dictLen+1; %���´ʵ䳤��
        initDict{dictLen}=stp; %�ʵ���Ӷ���
        phrase = si;
    end
    i=i+1;
end
[exist,pos]= codeIsExistDict(phrase, initDict, dictLen);
fprintf('%s %d\r\n',phrase,pos) %������Ｐ����
outNum = outNum+1; 
code(outNum)=pos; 
 
dict = initDict;
end


%�ж϶����Ƿ��ڴʵ���
function [isExist,pos] = codeIsExistDict(phrase, dict, dictLen)
isExist = 0;
i=1;
while(i<=dictLen)
    if strcmp(dict{i},phrase)==1
        isExist = 1;
        pos = i;
        return;
    end
    i=i+1;
end
end