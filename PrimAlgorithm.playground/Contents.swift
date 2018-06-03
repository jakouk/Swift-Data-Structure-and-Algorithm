//: Playground - noun: a place where people can play

import UIKit

public class MSTNode<T: Equatable & Hashable> {
  // 제너릭 변수, 방문 상태 정보, 참조값 저장용 변수 선언
  public var value: T
  public var edges: [MSTEdge<T>]
  public var visited: Bool
  
  // 초기화
  public init(value: T, edges:[MSTEdge<T>], visited: Bool) {
    self.value = value
    self.edges = edges
    self.visited = visited
  }
}

public class MSTEdge<T: Equatable & Hashable> : Equatable {
  public var from: MSTNode<T>
  public var to: MSTNode<T>
  public var weight: Double
  
  // 초기화
  public init(weight: Double, from: MSTNode<T>, to: MSTNode<T>) {
    self.weight = weight
    self.from = from
    self.to = to
    from.edges.append(self)
  }
}

public func == <T: Equatable> (lhs: MSTEdge<T>, rhs: MSTEdge<T>) -> Bool {
  guard lhs.from.value == rhs.from.value else {
    return false
  }
  guard lhs.to.value == rhs.to.value else {
    return false
  }
  return true
}

extension MSTEdge: Hashable {
  public var hashValue: Int {
    get {
      let stringHash = "\(from.value) -> \(to.value)"
      return stringHash.hashValue
    }
  }
}

public class MSTGraph<T: Hashable & Equatable> {
  public var nodes: [MSTNode<T>]
  public init(nodes: [MSTNode<T>]) {
    self.nodes = nodes
  }
  public static func minimumSpanningTree(startNode: MSTNode<T>, graph: MSTGraph<T>) {
    // 모서리 값을 처리하고 ( 아직은 방문하지 않은 노드의 ) 최솟값을
    // 선택하기 위해 방문 노드 관리용 배열을 사용한다.
    var visitedNodes: [MSTNode<T>] = []
    
    // 첫번째 노드를 출력하고 모서리 값을 처리하기 위해
    // visitedNodes 배열을 추가한다.
    print(startNode.value)
    visitedNodes.append(startNode)
    startNode.visited = true
    
    // 그래프의 모든 노드를 방문할 때 까지 반복함
    while visitedNodes.count < graph.nodes.count {
      // 가장먼저, ( 무한 반복을 피하기 위해)
      // 아직 방문하지 않은 모든 모서리를 추출
      var unvisitedEdges: [MSTEdge<T>] = []
      _ = visitedNodes.map { node -> () in
        let edges = node.edges.filter { edge -> Bool in
          edge.to.visited == false
        }
        unvisitedEdges.append(contentsOf: edges)
      }
      // 모서리 배열에서 가중치가 좀 더 작은 것을 선택 및
      // 출력하고 while 루프의 다음 순회 시에도 노드를 계속
      // 처리할 수 있도록 visitedNode 배열에 추가함
      if let minimumUnvisitedEdge = unvisitedEdges.sorted(by: {
        (edgeA, edgeB) -> Bool in
        edgeA.weight < edgeB.weight
      }).first {
        print("\(minimumUnvisitedEdge.from.value) <--------> \(minimumUnvisitedEdge.to.value)")
        minimumUnvisitedEdge.to.visited = true
        visitedNodes.append(minimumUnvisitedEdge.to)
      }
    }
  }
}

let nodeA = MSTNode(value: "A", edges: [], visited: false)
let nodeB = MSTNode(value: "B", edges: [], visited: false)
let nodeC = MSTNode(value: "C", edges: [], visited: false)
let nodeD = MSTNode(value: "D", edges: [], visited: false)

let edgeAB = MSTEdge(weight: 3, from: nodeA, to: nodeB)
let edgeBA = MSTEdge(weight: 3, from: nodeB, to: nodeA)
let edgeAC = MSTEdge(weight: 1, from: nodeA, to: nodeC)
let edgeCA = MSTEdge(weight: 1, from: nodeC, to: nodeA)
let edgeBC = MSTEdge(weight: 1, from: nodeB, to: nodeC)
let edgeCB = MSTEdge(weight: 1, from: nodeC, to: nodeB)
let edgeBD = MSTEdge(weight: 2, from: nodeB, to: nodeD)
let edgeDB = MSTEdge(weight: 2, from: nodeD, to: nodeB)

let graph = MSTGraph(nodes: [nodeA, nodeB, nodeC, nodeD])

MSTGraph.minimumSpanningTree(startNode: nodeA, graph: graph)
