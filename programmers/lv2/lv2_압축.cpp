#include <string>
#include <vector>

using namespace std;


void dfs(int from ,int node, long long & answer ,vector<long long> &a, vector<vector<int>>& map){
    
    
    
    for(int i =0 ; i< map[node].size(); i++){
        if(map[node][i] == from) continue;
        
            dfs(node,map[node][i], answer, a, map);
        
    }
    
    if(a[node] >0){
        a[from] = a[from] + a[node];
        answer = answer + a[node];
        
    }
    
    else if(a[node] <0){
        a[from] = a[from] + a[node];
        answer = answer + (a[node]* -1);
        
    }
    
    
    
}

long long solution(vector<int> a, vector<vector<int>> edges) {
    long long answer = 0;

    vector<vector<int>> map (a.size());
    vector<long long> sum(a.size()); // long long 버전의 a, 가중치를 Leaf 노드부터 변화시켜가며 올라갈 것.
    for (int i = 0; i < a.size(); i++) sum[i] = a[i];
    
    
    for (int i = 0; i < edges.size(); i++) {
        map[edges[i][0]].push_back(edges[i][1]);
        map[edges[i][1]].push_back(edges[i][0]);
    }
    
    dfs(0,0, answer, sum, map) ;
    
    if(sum[0] != 0) answer = -1  ;
    

    return answer;
}

int main (){
    
    solution({0,1,0},{{0,1},{1,2}});
    
}