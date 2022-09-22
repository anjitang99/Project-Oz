import math
answer = []

def is_prime(num):
    if num == 1 or num == 0:
        return False
    for i in range(2,int(math.sqrt(num))+1):
        if num % i == 0:
            return False
    return True

def dfs(num, now,visited,depth):
    if now == '':
        now = '0'
    if is_prime(int(now)) :
        global answer
        answer.append(int(now))
    for i in range(0,len(num)) :
        if not visited[i] :
            visited[i] = True
            dfs(num, now + num[i], visited,depth+1)
            visited[i] = False

def solution(numbers):
    global answer
    visited = [False for i in range(0,len(numbers))]
    dfs(numbers,'',visited,0)
    answer = set(answer)
    answer = list(answer)
    return len(answer)

print(solution("17"))