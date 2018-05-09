//: Playground - noun: a place where people can play

import UIKit

func quickSort<T: Comparable>(_ list: inout [T], lo: Int, hi: Int) {
  if lo < hi {
    let pivot = partition(&list, lo: lo, hi: hi)
    
    quickSort(&list, lo: lo, hi: pivot - 1)
    quickSort(&list, lo: pivot + 1, hi: hi)
  }
}

func partition<T: Comparable>(_ list: inout [T], lo: Int, hi: Int) -> Int {
  let pivot = list[hi]
  var i = lo
  
  for j in lo..<hi {
    if list[j] <= pivot {
      list.swapAt(i, j)
      i += 1
    }
  }
  list.swapAt(i, hi)
  return i
}

var list = [3, 5, 1, 2 ,7, 9, 4]

print(quickSort(&list, lo: 0, hi: 6))


