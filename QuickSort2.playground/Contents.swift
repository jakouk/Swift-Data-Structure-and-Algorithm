//: Playground - noun: a place where people can play

import UIKit

func quicksort<T: Comparable>(_ list: inout [T], lo: Int, hi: Int) {
  
  if lo < hi {
    let pivot = partition(&list, lo: lo, hi: hi)
    
    quicksort(&list, lo: lo, hi: pivot)
    quicksort(&list, lo: pivot + 1, hi: hi)
  }
}

private func partition<T: Comparable>(_ list: inout[T], lo: Int, hi: Int) -> Int {
  let pivot = list[lo]
  var i = lo  - 1
  var j = hi + 1
  
  while true {
    i += 1
    while list[i] < pivot { i += 1 }
    j -= 1
    while list[j] > pivot { j -= 1}
    if i >= j {
      return j
    }
    list.swapAt(i, j)
  }
}

var list = [ 9, 4, 8, 7, 6, 5, 3, 2, 1]
quicksort(&list, lo: 0, hi: 8)
print()
