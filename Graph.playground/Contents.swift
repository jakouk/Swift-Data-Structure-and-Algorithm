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

public struct Vertex<T: Equatable>: Equatable {
  public var data: T
  public let index: Int
  
  public static func == (lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
    guard lhs.data == rhs.data else {
      return false
    }
    return true
  }
}

public struct Edge<T: Equatable>: Equatable {
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


