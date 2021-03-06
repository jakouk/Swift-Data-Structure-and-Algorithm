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
 
 
 트리의 종류
 
 
  이진 트리
 
  가장 간단한 트리 구조로 시작한다. 이진 트리는 각 노드가 최대 두 개의 노드만을 지닐 수 있는 트리구조다.
 이진 트리는 데이터 구조상, 입력값과 참조값을 각각의 노드에 저장해야 하며, 벨류 키는 물론 때에 따라서는 부모노드에대한 참조값, 자식 노드로 연결되는 좌측 참조값, 또 다른
 자식 노드로 연결되는 우측 참조값등이 포함된다.
  트정 노드가 부모 노드, 좌측과 우측 자신노드, 이들 요소에 대한 참조값 등을 포함하지 않은 경우 NULL/nil 값을 포함하고 있다고 한다.
 
 
  이진 검색 트리
 
  이진 검색 트리는 트리에 있는 각각의 노드가 다음과 같은 조건식을 충족하는 트리구조다.
  트리에 노드 P가 있을 때,
 좌측 서브트리에 있는 모든 노드 L에 대해 L.value < P.value
 우측 서브트리에 있는 모든 노드 R에 대해 R.valu >= P.value
 이 규칙은 부모 노드의 좌측에 있는 서브트리의 모든 자식 노드의 키값은 부모 노드의 키값보다 작다는 것이다.
  또한 부모 노드의 우측에 있는 서브트리의 모든 자식 노드의 키값은 부모 노드의 키값보다 크다는 것이다.
 
 
 B 트리
 
 B 트리는 균형 잡힌 이직 검색 트리와 유사하지만, 각 노드마다 두 개 이상의 자식 노드를 지닉수 있다는 차이점이 있다.
 
 
 스플레이 트리
 
  스플레이 트리는 이직 검색 트리의 특수한 형태로서, 최근에 접근한 노드가 트리의 상위로 이동한다는 특징을 지닌다. 이러한 특성은 노드에 대한 접근이
 매우 빈번한 상태에서 가장 최근에 방문햇던 노드만을 골라낼 수 있어서 해당 노드에 대한 검색 시간을 획기적으로 줄여준다.
 이를 위해 스플레이 트리는 노드에 접근할 때 마다 스스로의 구조를 변형한다. 벌리다라는 의미의 스플레이 프로세스는 노드를 재배열하기 위해 트리를 회전시키고,
 마지막으로 접근한 노드를 트리의 최상위 노드로 이동시킬 떄 사용된다.
 
 
 레드블랙 트리
 
  레드블랙 트리는 각각의 노드마다 노드 컬러라는 새로운 파라미터를 추가하는 방법으로 스스로 균형점을 찾는 이진 검색트리다.
 노드의 생상은 레드 또는 블랙 중 하나이며, 레드블랙 트리 노드에는 키값, 노드컬러, 부모 참조값, 좌측 및 우측 자식의 참조값 등이 포함돼 있다.
 
 1. 모든 노드는 레드 또는 블랙 중 하나의 컬러를 지닌다.
 2. 루트 노드는 블랙이다.
 3. 모든 NULL/ nil 잎은 블랙이다.
 4. 모든 레드 노드의 좌측, 우측 자식 노드는 모두 블랙이다.
 5. 각각의 노드에서, 잎으로 연결되는 모든 경로에는 동일한 수의 블랙 잎이 포함돼 있다.
 
 레드블랙 트리는 검색, 삽입, 삭제등의 중요한 작업에서 최악을 성능을 나타내는데 이런 점으로 최악의 시나리오를 검토할수 있다. 
 
 
 
 */
