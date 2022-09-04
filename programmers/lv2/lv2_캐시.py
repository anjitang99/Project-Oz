def solution(cacheSize, cities):
    answer = 0
    cache = []
    cities = [city.upper() for city in cities]

    if cacheSize == 0:
        return len(cities)*5

    for city in cities:
        if city in cache:
            answer = answer + 1
            cache.remove(city)
            cache.append(city)
        else:
            answer = answer + 5
            if len(cache)>=cacheSize:
                cache.pop(0)
                cache.append(city)
            elif cacheSize>0:
                cache.append(city)

    return answer