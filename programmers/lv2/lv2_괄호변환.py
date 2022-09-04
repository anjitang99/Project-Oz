def dfs (full_w):
    right = 0
    left = 0
    u = ''
    v = ''

    if full_w == '':
        return ''

    for i in range(0, len(full_w)):  # 균형잡힌 문자열 찾기
        if full_w[i] == '(':
            left += 1
            u += full_w[i]
        else:
            right += 1
            u += full_w[i]
        if left == right:
            v = full_w[i+1:]
            break

    if balance_chk(u):
        balance_v = dfs(v)
        return u+balance_v
    else:
        tmp = '('
        tmp += dfs(v)
        tmp += ')'
        u= u[1:len(u)-1]
        for i in u:
            if i == '(':
                tmp += ')'
            else:
                tmp += '('
        return tmp

def balance_chk(tmp):
    flag = True
    left = 0
    right = 0
    for i in tmp:
        if i == '(':
            left += 1
        else :
            right += 1
        if left < right:
            flag = False
            break
    return flag

def solution(p):
    answer = ''
    answer = dfs(p)
    return answer