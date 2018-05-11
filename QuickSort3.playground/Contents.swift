//: Playground - noun: a place where people can play

import UIKit

public func quickSort<T: Comparable>(_ list: inout [T], lo: Int, hi: Int) {
  
  if lo < hi {
    let median = getMedianOfThree(&list, lo: lo, hi: hi)
    let pivot = partition(&list, lo: lo, hi: hi, median: median)
    
    quickSort(&list, lo: lo, hi: pivot)
    quickSort(&list, lo: pivot + 1, hi: hi)
  }
}

private func getMedianOfThree<T: Comparable>(_ list: inout [T], lo: Int, hi: Int) -> T {
  let center = lo + (hi - lo) / 2
  if list[lo] > list[center] {
    list.swapAt(lo, center)
  }
  
  if list[lo] > list[hi] {
    list.swapAt(lo, hi)
  }
  
  if list[center] > list[hi] {
    list.swapAt(center, hi)
  }
  
  return list[hi]
}

private func partition<T: Comparable>(_ list: inout[T], lo: Int, hi: Int, median: T) -> Int {
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
