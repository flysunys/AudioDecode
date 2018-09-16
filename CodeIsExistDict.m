%≈–∂œ∂Ã”Ô «∑Ò‘⁄¥ µ‰÷–
function isExist = CodeIsExistDict(phrase, dict, dictLen)
isExist = 0;
i=1;
while(i<=dictLen)
    if strcmp(dict{i},phrase)==1
        isExist = 1;
        return;
    end
    i=i+1;
end
end