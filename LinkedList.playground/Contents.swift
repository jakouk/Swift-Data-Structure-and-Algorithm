//: Playground - noun: a place where people can play

import UIKit

/*
  링크드 리스트
 
 Liked List는 순서대로 정렬된 세트의 일종으로서, 각각의 요소가 이전 요소와 연결 도ㅔ 있다는 특징이 있다.
 연결 목록은 요소로 구성된 세트를 지닌다는 점에서 배열과 유사한 데이터 구조다.
 
 Liked List는 Doubly Linked list와 Circular Linked list 두가지가 존제한다.
 
 Linked list의 메서드
 
 1. push(): 스택의 마지막 위치에 요소를 추가
 2. pop() : 스택의 첫번째 위치에 있는 요소를 제거한 뒤 반환
 3. peek(): 스택의 첫 번쨰 위치에 있는 요소를 제거하지 않고 반환
 4. isEmpty: 스택이 빈 경우 true를 그렇지 않은 경우 false를 반환
 
 1. count: 스택에 있는 요소의 수를 반환
 
 애플리케이션 새요
 
 데이터의 삽입과 삭제가 빈전하게 발생하는 경우, 데이터 규모가 무척 큰경우에 사용될수 있다.
 */

public struct StackList<T> {
  private var head: Node<T>? = nil
  private var _count: Int = 0
  public init() {}
  
  public mutating func push(element: T) {
    let node = Node<T>(data: element)
    node.next = head
    head = node
    _count += 1
  }
  
  public mutating func pop() -> T? {
    if isEmpty() {
      return nil
    }
    let item = head?.data
    head = head?.next
    _count -= 1
    return item
  }
  
  public func peek() -> T? {
    return head?.data
  }
  
  public func isEmpty() -> Bool {
    return count == 0
  }
  
  public var count: Int {
    return _count
  }
}

private class Node<T> {
  fileprivate var next: Node<T>?
  fileprivate var data: T
  init(data: T) {
    next = nil
    self.data = data
  }
}

extension StackList: CustomStringConvertible, CustomDebugStringConvertible {
  public var description: String {
    var d = "["
    var lastNode = head
    while lastNode != nil {
      d = d + "\(lastNode?.data)"
      lastNode = lastNode?.next
      if lastNode != nil {
        d = d + ","
      }
    }
    d = d + "]"
    return d
  }
  
  public var debugDescription: String {
    var d = "["
    var lastNode = head
    while lastNode != nil {
      d = d + "\(lastNode?.data)"
      lastNode = lastNode?.next
      if lastNode != nil {
        d = d + ","
      }
    }
    d = d + "]"
    return d
  }
}

extension StackList: ExpressibleByArrayLiteral {
  public init(arrayLiteral elements: T...) {
    for el in elements {
      push(element: el)
    }
  }
}

public struct NodeIterator<T>: IteratorProtocol {
  public typealias Element = T
  private var head: Node<Element>?
  fileprivate init(head: Node<T>?) {
    self.head = head
  }
  
  mutating public func next() -> T? {
    if (head != nil ) {
      let item = head!.data
      head = head!.next
      return item
    }
    return nil
  }
}

extension StackList: Sequence {
  public typealias Iterator = NodeIterator<T>
  public func makeIterator() -> NodeIterator<T> {
    return NodeIterator<T>(head: head)
  }
  
  public init<S: Sequence>(_ s: S) where S.Iterator.Element == T {
    for el in s {
      push(element: el)
    }
  }
}
