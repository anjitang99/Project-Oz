def solution(number, k):
    answer = ''
    cnt =0 
    deleted = []
    number = list(number)
    for i in range(0,len(number)):
        for j in range(i+1,len(number)):
            if number[i] < number[j]:
                deleted.append(i)
                cnt = cnt + 1
                break
        if cnt == k:
            break

    for i in range(0,len(number)):
        if i not in deleted:
            answer = answer + str(number[i])
    return answer

print(solution("1231234",3))