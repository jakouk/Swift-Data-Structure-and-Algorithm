//: Playground - noun: a place where people can play

import UIKit

/*
  다양한 서브스트링 검색 알고리즘
 
 1. 택스트 또는 문자열은 배열 T[1..n]으로 정의한다. 이떄 n은 문자열에 포함된 문자의 수를 나타낸다.
 2. 우리가 검색하려는 패턴은 배열 P[1..m]으로 정의한다. 이떄 m은 문자열에 포함된 문자의 수이며, m <= n이다.
 3. 배열 T에 문자열의 패턴인 배열 P가 존재하면, 우리는 이때 배열 T에서 s만큼 이동이라 포현한다. 패털 배열 P는
  배열 T의 s+1인 위치에서 찾을 수 있다. 즉 [ 1 < s < m-n]이라는 조건과 T[s+1 .. s+m] = P[1 .. m]이라는
  조건이 성립한다.
 
 나이브 알고리즘
 
 구현 방법이 간단하지만 성능 시간의 복잠성은 최악의 경우 (n-m+)m에 이를수 있다.
 */

public class StringSearch {
  // 문자열 배열을 활용한 브루트 포스 구현
  public static func bruteForce(search pattern: [Character], in text:[Character]) {
    // m과 n을 추출함
    let m = pattern.count - 1
    let n = text.count - 1
    
    for index in 0...n - m {
      let substringToMatch = text[index...index+m]
      print(substringToMatch)
      if substringToMatch == pattern[0...m] {
        print("Pattern found")
      }
    }
  }
}

StringSearch.bruteForce(search: ["3","4"], in: ["1","2","3","4","5","6"])


