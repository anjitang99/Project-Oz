from collections import deque
def solution(queue1, queue2):
    queue1, queue2 = deque(queue1), deque(queue2)
    q1_sum, q2_sum = sum(queue1), sum(queue2)
    max_cnt,cnt = len(queue1) * 2, 0

    while(queue1 and queue2) and max_cnt !=cnt :
        if q1_sum == q2_sum:
            return cnt
        elif q1_sum > q2_sum:
            temp = queue1.popleft()
            queue2.append(temp)
            q1_sum -= temp
            q2_sum += temp
        else:
            temp = queue2.popleft()
            queue1.append(temp)
            q1_sum += temp
            q2_sum -= temp
        cnt += 1
    return -1
    my = deque([])
    if my :
        print(1)
    #max_num = sum(queue1) + sum(queue2)
    
    #while (queue1 and queue2) and max_num == sum(queue1):

    
    #return answer

solution(1,2)
