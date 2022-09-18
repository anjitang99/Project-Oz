def solution(n, words):
    answer = []    
    said = []
    
    for i, word in enumerate(words):
        if word in said:
            answer.append(i%n+1)
            answer.append(i+1//n)
            break
        if i != 0 and words[i-1][-1] != words[i][0]:
            answer.append(i%n+1)
            answer.append(i+1//n)  
            break
        if len(word) == 1:
            answer.append(i%n+1)
            answer.append(i+1//n) 
            break
        said.append(word)
    if len(answer) == 0:
        answer.append(0)
        answer.append(0)
    return answer

print(solution(3,["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"]))