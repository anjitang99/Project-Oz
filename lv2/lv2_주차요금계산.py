import math

def solution(fees, records):
    answer = []

    basic_time = int(fees[0])
    basic_fee = int(fees[1])
    unit_time = int(fees[2])
    unit_fee  = int(fees[3])

    arr=[]
    in_arr = {}
    result = {}

    for record in records:
        tmp = record.split(" ")
        arr.append(tmp)
        result[tmp[1]] = 0

    for i,car in enumerate(arr):
        if car[2] == 'IN':
            hour,minute =  car[0].split(":")
            in_arr[car[1]] = int(hour)*60 + int(minute)
        else :
            hour, minute = car[0].split(":")
            if car[1] in in_arr:
                result[car[1]] = result[car[1]] + (int(hour)*60+int(minute)) - in_arr[car[1]]

                del in_arr[car[1]]

    in_arr = list(in_arr.items())

    for car in in_arr:
        result[car[0]] = result[car[0]] + (24*60-1-car[1])

    result = list(result.items())
    result = sorted(result,key = lambda x : x[0])

    for car in result:
        if car[1] < basic_time:
            answer.append(basic_fee)
        else:
            answer.append(basic_fee + math.ceil((car[1]-basic_time)/unit_time)*unit_fee)


    return answer