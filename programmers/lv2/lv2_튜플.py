def solution(s):
    answer = []
    s=s[1:len(s)-1]
    arr=[]
    for i in range(0,len(s)-1):
        if s[i] == '{':
            tmp=[]
            num=''
            while s[i] != '}':
                if s[i].isnumeric():
                    #tmp.append(int(s[i]))
                    num += s[i]
                if s[i] == ',' or s[i+1] == '}':
                    tmp.append(int(num))
                    num = ''
                i += 1
            arr.append(set(tmp))
    arr=sorted(arr,key= lambda x:len(x))

    answer.append(list(arr[0])[0])
    for i in range(0,len(arr)-1):
        tmp = list(arr[i+1]-arr[i])
        answer.append(tmp[0])
    return list(answer)