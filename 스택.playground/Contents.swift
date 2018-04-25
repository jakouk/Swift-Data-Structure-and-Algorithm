//: Playground - noun: a place where people can play

import UIKit

/*
  스택은 나중에 입력된 것이 먼저 출력되는 LIFO 데이터 구조를 나타낸다.
 
  스택의 메소드
 1. push(): 스택의 하단에 요소를 차가
 2. pop(): 스택 상단의 요소를 꺼내서 ( 삭제한 뒤 ) 반환
 3. peek: 스택 상단의 요소를 꺼내서 ( 삭제하지 않고 ) 반환
 
 4. count: 스택에 포함된 요소의 수를 반환
 5. isEmpty(): 스택에 포함된 요수가 없는 경우 true, 그렇지 않은 경우 false
 6. isFull() 스택에 포함될 요소의 수가 결정돼 있는경우, 스택이 꽉 찼으면 true, 그렇지 않으면 false 반환
 
 스택을 활용한 가장 대표적인 애플리케이션은
 1. 표현식( expression ) 평가
 2. 표현식 문법 파싱
 3. 정수형 데이터의 이진수 변환
 4. 역추적 알고리즘
 5. 보편적인 디자인 패턴을 활용한 실행 취소/ 재실행
 */

public struct Stack<T> {
  private var elements = [T]()
  public init() {}
  public init<S: Sequence>(_ s: S) where S.Iterator.Element == T {
    self.elements = Array(s.reversed())
  }
  
  public mutating func pop() -> T? {
    return self.elements.popLast()
  }
  
  public mutating func push(element: T) {
    self.elements.append(element)
  }
  
  public func peek() -> T? {
    return self.elements.last
  }
  
  public var isEmpty: Bool {
    return self.elements.isEmpty
  }
  
  public var count: Int {
    return self.elements.count
  }
}

var myStack = Stack<Int>()

myStack.push(element: 5)
myStack.push(element: 44)
myStack.push(element: 23)

var x = myStack.pop()
x = myStack.pop()
x = myStack.pop()
x = myStack.pop()



extension Stack: CustomStringConvertible, CustomDebugStringConvertible {
  public var description: String {
    return self.elements.description
  }
  
  public var debugDescription: String {
   return self.elements.debugDescription
  }
}

extension Stack: ExpressibleByArrayLiteral {
  public init(arrayLiteral elements: T...) {
    self.init(elements)
  }
}

public struct ArrayIterator<T>: IteratorProtocol {
  var currentElement: [T]
  init(elements: [T]) {
    self.currentElement = elements
  }
  
  mutating public func next() -> T? {
    if (!self.currentElement.isEmpty) {
      return self.currentElement.popLast()
    }
    return nil
  }
}

extension Stack: Sequence {
//  public func makeIterator() -> ArrayIterator<T> {
//    return ArrayIterator<T>(elements: self.elements)
//  }
  
  public func makeIterator() -> AnyIterator<T> {
    return AnyIterator(IndexingIterator(_elements: self.elements.lazy.reversed()))
  }
}












