function [s,Dict] = LZWdecode( code, initDict,dictLen )
%输入：码字code,词典initDict,词典长度dictLen 
%输出：解码后的信号s,解码时创建的词典
prefix = code{1}; %步骤1)
currentChar = prefix; 
s = currentChar;
nLen = length(code);
i = 2; %步骤4）
while(i<=nLen) %步骤10)
    currentCode = code{i}; %步骤5）
    isExist= CodeIsExistDict(currentCode, initDict, dictLen); %步骤6)
    if(isExist)
        s = [s currentCode]; %步骤6)的第1项
        currentChar = currentCode(1);
        phrase = [prefix currentChar]; %步骤6)的第2项
    else %步骤7)
        currentChar = prefix(1); %步骤7)的第1项，前一个短语的第一个符号
        phrase = [prefix currentChar]; %步骤7)的第1项
        s = [s phrase]; %步骤7)的第2项
    end
    dictLen = dictLen + 1;
    initDict{dictLen} = phrase; %步骤6),7):将新短语添加到词典中
    prefix = currentCode; %步骤8)
    i = i+1; %步骤9)
end
Dict = initDict;
end
