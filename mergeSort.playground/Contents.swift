//: Playground - noun: a place where people can play

import UIKit

public func mergeSort<T: Comparable>(_ list: [T]) -> [T] {
  
  if list.count < 2 {
    return list
  }
  
  let center = list.count / 2
  return merge(mergeSort([T](list[0..<center])), rightHalf: mergeSort([T](list[center..<list.count])))
}

private func merge<T: Comparable>(_ leftHalf: [T], rightHalf: [T]) -> [T] {
  var leftIndex = 0
  var rightIndex = 0
  var tmpList = [T]()
  tmpList.reserveCapacity(leftHalf.count + rightHalf.count)
  
  while (leftIndex < leftHalf.count && rightIndex < rightHalf.count) {
    if leftHalf[leftIndex] < rightHalf[rightIndex] {
      tmpList.append(leftHalf[leftIndex])
      leftIndex += 1
    } else if leftHalf[leftIndex] > rightHalf[rightIndex] {
      tmpList.append(rightHalf[rightIndex])
      rightIndex += 1
    } else {
      tmpList.append(leftHalf[leftIndex])
      tmpList.append(rightHalf[rightIndex])
      leftIndex += 1
      rightIndex += 1
    }
  }
  
  tmpList += [T](leftHalf[leftIndex..<leftHalf.count])
  tmpList += [T](rightHalf[rightIndex..<rightHalf.count])
  return tmpList
}

let list = [3, 7, 2, 4, 1, 9, 8]

print(mergeSort(list))
