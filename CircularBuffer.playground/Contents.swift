//: Playground - noun: a place where people can play

import UIKit

/*
  순환버퍼
 
 시작 부분을 연결해 주는 헤드 인덱스와 테일 인덱스등 두개의 인덱스를 사용하는 고정 크기의 데이터 구조이다.
 버퍼가 데이터로 꽉차면 헤드 인덱스는 0으로 되돌아 간다. 순환 버퍼는 지정된 용량까지 받아들이고, 기존의
 데이터는 새로운 데이터로 대체된다.
  순환 버퍼는 특히 FIFO 데이터 구조를 구현할 때 유용한다.
 
 순환 버퍼는 다음 6개의 메서드와 두개의 프로퍼티를 구현한다.
 
 1. push(): 버퍼의 끝에 요소를 추가함
 2. pop(): 버퍼의 첫번째 요소를 반환하고 버퍼에서 삭제함
 3. peek(): 버퍼의 첫번쨰 요소를 반환하되 삭제하지는 않음
 4. clear(): 버퍼를 재설정해 빈 상태로 만듦
 5. isEmpty(): 버퍼가 비어있는 경우 true를 반환하고, 그렇지 않은 경우 false를 반환함
 6. isFull(): 버퍼가 가득 차있는 경우 true를 반환하고, 그렇지 않은 경우 false를 반환함
 
 1. count: 버퍼에 포함된 요소의 수를 반환함
 2. capacity: 버퍼의 용량을 반환 또는 설정할 수 있는 read/ write 프로퍼티
 
 도우미 메서드
 insert(_:atIndex): 버퍼의 특정 인덱스 위치에 요소를 삽입하는 메서드
 removeAtIndex(_): 버퍼의 특정 인덱스 위치에 있는 요소를 제거하는 메서드
 
 순환 버퍼는 비디오와 오디오 처리분야에서 가장 보편적으로 활용되며 실시간 동영상을 녹화하는 비디오 캡퍼 애플리케이션을
 개발할때 사용하게 돤다.
 */

public struct CircularBuffer<T> {
  private var data: [T]
  private var head: Int = 0, tail: Int = 0
  
  private var internalCount: Int = 0
  private var overwriteOperation: CircularBufferOperation = CircularBufferOperation.Overwrite
  
  public init() {
    data = [T]()
    data.reserveCapacity(Constants.defaultBufferCapacity)
  }
  
}