function [s,Dict] = LZWdecode( code, initDict,dictLen )
%���룺����code,�ʵ�initDict,�ʵ䳤��dictLen 
%������������ź�s,����ʱ�����Ĵʵ�

prefix = code(1); %����1)
[isExist, phrase] = Code2String(prefix, initDict, dictLen); %����2)
currentChar = phrase(1); %����3)
s = currentChar;

nLen = length(code);
i = 2; %����4��
while(i<=nLen) %����10)
    currentCode = code(i); %����5��
    [isExist, currPhrase] = Code2String(currentCode, initDict, dictLen); %����6)
    if(isExist)
        s = [s currPhrase]; %����6)�ĵ�1��
        currentChar = currPhrase(1);
        [isExist, prefixStr] = Code2String(prefix, initDict, dictLen); %����6)�ĵ�2��
        phrase = [prefixStr currentChar]; %����6)�ĵ�2��
    else %����7)
        [isExist, preStr] = Code2String(prefix, initDict, dictLen); %����7)�ĵ�1���ȡǰһ�����ֶ�Ӧ�Ķ���
        currentChar = preStr(1); %����7)�ĵ�1�ǰһ������ĵ�һ������
        phrase = [preStr currentChar]; %����7)�ĵ�1��
        if (i==nLen)
            phrase
        end
        s = [s phrase]; %����7)�ĵ�2��
    end
    initDict{dictLen+1} = phrase; %����6),7):���¶�����ӵ��ʵ���
    dictLen = dictLen + 1;
    prefix = currentCode; %����8)
    i = i+1; %����9)
end
Dict = initDict;
end

%�ڴʵ��в������ֶ�Ӧ�Ķ���
function [isExist,str] = Code2String(index, dict, dictLen)
isExist = 1;
if(index > dictLen)
    str = '';
    isExist = 0;
else
    str = dict{index};
end
end
