//: Playground - noun: a place where people can play

import UIKit

/*
  큐는 먼저 입력된 데이터가 먼저 출력되는 FIFO ( First In First Out) 데이터 구조를 나타낸다.
 큐는 다음의 7가지 임무를 수행한다.
 1. enqueue(): 큐의 맨 뒤에 새로운 요소를 추가한다.
 2. dequeue(): 큐에서 첫번째 요소를 제거한 뒤 반환
 3. peek(): 큐의 첫번쨰 요소를 반환하되, 제거하지는 않음
 4. clear(): 큐를 재설정해 빈 상태가 되게함
 5. count: 큐에 있는 요소의 수를 반환
 6. isEmpty(): 큐가 비어있으면 true를 반환, 그렇지 않으면 false를 반환
 7. isFull(): 큐가 꽉 차있으면 true를 반환 그렇지 않은 경우 false를 반환
 
 도움을 주는 도우미 메서드
 1. capacity: 큐 용량을 가져오거나 설정하기 위한 read/write 프로퍼티
 2. insert(_:atIndex): 큐의 특정 인덱스 위치에 요소를 삽입
 3. removeAtIndex(_): 큐의 특정 인덱스 위치에 있는 요소를 제거
 
 큐는 음식점에서 주문 및 계산에 사용하는 POS 시스템이 대표적이다.
 */

public struct Queue<T> {
  private var data = [T]()
  public init() { }
  public mutating func dequeue() -> T? {
    return data.removeFirst()
  }
  
  public mutating func peek() -> T? {
    return data.first
  }
  
  public mutating func enqueue(element: T) {
    data.append(element)
  }
  
  public mutating func clear() {
    data.removeAll()
  }
  
  public var count: Int {
    return data.count
  }
  
  public var capacity: Int {
    get {
      return data.capacity
    }
    set {
      data.reserveCapacity(newValue)
    }
  }
  
  public func isFull() -> Bool {
    return count == data.capacity
  }
  
  public func isEmpty() -> Bool {
    return data.isEmpty
  }
}

extension Queue: CustomStringConvertible, CustomDebugStringConvertible {
  public var description: String {
    return data.description
  }
  
  public var debugDescription: String {
    return data.debugDescription
  }
}

//extension Queue: ExpressibleByArrayLiteral {
//  public init(arrayLiteral elements: T...) {
//    self.init(elements)
//  }
//}
//
//extension Queue: Sequence {
//  public func generate() -> AnyIterator<T> {
//    AnyIterator(IndexingIterator(_elements: data.lazy))
//  }
//}


