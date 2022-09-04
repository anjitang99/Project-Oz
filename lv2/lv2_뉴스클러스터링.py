from collections import Counter

def solution(str1,str2):
    answer=0
    sub_str1=[]
    sub_str2=[]
    meet_set={}

    str1=str1.upper()
    str2=str2.upper()

#    str1 = [i for i in str1 if i.isalpha()]
#    str1 = ''.join(str1)

#    str2 = [i for i in str2 if i.isalpha()]
#    str2 = ''.join(str2)

    for i in range(0,len(str1)-1):
        if str1[i:i + 2].isalpha():
            sub_str1.append(str1[i:i+2])

    for i in range(0,len(str2)-1):
        if str2[i:i + 2].isalpha():
            sub_str2.append(str2[i:i+2])

    chunk1 = Counter(sub_str1)
    chunk2 = Counter(sub_str2)

    for word1 in chunk1:
        for word2 in chunk2:
            if word1 == word2:
                meet_set[word1] = min(chunk1[word1],chunk2[word1])

    plus_set = chunk1 + chunk2 - Counter(meet_set)

    mo =0
    ja = 0
    for key in meet_set.values():
        ja += key
    for key in plus_set.values():
        mo += key
    
    if mo > 0 :
        answer = int(ja/mo*65536)
    else :
        answer = 65536
    return answer