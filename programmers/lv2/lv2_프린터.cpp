#include <string>
#include <vector>
#include <algorithm>
using namespace std;

bool scan (vector<pair<int,int>> a, int prior){
     for(auto i : a){
         if(i.second>prior) return true;
     }
    return false;
}

int solution(vector<int> priorities, int location) {
    int answer = 0;
    vector<pair<int,int>> a;
    
    for(int i=0; i<priorities.size(); i++){
        a.push_back(make_pair(i,priorities[i]));
    }
   
    while(!a.empty()){
        
        if(scan(a,a.front().second)){
            a.push_back(a.front());
            a.erase(a.begin());
        }
        else{
            answer ++;
            if(a.front().first == location) return answer;
            a.erase(a.begin());
        }
        
    }
    
    
}