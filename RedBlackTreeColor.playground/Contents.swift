//: Playground - noun: a place where people can play

import UIKit

public enum RedBlackTreeColor: Int {
  case red = 0
  case black = 1
}

public class RedBlackTreeNode<T:Comparable> {
  public var value: T
  public var leftChild: RedBlackTreeNode?
  public var rightChild: RedBlackTreeNode?
  public weak var parent: RedBlackTreeNode?
  public var color: RedBlackTreeColor
  
  public convenience init(value: T) {
    self.init(value: value, left: nil, right: nil, parent: nil, color: RedBlackTreeColor.black)
  }
  
  public init(value:T, left:RedBlackTreeNode?, right:RedBlackTreeNode?,
    parent:RedBlackTreeNode?, color:RedBlackTreeColor) {
    self.value = value
    self.color = color
    self.leftChild = left
    self.rightChild = right
    self.parent = parent
  }
  
  public func grandParentNode() -> RedBlackTreeNode? {
    guard let grandParent = self.grandParentNode() else {
      return nil
    }
    
    if parent === grandParent.leftChild {
      return grandParent.rightChild
    } else {
      return grandParent.leftChild
    }
  }
  
  public static func printTree(nodes:[RedBlackTreeNode]) {
    var children:[RedBlackTreeNode] = Array()
    for node:RedBlackTreeNode in nodes {
      print("\(node.value)" + " " + "\(node.color)")
      if let leftchild = node.leftChild {
        children.append(leftchild)
      }
      if let rightChild = node.rightChild {
        children.append(rightChild)
      }
    }
    if children.count > 0 {
      printTree(nodes: children)
    }
  }
  
  // 오른쪽 회전
  public func rotateRight() {
    guard let parent = parent else {
      return
    }
    
    let grandParent = parent.parent
    let newRightChildsLeftChild = self.rightChild
    var wasLeftChild = false
    if parent === grandParent?.leftChild {
      wasLeftChild = true
    }
    
    self.rightChild = parent
    self.rightChild?.parent = self
    
    self.parent = grandParent
    if wasLeftChild {
      grandParent?.leftChild = self
    } else {
      grandParent?.rightChild = self
    }
    
    self.rightChild?.leftChild = newRightChildsLeftChild
    self.rightChild?.leftChild?.parent = self.rightChild
  }
  
  // 왼쪽 회전
  public func rotationLeft() {
    guard let parent = parent else {
      return
    }
    
    let grandParant = parent.parent
    let newLeftChildsRightChild = self.leftChild
    var wasLeftChild = false
    if parent === grandParant?.leftChild {
      wasLeftChild = true
    }
    
    self.leftChild = parent
    self.leftChild?.parent = self
    
    self.parent = grandParant
    if wasLeftChild {
      grandParant?.leftChild = self
    } else {
      grandParant?.rightChild = self
    }
    
    self.leftChild?.rightChild = newLeftChildsRightChild
    self.leftChild?.rightChild?.parent = self.leftChild
  }
  
  public func insertNodeFromRoot(value: T) {
    // 이진 검색 트리의 속성을 유지하기 위해
    
    if let _ = self.parent {
      print("You can only add new nodes from the root node of the tree")
      return
    }
    self.addNode(value: value)
  }
  
  private func addNode(value: T) {
    if value < self.value {
      if let leftChild = leftChild {
        leftChild.addNode(value: value)
      } else {
        let newNode = RedBlackTreeNode(value: value)
        newNode.parent = self
        newNode.color = RedBlackTreeColor.red
        leftChild = newNode
        insertionReviewStep1(node: newNode)
      }
    } else {
      if let rightChild = rightChild {
        rightChild.addNode(value: value)
      } else {
        let newNode = RedBlackTreeNode(value: value)
        newNode.parent = self
        newNode.color = RedBlackTreeColor.red
        rightChild = newNode
        insertionReviewStep1(node: newNode)
      }
    }
  }
  
  private func insertionReviewStep1(node: RedBlackTreeNode) {
    if let _ = node.parent {
      insertionReviewStep2(node: node)
    } else {
      node.color = .black
    }
  }
  
  private func insertionReviewStep2(node: RedBlackTreeNode) {
    
  }
}
