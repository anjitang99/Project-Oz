import itertools

def solution(relation):
    answer = 0
    keys = []

    arr = [i for i in range(0,len(relation[0]))]

    for i in range(1,len(relation[0])+1):
        possible = list(itertools.combinations(arr,i))

        for item in possible : #possible : 조합 결과
            col_merged = ["" for i in range(0,len(relation))]
            for idx in item:
                for col in range(0,len(relation)):
                    col_merged[col] = col_merged[col] + relation[col][idx]

            set_merged = set(col_merged)

            flag = True

            if len(set_merged) == len(col_merged): #중복제거해도 제거된게 없으면 키라는 의미
                for key in keys: #부분집합 판별
                    if key < set(item):
                        flag = False
                if flag:
                    keys.append(set(item))
                    answer = answer + 1
    #print(answer)
    return answer

