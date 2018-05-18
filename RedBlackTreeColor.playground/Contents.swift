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
}
