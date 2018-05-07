//: Playground - noun: a place where people can play

import UIKit

/*
 삽입정렬 알고리즘
 */

public func insertionSort<T: Comparable>(_ list: inout [T]) {
  
  if list.count <= 1 {
    return
  }
  
  for i in 1..<list.count {
    let x = list[i]
    var j = i
    
    while j > 0 && list[j - 1] > x {
      list[j] = list[j-1]
      j -= 1
    }
    list[j] = x
  }
}

var list = [5, 3, 4, 9, 1, 7]

insertionSort(&list)


