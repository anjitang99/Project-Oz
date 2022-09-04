def solution(id_list, report, k):

    answer = [0 for i in range(0,len(id_list))]

    report_map = []
    idx = {}
    refined = set(report)
    refined = list(refined)

    for i in range(0,len(id_list)):
        idx[id_list[i]] = i
        report_map.append([False for j in range(0,len(id_list))])

    for item in refined:
        tmp = item.split()
        x = idx[tmp[0]]
        y = idx[tmp[1]]
        report_map[x][y] = True

    for i in range(0,len(report_map)):
        limit = []
        cnt = 0
        for j in range(0,len(report_map)):
            if report_map[j][i]:
                limit.append(j)
                cnt = cnt + 1
        if cnt >= k :
            for l in range(0,len(limit)):
                answer[limit[l]] = answer[limit[l]] + 1

    #print(answer)
    return answer