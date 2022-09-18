# -*- coding: utf-8 -*-
# UTF-8 encoding when using korean
import math

n,k = map(int,input().split())

arr = list(map(int,input().split()))

answer = math.inf

start_idx = arr.index(min(arr))
for i in range(k):
    cnt = 1
    front,back = arr[:start_idx-i], arr[start_idx+k-i:]
    front_cnt = len(front) // (k-1) + (1 if len(front) % (k-1) else 0)
    back_cnt = len(back) // (k-1) + (1 if len(back) % (k-1) else 0)
    answer = min(answer , cnt + front_cnt + back_cnt)
print(answer)