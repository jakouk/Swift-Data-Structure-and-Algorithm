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

public class DijkstraGraph<T: Hashable & Equatable> {
  public var nodes: [DijkstraNode<T>]
  public init(nodes: [DijkstraNode<T>]) {
    self.nodes = nodes
  }
  
  public static func dijkstraPath(startNode: DijkstraNode<T>, graph: DijkstraGraph<T>, finishNode: DijkstraNode<T>) {
    // 모든 미방문 노드를 저장하기 위한 세트를 생성
    var unvisitedNodes = Set<DijkstraNode<T>>(graph.nodes)
    
    // 방문 표식을 남기고 임시 거리롤 0을 입력
    startNode.distance = 0
    
    // 현재 노드를 할당
    var currentNode: DijkstraNode<T> = startNode
    
    // 마지막 노드를 방문할 때 까지 반복함
    while (finishNode.visited == false) {
      
      // 각각의 미방문 이웃에 대해, 현재 노드와의 거리를 계산
      for edge in currentNode.edges.filter({ edge -> Bool in
        return edge.to.visited == false
      }) {
        
        // 현재 노드와 그 이웃 노드의 임시 거리를 계산
        let temporaryDistance = currentNode.distance + Int(edge.weight)
        
        // 임시 거리가 현재 이웃과의 거리보다 작으면,
        // 임시거리로 업데이트함
        if edge.to.distance > temporaryDistance {
          edge.to.distance = temporaryDistance
          edge.to.previous = currentNode
        }
      }
      
      // 노드에 방문 표식을 남김
      currentNode.visited = true
      
      // 미방문 노드세트에서 현재 노드를 삭제
      unvisitedNodes.remove(currentNode)
      if let newCurrent = unvisitedNodes.sorted(by: { (nodeA, nodeB) -> Bool in
        nodeA.distance < nodeB.distance
      }).first {
        currentNode = newCurrent
      } else {
        break
      }
    }
    DijkstraGraph.printShortestPath(node: finishNode)
  }
  
  public static func printShortestPath(node: DijkstraNode<T>) {
    if let previous = node.previous {
      DijkstraGraph.printShortestPath(node: previous)
    } else {
      print("Shortest path:")
    }
    print("->\(node.value)", terminator: "")
  }
}

let nodeA = DijkstraNode(value: "A", edges: [], visited: false)
let nodeB = DijkstraNode(value: "B", edges: [], visited: false)
let nodeC = DijkstraNode(value: "C", edges: [], visited: false)
let nodeD = DijkstraNode(value: "D", edges: [], visited: false)
let nodeE = DijkstraNode(value: "E", edges: [], visited: false)

let edgeAB = DijkstraEdge(weight: 3, from: nodeA, to: nodeB)
let edgeBA = DijkstraEdge(weight: 3, from: nodeB, to: nodeA)
let edgeAC = DijkstraEdge(weight: 1, from: nodeA, to: nodeC)
let edgeCA = DijkstraEdge(weight: 1, from: nodeC, to: nodeA)
let edgeBC = DijkstraEdge(weight: 1, from: nodeB, to: nodeC)
let edgeCB = DijkstraEdge(weight: 1, from: nodeC, to: nodeB)
let edgeBD = DijkstraEdge(weight: 2, from: nodeB, to: nodeD)
let edgeDB = DijkstraEdge(weight: 2, from: nodeD, to: nodeB)
let edgeDE = DijkstraEdge(weight: 1, from: nodeD, to: nodeE)
let edgeED = DijkstraEdge(weight: 1, from: nodeE, to: nodeD)
let edgeCE = DijkstraEdge(weight: 8, from: nodeC, to: nodeE)
let edgeEC = DijkstraEdge(weight: 8, from: nodeE, to: nodeC)

let graph = DijkstraGraph(nodes: [nodeA, nodeB, nodeC, nodeD, nodeE])
DijkstraGraph.dijkstraPath(startNode: nodeA, graph: graph, finishNode: nodeE)



