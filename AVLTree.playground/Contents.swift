
//: Playground - noun: a place where people can play

import UIKit

/*
  AVL 트리
 
 최초의 자가 균형 트리이다.
 AVL 트리의 가장 두드러진 특징은 서브트리 노드의 높이가 N 일때, 동일한 노드의 또다른 서브트리의 높이는
 [N-1, N+1] 범위 내에 있어야만 한다는 것이다. 이는 좌우의 자식 요소의 높이가 항상 달라야 함을 의미한다.
 
 예를 들어서 우측 서브트리의 높이가 3이라면 좌측 서브트리의 높이는 2~4여야만 한다는 것이다.
 이때 두 서브트리의 높이차를 균형 요소 또는 밸런스 팩터라 한다.
 Blance factor = Height(RightSubtree) - Height(LeftSubtree)
 
 AVL 트리의 경우 서브트리의 조건이 만족하지 않는 경우 균형 바로잡기 동작이 실행된다.
 
 AVL 트리 특유의 견고한 구조 덕분에 아래와 같은 성능 특징을 지닌다.
 
 검색: 평균 및 최악의 복잡성 하에서 시간 = O(log(n))
 
 삽입: 평균 및 최악의 복잡성 하에서 시간 = O(log(n))
 
 삭제: 평균 및 최악의 복잡성 하에서 시간 = O(log(n))
 
 공간: 편균 및 최악의 복잡성 = O(n)
 
 n은 트리의 노드 수를 의미한다.
 
 검색과 같은 읽기 작업은 레드블랙 트리보다 빠른데 이는 AVL 트리가 좀 더 균형이 맞는 구조이기 떄문이다.
 하지만 삽입과 삭제 작업은 레드블랙 트리보다 느리며 이는 AVL 트리가 균형 조건에 따라 데이터 구조의 균형을
 잡는 작업을 수행해야 하기 떄문이다.
 
 */

public class AVLTreeNode<T: Comparable> {
  public var value: T
  public var leftChild: AVLTreeNode?
  public var rightChild: AVLTreeNode?
  public weak var parent: AVLTreeNode?
  public var blanceFactor: Int = 0
  
  // 초기화
  public convenience init(value: T) {
    self.init(value: value, left: nil, right: nil, parent: nil)
  }
  
  public init(value: T, left: AVLTreeNode?, right: AVLTreeNode?, parent: AVLTreeNode?) {
    self.value = value
    self.leftChild = left
    self.rightChild = right
    self.parent = parent
    self.blanceFactor = 0
  }
  
}
