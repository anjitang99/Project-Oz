#include <string>
#include <vector>
#include <map>

using namespace std;

int solution(vector<vector<string>> clothes) {
    int answer = 1;
    
    map<string,int> m;
    
    for(int i=0; i<clothes.size(); i++){
        
        vector<string> now = clothes[i];
        m[now[1]] ++;
    
    }
    
    for(auto iter : m){
        
        answer = answer * (iter.second+1);
        
    }
    
    return answer-1;
}