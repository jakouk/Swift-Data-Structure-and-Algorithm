//: Playground - noun: a place where people can play

import UIKit

public class BinaryTreeNode<T: Comparable> {
  // Value와 자식 변수
  public var value: T
  public var leftChild: BinaryTreeNode?
  public var rightChild: BinaryTreeNode?
  public var parent: BinaryTreeNode?
  
  // 초기화
  public convenience init(value:T) {
    self.init(value: value, left: nil, right: nil, parent: nil)
  }
  
  public init(value: T, left: BinaryTreeNode?, right: BinaryTreeNode?, parent: BinaryTreeNode? ) {
    self.value = value
    self.leftChild = left
    self.rightChild = right
    self.parent = parent
  }
  
  public class func depthFirstSearch(node: BinaryTreeNode?) {
    // Nil인 잎에 도달하면 재귀적인 호출을 중지함
    guard let node = node else {
      return
    }
    BinaryTreeNode.depthFirstSearch(node: node.leftChild)
    print(node.value)
    BinaryTreeNode.depthFirstSearch(node: node.rightChild)
  }
}
