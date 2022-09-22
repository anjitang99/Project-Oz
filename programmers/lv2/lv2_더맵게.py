import heapq

def solution(scoville, K):
    answer = 0
    heapq.heapify(scoville)

    while scoville[0] < K :
        if len(scoville) == 1:
            answer = -1
            break
        heapq.heappush(scoville,heapq.heappop(scoville)+(2*heapq.heappop(scoville)))
        answer = answer + 1

    return answer

print(solution([1, 2],9))