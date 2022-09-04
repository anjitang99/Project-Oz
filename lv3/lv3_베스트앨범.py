def solution(genres, plays):
    dic = {}
    collects = []
    answer = []
    for i in range(len(genres)):
        genre = genres[i]
        if genre in dic:
            dic[genre] = dic[genre] + plays[i]
        else:
            dic[genre] = plays[i]
        collects.append([i, genres[i], plays[i]])
    collects   = sorted(collects, key=lambda item:item[2], reverse = True)
    sorted_gen = sorted(dic.items(), key=lambda item: item[1], reverse=True)

    for genre in sorted_gen :
        flag = 0
        for i in  range(len(genres)):
            if flag == 2:
                break
            if collects[i][1] == genre[0]:
                answer.append(collects[i][0])
                flag = flag + 1
    return answer