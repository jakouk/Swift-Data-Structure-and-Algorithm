//: Playground - noun: a place where people can play

import UIKit

/*
  이진 트리
 
 이진 트리는 최대 두 개의 자신 노드를 지닐 수 있는 트리 데이터 구조다.
 
 풀 이진 트리 : 트리 내의 특정 노드가 있을 때, 노드가 0 혹은 2개의 자식 노드를 지닌다.
 페펙트 이진 트리 : 모든 내부 노드는 두 개의 자식 노드를 지니며, 모든 잎은 동일한 깊이를 지닌다.
 컴플리트 이진 트리: 마지막 레벨을 제외한 모든 레벨이 노드로 완전하게 찬 상태다. 트리의 좌측 방향으로 뻗어나간
  마지막 레벨은 완전하게 채워질수 없다.
 균형 이진 트리: 잎 노드까지 이어지기 위한 최소한의 높이만을 지닌다.
 
 트리의 기본
 
 왼쪽 서브트리에 있는 모든 노드 L에서 L.value <= P.value
 오른쪽 서브트리에 있는 모든 노드 R에서 R.value >= P.value
 */

public class BinaryTreeNode<T:Comparable> {
  public var value: T
  public var leftChild:BinaryTreeNode?
  public var rightChild:BinaryTreeNode?
  public weak var parent:BinaryTreeNode?
  
  public convenience init(value: T) {
    self.init(value: value, left: nil, right: nil, parent: nil)
  }
  
  public init(value: T, left: BinaryTreeNode?, right: BinaryTreeNode?,
              parent: BinaryTreeNode?) {
    self.value = value
    self.leftChild = left
    self.rightChild = right
    self.parent = parent
  }
  
  public func inserNodeFromRoot(value: T) {
    // 이진 검색 트리의 프로퍼티를 유지하기 위해서는
    // 반드시 루트 노드에서부터 insertNode 작업이 실행되야함.
    
    if let _ = self.parent {
      // 부모 노드가 있다면 트리의 루트 노드가 아님
      print("You can only add new nodes from the root node of the tree")
      return
    }
    self.addNode(value: value)
  }
  
  private func addNode(value: T) {
    if value < self.value {
      // value가 로트 키값보다 작은 경우: 좌측 서브트리에 삽입
      // 노드가 존재하는 경우 좌츨 서브트리에 삽입하고,
      // 노드가 없는 경우 새로운 노드를 만들어서 좌측 자식 노드로 삽입
      if let leftChild = leftChild {
        leftChild.addNode(value: value)
      } else {
        let newNode = BinaryTreeNode(value: value)
        newNode.parent = self
        leftChild = newNode
      }
    } else {
      if let rightChild = rightChild {
        rightChild.addNode(value: value)
      } else {
        let newNode = BinaryTreeNode(value: value)
        newNode.parent = self
        rightChild = newNode
      }
    }
  }
  
  /*
   순회 방식
   
   인오더 트리 워크
    말 그래로 오름차순으로 정렬된 트리 노드의 값이 목록으로 반환된다.
   
   먼저 좌측 서브트리로 시작해서 루트 노드값을 확인한 뒤 우측 서브트리를 순회한다.
   이진 검색 트리 혹은 BST의 노드값 크기는 다음 순서가 된다.
   
   좌측값 < 루트 노드값 < 우측 값
  */
  public class func traverseInOrder(node: BinaryTreeNode?) {
    guard let node = node else {
      return
    }
    BinaryTreeNode.traverseInOrder(node: node.leftChild)
    print(node.value)
    BinaryTreeNode.traverseInOrder(node: node.rightChild)
  }
  
  public class func traversePreOrder(node: BinaryTreeNode?) {
    guard let node = node else {
      return
    }
    print(node.value)
    BinaryTreeNode.traversePreOrder(node: node.leftChild)
    BinaryTreeNode.traversePreOrder(node: node.rightChild)
  }
  
  public class func traversePostOrder(node: BinaryTreeNode?) {
    guard let node = node else {
      return
    }
    BinaryTreeNode.traversePostOrder(node: node.leftChild)
    BinaryTreeNode.traversePostOrder(node: node.rightChild)
    print(node.value)
  }
}

let rootNode = BinaryTreeNode(value: 10)
rootNode.inserNodeFromRoot(value: 20)
rootNode.inserNodeFromRoot(value: 5)
rootNode.inserNodeFromRoot(value: 21)
rootNode.inserNodeFromRoot(value: 8)
rootNode.inserNodeFromRoot(value: 4)

BinaryTreeNode.traverseInOrder(node: rootNode)

