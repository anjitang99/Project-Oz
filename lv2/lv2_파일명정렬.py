def solution(files):
    answer = []
    idx = {}
    tmp = files.copy()
    trimed = []

    for i , file in enumerate(files):
        idx[i] = file

    for i,file in enumerate(tmp):
        head = ''
        number = ''
        #file.upper()

        flag =0

        #head
        for j,s in enumerate(file):
            if s.isdigit():
                flag = j
                break
            head = head + s
        head=head.upper()
        #tail
        for j in range(flag,len(file)):
            if not file[j].isdigit():
                break
            number = number + file[j]
        number = int(number)
        trimed.append([head,number,i])

    trimed = sorted(trimed,key=lambda x : (x[0],x[1],x[2]))

    for item in trimed:
        answer.append(idx[item[2]])


    return answer