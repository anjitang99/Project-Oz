import string
import math

#진수 변환 함수
tmp = string.digits+string.ascii_lowercase
def convert(num, base) :
    q, r = divmod(num, base)
    if q == 0 :
        return tmp[r] 
    else :
        return convert(q, base) + tmp[r]

# 소수 판별 함수
def is_prime_number(x):
    if x == 1 or x == 0: 
        return False
    # 2부터 x의 제곱근까지의 모든 수를 확인하며
    for i in range(2, int(math.sqrt(x)) + 1):
        # x가 해당 수로 나누어떨어진다면
        if x % i == 0:
            return False # 소수가 아님
    return True # 소수임


def solution(n, k):
    answer = 0
    trans = convert(n,k)

    tmp_num = ''

    for i in range(0,len(trans)):
        if trans[i] == '0' or i == len(trans)-1:
            if i == len(trans)-1 :
                tmp_num = tmp_num + trans[i]
            if(tmp_num != '' and is_prime_number(int(tmp_num))):
                answer = answer + 1
            tmp_num = ''
            continue                
        tmp_num = tmp_num + trans[i]
        

    return answer

print(solution(36,3))