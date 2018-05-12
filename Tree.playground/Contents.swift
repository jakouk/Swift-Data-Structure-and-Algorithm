//: Playground - noun: a place where people can play

import UIKit

/*
 트리 : 정의와 주요 속성
 
  트리는 노드의 집합니다. 각각의 노드는 키값, 자신 노드 집합, 부모 노드 링크등을 포함하고 있는 데이터 구조다.
 여러 노드 중 부모 노드를 지니지 않은 유일한 노드는 트리의 루트, 혹은 루트노드뿐이다. 트리는 나름의 계층을 이루고 있는
 데이터 구조를 나타내며, 트리의 최상위 노드인 로트 노드와 그 아래로 뻗어나가는 자식 노드로 구성된다.
 
 트리의 주요 용어
 
 루트: 트리의 최상위에 있는, 부모 노드를 지니지 않는 유일한 노드를 가리킨다.
 
 노드: 자신 노드와 부모 노드에 대한 참조 데이터, 그리고 값을 지닌 데이터 구조다. 만일 어떤 노드가 부모 노드에 대한 참조 데이터가 없다면, 바로 그 노드가 트리의 루트 노드가 된다. 또 어떤 노드가 자식 노드를 지니지 않았을 경우 잎사귀 노드가 된다.
 
 모서리: 부모 노드와 자식 노드의 연결선을 가리킨다.
 
 부모: 다른 노드와 연결돼 있으면서, 계층 구조상 특정 노드의 바로 위에 있는 노드를 가리킨다. 모든 노드는 오직 하나 의
     부모 노드를 지닌다.
 
 자식: 다른 노드와 연결돼 있으면서, 계층 구조상 특정 노드의 바로 아래에 있는 노드를 가리킨다. 모든 노드는 0개의 혹은
     여러개의 자식 노드를 지닌다.
 
 형제: 동일한 부모 노드에서 나온 노드를 가리킨다.
 
 잎: 더 이상의 자식 노드를 지니지 않은 자식 노드를 가리키며, 트리 계층 구조에서 맨 아래에 위치한다.
   잎 노드는 외부 노드로, 잎사위 노드가 아닌 노드는 내부 노드로 부른다.
 
 서브트리: 특정 노드의 모든 자손을 가리킨다.
 
 노드의 높이: 하나의 노드에서 가장 멀리 떨어져 있는 잎사귀 노드에 이르는 모서리수를 가리킨다.루트 노드빡에 없는 트리의
   노드 높이는 0 이다.
 
 트리의 높이: 로트 노드에서 잰 높이다.
 
 깊이: 루트와 노드를 연결하는 모서리의 수를 가리킨다.
 
 레벨: 어떤 노드의 레벨이란 깊이 + 1을 의미한다.
 
 트리여정: 트리의 모든 노드를 한번씨 다녀오는 과정을 의미한다. 
 
 */
