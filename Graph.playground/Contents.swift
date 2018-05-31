//: Playground - noun: a place where people can play

import UIKit

/*
  그래프 이론
 
 그래프는 다음 요소로 구성된다
 1. 꼭지점들의 모음
 2. 모서리들의 모음
 
 그래프의 종류
 
 1. 무방향성 그래프
 2. 방향성 그래프
 3. 가중치 그래프
 
 그래프 표현 방식
 
 객체지향 접근법: 구조체와 클래스 활용
 
 리방법은 O(n+m)의 공간을 차지하는데, 이때 m은 꼭지점의 수, n은 모서리의 수를 나타낸다.
 일반적인 처리 작업을 마치기 위해서는 선형 데이터 구조의 처리 시간과 같은 O(m)의 시간이 소요되며, 이는
 데이터 처리를 위해 모든 구조체와 클래스 목록을 일일이 확인해야 하기 때문이다.
 
 이웃 목록
 
  이웃 목록은 모든 꼬지점을 포함하며, 각각의 이웃 목록에는 그에 연결된 꼬지점 목록이 포함된다. 다음과 같은 그래프를 살펴보자
 위 방법을 이요하면 하나의 꼬지점이 다른 것과 서로 연결돼 있는지 여부를 즉각적으로 알 수 있으며, 모든 요소가 아닌,
 해당 목록만 확인하면 된다.
 
 이웃 메트릭스
 
 이웃 매트릭스는 특정 모서리의 존재 여부를 확인하는 데 특히 유용 하지만 이웃 목록에 비해 좀 더 많은 저장 공간을 차지한다.
 꼭지점을 열과 행으로 하는 매트릭스 또는 행렬을 만든다. 두 개의 꼭지점을 연결하는 모서리가 있다면, 행렬쌍의 값으로 1을
 입력하고, 그렇지 않다면 0을 입력한다. 
 
 */

public struct Vertex<T: Equatable & Hashable>: Equatable {
  public var data: T
  public let index: Int
  
  public static func == (lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
    guard lhs.data == rhs.data else {
      return false
    }
    return true
  }
}

extension Vertex: Hashable {
  public var hashValue: Int {
    get {
      return "\(index)".hashValue
    }
  }
}

public struct Edge<T: Equatable & Hashable>: Equatable {
  public let from: Vertex<T>
  public let to: Vertex<T>
  
  public static func == (lhs: Edge<T>, rhs: Edge<T>) -> Bool {
    guard lhs.from == rhs.from else {
      return false
    }
    guard lhs.to == rhs.to else {
      return false
    }
    return true
  }
}

extension Edge: Hashable {
  public var hashValue: Int {
    get {
      let stringHash = "\(from.index) -> \(to.index)"
      return stringHash.hashValue
    }
  }
}

// 이웃 목록

public struct VertexEdgesList<T: Equatable & Hashable> {
  // 각각의 VertexEdgeList에 해당 꼭지점과 그에 연결된 또다른
  // 꼭지점의 정보를 담고 있는 모서리 배열 데이터가 포함된다.
  public let vertex: Vertex<T>
  public var edges:[Edge<T>] = []
  public init(vertex: Vertex<T>) {
    self.vertex = vertex
  }
  
  public mutating func addEdge(edge: Edge<T>) {
    // Check if the edge exists
    if self.edges.count > 0 {
      let equalEdges = self.edges.filter {
        existingEdge in
        return existingEdge == edge
      }
      if equalEdges.count > 0 {
        return
      }
    }
    self.edges.append(edge)
  }
}

public struct AdjacencyListGraph<T: Equatable & Hashable> {
  public var adjacencyLists: [VertexEdgesList<T>] = []
  public var vertices:[Vertex<T>] {
    get  {
      var vertices = [Vertex<T>]()
      for list in adjacencyLists {
        vertices.append(list.vertex)
      }
      return vertices
    }
  }
  
  public var edges:[Edge<T>] {
    get {
      var edges = Set<Edge<T>>()
      for list in adjacencyLists {
        for edge in list.edges {
          edges.insert(edge)
        }
      }
      return Array(edges)
    }
  }
  public init() {}
  
  public mutating func addVertext(data: T) -> Vertex<T> {
    // 꼭지점이 있는지 확인함
    for list in adjacencyLists {
      if list.vertex.data == data {
        return list.vertex
      }
    }
    // 꼭지점을 생성한 뒤 그래프를 업데이트하고 반환함
    let vertex: Vertex<T> = Vertex(data: data, index: adjacencyLists.count)
    let adjacencyList = VertexEdgesList(vertex: vertex)
    adjacencyLists.append(adjacencyList)
    return vertex
  }
  
  public mutating func addEdge(from: Vertex<T>, to: Vertex<T>) -> Edge<T> {
    let edge = Edge(from: from, to: to)
    let list = adjacencyLists[from.index]
    // 모서리가 있는지 확인함
    if list.edges.count > 0 {
      for existingEdge in list.edges {
        if existingEdge == edge {
          return existingEdge
        }
      }
      adjacencyLists[from.index].edges.append(edge)
    } else {
      adjacencyLists[from.index].edges = [edge]
    }
    return edge
  }
}


// 이웃 목록 그래프 생성
var adjacencyList:AdjacencyListGraph<String> = AdjacencyListGraph<String>()

// 꼭지점 추가
let vertexA = adjacencyList.addVertext(data: "A")
let vertexB = adjacencyList.addVertext(data: "B")
let vertexC = adjacencyList.addVertext(data: "C")
let vertexD = adjacencyList.addVertext(data: "D")

// 모서리 추가
let edgeAB = adjacencyList.addEdge(from: vertexA, to: vertexB)
let edgeBC = adjacencyList.addEdge(from: vertexB, to: vertexC)
let edgeCD = adjacencyList.addEdge(from: vertexC, to: vertexD)

// 이웃 목록 출력
print(adjacencyList)
