//: Playground - noun: a place where people can play

import UIKit

public class DijkstraNode<T: Equatable & Hashable>: Equatable {
  // 제네릭값, 방문 상태, 참조값 변수 선언
  public var value: T
  public var edges: [DijkstraEdge<T>]
  public var visited: Bool
  // 출발 지점에서 현재 노드에 이르는 최단거리
  public var distance: Int = Int.max
  // 최단 경로에 이르는 기존의 노드
  public var previous: DijkstraNode<T>?
  // 초기화
  public init(value: T, edges: [DijkstraEdge<T>], visited: Bool) {
    self.value = value
    self.edges = edges
    self.visited = visited
  }
}

public func == <T: Equatable> (lhs: DijkstraNode<T>, rhs: DijkstraNode<T>) -> Bool {
  guard lhs.value == rhs.value else {
    return false
  }
  return true
}

extension DijkstraNode: Hashable {
  public var hashValue: Int {
    get {
      return value.hashValue
    }
  }
}

public class DijkstraEdge<T: Equatable & Hashable>: Equatable {
  public var from: DijkstraNode<T>
  public var to: DijkstraNode<T>
  public var weight: Double
  // 초기화
  public init(weight: Double, from: DijkstraNode<T>, to: DijkstraNode<T>) {
    self.weight = weight
    self.from = from
    self.to = to
    from.edges.append(self)
  }
}

public func == <T: Equatable> (lhs: DijkstraEdge<T>, rhs: DijkstraEdge<T>) -> Bool {
  guard lhs.from.value == rhs.from.value else {
    return false
  }
  guard lhs.to.value == rhs.to.value else {
    return false
  }
  return true
}

extension DijkstraEdge: Hashable {
  public var hashValue: Int {
    get {
      let stringHash = "\(from.value) -> \(to.value)"
      return stringHash.hashValue
    }
  }
}
