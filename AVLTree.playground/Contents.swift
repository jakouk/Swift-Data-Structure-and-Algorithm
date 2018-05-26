
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
 
 
 AVL 트리 회전
 
 1. 좌측 단순회전
 2. 우측 단순회전
 3. 좌우 이중 회전
 4. 우좌 이중 회전
 */

public class AVLTreeNode<T: Comparable> {
  public var value: T
  public var leftChild: AVLTreeNode?
  public var rightChild: AVLTreeNode?
  public weak var parent: AVLTreeNode?
  public var balanceFactor: Int = 0
  
  // 초기화
  public convenience init(value: T) {
    self.init(value: value, left: nil, right: nil, parent: nil)
  }
  
  public init(value: T, left: AVLTreeNode?, right: AVLTreeNode?, parent: AVLTreeNode?) {
    self.value = value
    self.leftChild = left
    self.rightChild = right
    self.parent = parent
    self.balanceFactor = 0
  }
  
 
  // 1단계: 회전 -> 2단계: 높이 ( 균형 )
  public func rotateLeft() -> AVLTreeNode {
    guard let parent = parent else {
      return self
    }
    
    // 1 단계: 회전
    // 0. 나중에 사용할 수 있도록 임시 참조값을 저장
    let grandParent = parent.parent
    let newLeftChildsRightChild = self.leftChild
    var wasLeftChild = false
    
    if parent === grandParent?.leftChild {
      wasLeftChild = true
    }
    
    //1. 기존의 부모 노드가 새로운 좌측 자식 노드가 됨
    self.leftChild = parent
    self.leftChild?.parent = self
    
    //2. 기존의 조부 노드가 새로운 부모 노드가 됨
    self.parent = grandParent
    if wasLeftChild {
      grandParent?.leftChild = self
    } else {
      grandParent?.rightChild = self
    }
    
    ///3. 기존의 좌측 자신노드가 새로운 좌측 자식의 우측 자신 노드가 됨
    self.leftChild?.rightChild = newLeftChildsRightChild
    self.leftChild?.rightChild?.parent = self.leftChild
    
    // 2단계: 높이 업데이트
    if self.balanceFactor == 0 {
      self.balanceFactor = -1
      self.leftChild?.balanceFactor = 1
    } else {
      self.balanceFactor = 0
      self.leftChild?.balanceFactor = 0
    }
    return self
  }
  
  
  // 단순 우측 회전 메소드 구현
  public func rotateRight() -> AVLTreeNode {
    guard let parent = parent else {
      return self
    }
    
    // 1 단계: 회전
    // 0. 나중에 사용할 수 있도록 임시 참조값을 저장
    let grandParent = parent.parent
    let newRightChildsLeftChild = self.rightChild
    var wasLeftChild = false
    if parent === grandParent?.leftChild {
      wasLeftChild = true
    }
    
    //1. 기존의 부모 노드가 새로운 우측 자식 노드가 됨
    self.rightChild = parent
    self.rightChild?.parent = self
    
    //2. 기존의 조부 노드가 새로운 부모 노드가 됨
    self.parent = grandParent
    if wasLeftChild {
      grandParent?.leftChild = self
    } else {
      grandParent?.rightChild = self
    }
    
    //3. 기존의 우측 자식 노드가 새로운 우츠 자식의 좌측 자식 노드가 됨
    self.rightChild?.leftChild = newRightChildsLeftChild
    self.rightChild?.leftChild?.parent = self.rightChild
    
    // 2 단계: 높이 업데이트
    if self.balanceFactor == 0 {
      self.balanceFactor = 1
      self.leftChild?.balanceFactor = -1
    } else {
      self.balanceFactor = 0
      self.leftChild?.balanceFactor = 0
    }
    return self
  }
  
  // 우-좌 이중 회전 메소드의 구현
  public func rotateRightLeft() -> AVLTreeNode {
    // 1: 이중 회전
    _ = self.rotateRight()
    _ = self.rotateLeft()
    
    // 2: 균형 요소 업데이트
    if self.balanceFactor > 0 {
      self.leftChild?.balanceFactor = -1
      self.rightChild?.balanceFactor = 0
    } else if self.balanceFactor == 0 {
      self.leftChild?.balanceFactor = 0
      self.rightChild?.balanceFactor = 0
    } else {
      self.leftChild?.balanceFactor = 0
      self.rightChild?.balanceFactor = 1
    }
    self.balanceFactor = 0
    return self
  }
  
  // 좌-우 이중 회전 메소드의 구현

  
  public func insertNodeFromRoot(value: T) {
    // 진 검색 트리 속성을 유지하기 위해 루트
    if let _ = self.parent {
      
      // 만일 부모가 있다면 루트 노드가 아님
      print("You can only add new nodes from the root node of the tree")
      return
    }
    self.addNode(value:value)
  }
  
  private func addNode(value: T) {
    if value < self.value {
      // 삽입할 노드의 값은 루트 노드 값보다 작은경우
      // 좌측 서브트리에 삽입해야함
      
      // 좌측 서브트리에 삽입하되, 만일 좌측 서브트리가 존재하지
      // 않으면 새로운 노드를 생성하고 좌측 자식 노드로 삼음
      if let leftChild = leftChild {
        leftChild.addNode(value: value)
      } else {
        let newNode = AVLTreeNode(value: value)
        newNode.parent = self
        leftChild = newNode
      }
    } else {
      // 삽입할 노드의 값은 루트 노드 값보다 큰 경우,
      // 우측 서브트리에 삽입해야 함
      
      // 우측 서브트리에 삽입하되, 우측 서브트리가 존재하지 않으면
      // 새로운 노드를 생성하고 우측 자식 노드로 삼음
      
      if let rightChild = rightChild {
        rightChild.addNode(value: value)
      } else {
        let newNode = AVLTreeNode(value: value)
        newNode.parent = self
        rightChild = newNode
      }
    }
  }
  
  // 트리의 상단부터 하단에 이르는 모든 레이어의 노드닶과 균형 요소를 출력
  public static func printTree(nodes:[AVLTreeNode]) {
    var children: [AVLTreeNode] = Array()
    for node: AVLTreeNode in nodes {
      print("\(node.value)" + " " + "\(node.balanceFactor)")
      if let leftChild = node.leftChild {
        children.append(leftChild)
      }
      if let rightChild = node.rightChild {
        children.append(rightChild)
      }
    }
    if children.count > 0 {
      printTree(nodes: children)
    }
  }
  
}

