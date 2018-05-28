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
  
  public static func rabinKarpNumbers(search pattern: String, in text: String, modulo: Int, base: Int) {
    // 1. 초기화
    // put the pattern and the text into arrays of strins ->
    // So "123" will be ["1", "2", "3"]
    let patternArray = pattern.map { String($0) }
    let textArray = text.map { String($0) }
    let n = textArray.count
    let m = patternArray.count
    let h = (base ^^ (m-1)) % modulo
    var patternModulo = 0
    var lastTextModulo = 0
    
    // 2. 패턴 modulo와 택스트의 첫번째 자릿수의 modulo를 계산한다.
    // ( 이후 modulo 산술 연산 프로퍼티로 다음 자릿수도 계산한다 ).
    for i in 0...m-1 {
      guard let nextPatternDigit = Int(patternArray[i]),
        let nextTextDigit = Int(textArray[i]) else {
          print("Error")
          return
      }
      
      patternModulo = (base * patternModulo + nextPatternDigit) % modulo
      lastTextModulo = (base * lastTextModulo + nextTextDigit) % modulo
    }
    
    // 3. 동등여부를 확인하고, 다음 자릿수의 modulo를 계산한다.
    for s in 0...n - m - 1 {
      // 패턴 모듈로를 이용해서 마지막 modulo를 계산한다.
      if patternModulo == lastTextModulo {
        // 동등한 모듈로를 찾았다. 이제 이들 숫자 조합의 모든 자릿수도 같은지 확인한다.
        // 자릿수가 일부 달라도 모듈로는 같을 수 있으므로 확인 작업이 필요하다.
        let substringToMatch = textArray[s...s + m - 1].joined(separator: "")
        if pattern == substringToMatch {
          print("Pattern occurs at shift: " + "\(s)")
        } else {
          print("Same modulo but not same pattern: " + "\(s)")
        }
      }
      
      // 다음 숫자 그룹의 모듈로를 계산한다.
      if s < n - m {
        guard let hightOrderDigit = Int(textArray[s]), let lowOrderDigit = Int(textArray[s + m]) else {
          print("Error")
          return
        }
        
        // 다음 모듈로를 계산하려면 숫자 그룩 왼쪽에 위치한 높은 단위의
        // 모듈로를 빼고, 다음 단계에서 낮은 단위의 모듈로를 더한다.
        
        // 1. 높은 단위 자릿수의 모듈로를 뺀다.
        var substracteHightOrderDigit = (base*(lastTextModulo - hightOrderDigit * h)) % modulo
        if substracteHightOrderDigit < 0 {
          // 모듈로가 음수인 경우, 이를 양수로 바꾼다.
          // (스위프트의 % 연잔사는 나머지 연산자이지 modulo 연산자는 아니기 떄문이다.)
          substracteHightOrderDigit = substracteHightOrderDigit + modulo
        }
        
        // 2. 새로운 낮은 단위 자릿수를 더한다.
        var next = (substracteHightOrderDigit + lowOrderDigit) % modulo
        if next < 0 {
          // 모듈로가 음수인 경우, 이를 양수로 바꾼다.
          // (스위프트의 % 연간자는 나머지 연산자이지 modulo연산자는 아니기 떄문이다.)
          next = next + modulo
        }
        lastTextModulo = next
        
      }
    }
  }
  
  precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
  infix operator ^^ : PowerPrecedence
  func ^^ (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
  }
}

StringSearch.bruteForce(search: ["3","4"], in: ["1","2","3","4","5","6"])


