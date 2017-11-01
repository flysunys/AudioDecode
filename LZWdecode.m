function [s,Dict] = LZWdecode( code, initDict,dictLen )
%输入：码字code,词典initDict,词典长度dictLen 
%输出：解码后的信号s,解码时创建的词典

prefix = code(1); %步骤1)
[isExist, phrase] = Code2String(prefix, initDict, dictLen); %步骤2)
currentChar = phrase(1); %步骤3)
s = currentChar;

nLen = length(code);
i = 2; %步骤4）
while(i<=nLen) %步骤10)
    currentCode = code(i); %步骤5）
    [isExist, currPhrase] = Code2String(currentCode, initDict, dictLen); %步骤6)
    if(isExist)
        s = [s currPhrase]; %步骤6)的第1项
        currentChar = currPhrase(1);
        [isExist, prefixStr] = Code2String(prefix, initDict, dictLen); %步骤6)的第2项
        phrase = [prefixStr currentChar]; %步骤6)的第2项
    else %步骤7)
        [isExist, preStr] = Code2String(prefix, initDict, dictLen); %步骤7)的第1项，获取前一个码字对应的短语
        currentChar = preStr(1); %步骤7)的第1项，前一个短语的第一个符号
        phrase = [preStr currentChar]; %步骤7)的第1项
        if (i==nLen)
            phrase
        end
        s = [s phrase]; %步骤7)的第2项
    end
    initDict{dictLen+1} = phrase; %步骤6),7):将新短语添加到词典中
    dictLen = dictLen + 1;
    prefix = currentCode; %步骤8)
    i = i+1; %步骤9)
end
Dict = initDict;
end

%在词典中查找码字对应的短语
function [isExist,str] = Code2String(index, dict, dictLen)
isExist = 1;
if(index > dictLen)
    str = '';
    isExist = 0;
else
    str = dict{index};
end
end
