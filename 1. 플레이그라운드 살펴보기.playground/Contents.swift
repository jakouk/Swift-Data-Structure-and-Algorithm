//: Playground - noun: a place where people can play

import UIKit

 /*
 
 인접 데이터 구조 ( Contiguous data structure )
  데이터를 메모리 영역 중 인접한 부분에 저장한다. 인접 데이터 구조에는 배열, 힙, 메트립스, 해시 테이블 등이 있다.
 
 연결 데이터 구조 ( Linked data structure )
  서로 명확히 구분되는 메모리 영역을 차지하되, 포인터라는 주소체계로 연결, 관리되는 구조이다. 목록, 트리, 그래프 등이 있다.
 
 배열
  Array<Type> , [Type]으로 배열을 선언한다.
 
 */

// var myIntArray: Array<Int> = [1,3,5,7,9]
 var myIntArray: [Int] = [1,3,5,7,9]
 var my2DArray: [[Int]] = [[1,2],[10,11],[20,30]]
 var someSubset = myIntArray[2...4]
