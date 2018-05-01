//: Playground - noun: a place where people can play

import UIKit

/*
  Priority Queue
 
 우선순위 큐는 보통의 큐와 비슷하지만, 각각의 요소가 우선순위 값을 지니고 있다는 점이 다르다.
 더 높은 우선순위를 지닌 요소가 낮은 순위 요소보다 먼저 큐에서 빠져나와 출력된다.
 
 Priority Queue는 제너릭 우선순위 큐데이터 구조를 이용해서 순수하게 스위프트 버전으로 구현했다.
 
 priority queue는 다음과 같은 네개의 메소드와 두개의 프로퍼티로 구현한다.
 
 1. push(): O(logn)의 수선순위 큐를 추가함
 2. pop(): 큐에서 가장 높은 순위의 요소(하강순서인 경우 가장 낮은 순위의 요소)를 제거하고 반환하거나,
  큐가 빈 경우 nil을 반환
 3. peek(): 큐에서 가장 높은 순위의 요소(하강순서인 경우 가장 낮은 순위의 요소)를 반환하거나,
  큐가 빈 경우 nil을 반환
 4. clear(): 우선순위 큐를 빈 상태로 재설정함
 
 1. count: 우선순위 큐에 있는 요소의 수를 반환
 2. isEmpty: 우선순위 큐가 비어있는 경우 true를, 그렇지 않은 경우 false를 반환
 
 애플리케이션 개요
  우선순위큐는 큐에 놓인 데이터의 처리 순서를 조절 해야 할 때 특히 유용하다.
  유명 알고리즘 사운데 상당수가 우선순위 큐 방식을 사용한다.
 
 최선/최초 검색 알고리즘 ( Best-first searh algorithm): A 검색 알고리즘과 같이 가중치가 적용된 그래프에
  있는 두 개의 노드 중 최단 거리를 찾는 데 확용하며, 우선순위 큐는 미탐험 경로를 추적할 때 사용된다.
 
 프림 알고리즘 ( prim alforithm ): 가중치가 적용된 비지도학습 그래프에서 폭이 최소인 트리를 찾는데 활용된다.
 */

/// 자체 주석 : PriorityQueuen 자체가 힙구조로 만들어져 있다.
public struct PriorityQueue<T: Comparable> {
  private var heap = [T]()
  private let ordered: (T, T) -> Bool
  public init(ascending: Bool = false, startingValues: [T] = [] ) {
    if ascending {
      ordered = { $0 > $1 }
    } else {
      ordered = { $0 < $1 }
    }
    
    heap = startingValues
    var i = heap.count / 2 - 1
    while i >= 0 {
      sink(i)
      i -= 1
    }
  }
  
  public var count: Int { return heap.count }
  public var isEmpty: Bool { return heap.isEmpty }
  
  public mutating func push(_ element: T) {
    heap.append(element)
    swim(heap.count - 1)
  }
  
  public mutating func pop() -> T? {
    if heap.isEmpty { return nil }
    if heap.count == 1 { return heap.removeFirst() }
    
    heap.swapAt(0, heap.count - 1)
    let temp = heap.removeLast()
    sink(0)
    return temp
  }
  
  public mutating func remove(_ item: T) {
    if let index = heap.index(of: item) {
      heap.swapAt(index, heap.count - 1)
      heap.removeLast()
      swim(index)
      sink(index)
    }
  }
  
  public mutating func removeAll(_ item: T) {
    var lastCount = heap.count
    remove(item)
    while (heap.count < lastCount) {
      lastCount = heap.count
      remove(item)
    }
  }
  
  public func peek() -> T? {
    return heap.first
  }
  
  public mutating func clear() {
    heap.removeAll(keepingCapacity: false)
  }
  
  private mutating func sink(_ index: Int) {
    var index = index
    while 2 * index + 1 < heap.count {
      var j = 2 * index + 1
      if j < (heap.count - 1) && ordered(heap[j], heap[j+1]) { j += 1 }
      if !ordered(heap[index], heap[j]) { break }
      heap.swapAt(index, j)
      index = j
    }
  }
  
  private mutating func swim(_ index: Int) {
    var index = index
    while index > 0 && ordered(heap[(index - 1) / 2], heap[index] ) {
      heap.swapAt((index - 1) / 2, index)
      index = (index - 1) / 2
    }
  }
}

var priorityQueue = PriorityQueue<String>(ascending: true)
priorityQueue = PriorityQueue<String>(ascending: true, startingValues:
 ["Coldplay", "OneRepublic", "Maroon 5", "Imagine Dragons", "The Script"])

var x = priorityQueue.pop()
print("x = \(String(describing: x))")
x = priorityQueue.pop()
print("x = \(String(describing: x))")







