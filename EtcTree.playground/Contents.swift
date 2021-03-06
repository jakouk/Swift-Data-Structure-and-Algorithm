//: Playground - noun: a place where people can play

import UIKit

/*
 B 트리
 
 B 트리의 수학적 속성은 다음과 같다
 
 오더 X인 B트리에서
 
 - 루트 노드는 1개의 키와 0 ~ 2개의 자식 노드를 지닐수 있다.
 - 그 외의 노드는 다음 규칙을 따른다
  x/2 부터 x-1개의 순서키
  x/2-1 부터 x개의 자식 노드( 서브트리 )
 - 최악의 트리 높이 시나리오에서 O(log(n))의 시간 소요
 - 모든 잎은 ( 트리의 높이에 해당하는 ) 동일한 깊이를 지닌다.
 
 
 스플레이 트리
 
 스플레이 작업이란 마지막에 방문했던 노드를 트리의 새로운 루트 노드로 만드는 것이다.
 이렇게 하면 최그니 방문 했던 노드의 높이가 최소화되고, 다음 번에 방문할 때 매우 쉽고 빠르게 접근할 수 있게 된다.
 스플레이 트리는 검색과 트리 회전의 결합을 통해 스스로 최적화해 나간다.
 
 캐시와 가비지 컬렉션이 스플레이 트리를 이용한 사례하고 볼수 있다.
 
 P 부모노드, G 조부모 노드, X 스플레이 노드
 
 지그 회전
 
 지그 회전은 노드 X가 루트 노드의 자식 노드일 떄 일어나며 이때 X의 부모 노드 P는 트리의 루트가 된다.
 이때는 X에서 P 방향의 모서리를 기준으로 회전이 이뤄진다.
 
 
 지그지그 또는 재그재그회전
 
 P가 루트 노드가 아니고 X와 P모두 우픅 자식 또는 좌측 자실에 속할 때 일어난다. 트리는 P에서 G 모서리 방향으로 회전한뒤 X
 에서 P 모서리 방향으로 다시 한 번 회전한다. 지그지그는 우측으로 두번 연속 회전하는 것, 재그재그난 좌측으로 두번 연속 회전하는
 것이다.
 
 지그재그 회전
 
 지그재그 회전은 P각 루트 노드가 아니고 X는 좌측자식, P는 우측자식이거난 그 반대의 경우에 일어난다. 먼저 트리를 P와
 X 모서리 방향으로 회전한 뒤 그결과로 생긴 G와 X 모서리 방향으로 다시 한 번 회전한다. 
 
 */
