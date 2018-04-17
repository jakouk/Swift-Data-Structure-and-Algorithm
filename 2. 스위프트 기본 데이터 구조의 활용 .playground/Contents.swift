//: Playground - noun: a place where people can play

/*
  2.  스위프트 기본 데이터 구조의 활용
 
  * 스위프트의 표준 라이브러리
  * 서브스크립트 구현 방법
  * 수정불가 데이터 타입의 이해
  * 스위프트와 오브젝티브C의 상호관련성
  * 스위프트의 프로토콜 지향 프로그래밍
 */

/*
  스위프트의 구조체 주요 기능
 
  1. 자동으로 생성되는 멤버 초기화 함수 외에, 커스텀 초기화 함수도 사용가능
  2. 메소드를 지닐 수 있음
  3. 프로토콜을 구현할 수 있음.
 */

/*
  스위프트에서 클래스 대신에 구조체를
 
  1. 특정한 타입 생성의 가장 중요한 목적이 간단한 몇 개의 값을 캡슐화하려는 것인 경우
  2. 캡슐화한 값을 구조체의 인스턴스에 전달하거나 할당할 때 참조가 아닌 복사를 할 경우
  3. 구조체에 의해 저장되는 프로퍼티를 참조가 아닌 복사를 위한 밸류 타입인 경우
  4. 기존 타압에서 가져온 프로퍼티나 각종 기능을 상속할 필요가 없는 경우
 */

/*
   스위프트 배열
 
  오브젝티브C와는 다르게 오직 같은 타입만을 배열에 추가할수 있다.
  스위프트는 배열은 클래스가 아니라 구조체이다.
 
  세가지 유형의 배열이 있다.
  1. Array
  2. ContiguousArray
  3. ArraySlice
 
  배열의 타입이 클래스 or @objc가 아닌경우
  배열의 메모리 영역은 인접 블록에 저장된다.
 
  배열의 타입이 클래스 or @objc인 경우
  배열의 메모리 영적은 인접 블록에 NSArray의 인스턴스 또는 NSArray의 서브클래스의 인스턴스로 저장된다.
 
 
  배열의 초기화
 
  구조체, 클래스, 열거형의 초기화 작업을 위해 init 메서드를 사용한다.
  오브젝티브 C 프로그래머라면 스위프트의 초기화 객체의 구현 방식이 다소 색다르다는 것을 아수 있다.
  오브젝티브 C에서 init메서드는 초기화한 객체를 직접 반환하고, 호출 객체는 클래스를 초기화할 때 반환된 값이 nil 인지 확인한다.
  이때 nil이 반환되었다면 초기화 과정이 실패했음을 의미한다.
  스위프트에서는 이와 같은 확인 기능을 실패가능 초기화라고 한다.
 */

// 배열 초기화
var intArray = Array<Int>()
intArray = [Int]()
intArray.append(55)

var intLiteralArray: [Int] = [ 1, 2, 3]
intLiteralArray = [1, 2, 3]
// swift4.0은 [Int](repeating: 2, count: 5) 로 바뀜
// swift3.0은 [Int](count: 5, repeatedValue: 2)
intLiteralArray = [Int](repeating: 2, count: 5)

// 배열에 특정 요소가 포함돼 있는지 확인하는 것은 물론, 각 요소의 값을 파악할 수 있는 클로저도 전달할 수 있다.
intArray.contains(55)
// true 반환


/*
  딕셔너리 가져오기 및 초기화하기
 
  딕셔너리는 동일한 데이터 타입이 키와 값 쌍으로 묶여 있는 무순휘 컬렉션이며 순위를 별도로 지정할 수 있는 방법은 없다.
  각각의 값은 딕셔너리 내에서 해당 값의 이름표와 같은 역할을 하는 키와 연결되어있다.
 */

// 딕셔너리 초기화
//var myDict = Dictionary<Int, String>()

// 딕셔너리 단축 선언 문법
//myDict = [Int: String]()

// 키와 값이 모두 동일한 타입의 데이터로 구성된 경우 딕셔너리 선언에서 해당 데이터 타입을 별도로 명시할 필요가 없다.


// 초기화와 동시에 데이터 넣어주기
var myDict: [Int: String] = [1:"One", 2:"Two", 3:"Three"]

// 새로운 키/쌍 추가
myDict.updateValue("Four", forKey: 4)
myDict[5] = "Five"

// 삭제하기
let removedPair = myDict.removeValue(forKey: 1)
myDict[2] = nil


// 딕셔너리값 가져오기
if let optResult = myDict[6] {
  print(optResult)
} else {
  print("Key not Found")
}

// 사용하지 않는 것이 좋음.
let result = myDict[3]!
print(result)

// 튜플로 가져오기
let states = ["AL": "Alabama", "CA": "California", "AK": "Alaska", "AZ": "Arizona", "AR": "Arkansas"]
for (stateAbbr, stateName) in states {
  print("The state abbreviation for \(stateName) is \(stateAbbr)")
}

/*
   이들 프로퍼티는 컬렉션에 대응하는 LazyMapCollection 인스턴스를 반환한다.
  이렇게 반환된 딕셔너리 요소는 기본요소에 포함된 변환 클로저 함수의 호출에 의해 정보가 읽을때 마다
  지연처리되고, 이때의 키와 값은 각각 .0 멤버와 ,1 멤버가 되어 딕셔너리의 키/값 쌍과 동일한 순서대로 나타난다.
 */

// 키값만 가져오기
for ( stateAbbr ) in states.keys {
  print("State abbreviation: \(stateAbbr)")
}

// 벨류 값만 가져오기
for ( stateName ) in states.values {
  print("State name: \(stateName)")
}

// 딕셔너리 정렬 키의 값을 기준을 정렬
let sortedArrayFormDictionay = states.sorted{ $0.0 < $1.0 }
print(sortedArrayFormDictionay)


/*
   세트 선언 (Set init)
  세트는 서로 중복되지 않고 unique, nil이 포함되지 않은 non-nil 순위를 정의 할 수 없는 무순위 컬렉션이다.
  세트는 형식상 Hashable 프로토콜에 부합해야 하며, 스위프트의 모든 기본 타입은 기본적으로 Hashable 프로토콜을 따르도록 설계됐다.
  연관값을 사용하지 않는 열겨형의 case값 역시 기본적으로 Hashable 프로토콜을 따른다. 세트에는 여러분이 만든 커스텀 타입도 저장할 수 있는데
  이때도 해당 타입은 반드시 Hashabel 프로토콜과 Equatable 프로토콜에 부합해야만 하는데, Hashable을 상속한 프로토콜이기도 한다.
 
  순위가 중요치 않은 배열이라면 해당 데이터를 세트로 저장해도 큰 차이가 없으며, 이때는 해당 요수가 서로 중복되지 않도록 주위하기만 하면된다.
  세트는 배열에 비해 매우 효울적이며, 데이터 접근 속도 역시 세트가 훨씬 빠르다.
  배열의 크기가 n일때 O(n)의 속도를 유지하고
  세트의 크기가 n일때 O(1)의 속도를 유지한다. 
 */

// 세트 선언을 위한 정식 문법
//var stringSet = Set<String>()

// 배열 요소로 세트 초기화
//var stringSet: Set = ["Mary","John","Sally"]
//print(stringSet)

var stringSet: Set = ["Erik","Mary","Michael","John","Sally"]
stringSet.insert("Patrick")

if stringSet.contains("Erik") {
  print("Found element")
} else {
  print("Element not found")
}

stringSet.remove("Erik")

if let idx = stringSet.index(of: "John") {
  stringSet.remove(at: idx)
}
stringSet.removeFirst()
//stringSet.removeAll()

for name in stringSet {
  print("name = \(name)")
}

for name in stringSet.sorted() {
  print("name = \(name)")
}


/*
   세트는 수학에서 집합 개념으로 만든 타입으로 수학의 집합 연산과 같이 두 개 세트의 비교를 ㅜ이한
  다양한 메소드를 제공하고, 두 개 세트의 멤버십 연산과 동등 연산 기법 역시 제공한다.
 */

let adminRole: Set = ["READ","EDIT","DELETE","CREATE","SETTINGS","PUBLISH_ANY","ADD_USER","EDIT_USER","DELETE_USER"]
let editorRole: Set = ["READ","EDIT","DELETE","CREATE","PUBLISH_ANY"]
let authorRole: Set = ["READ","EDIT_OWN","DELETE_OWN","PUBLISH_ANY","CREATE"]
let contributeorRole: Set = ["CREATE","EDIT_OWN"]
let subscriberRole: Set = ["READ"]

// 두 개 세트에 있는 요소를 모두 포함시킴
let fooResource = subscriberRole.union(contributeorRole)

// 두 개 세트에 공통적으로 있는 요소를 포함시킴
let commonPermissions = authorRole.intersection(contributeorRole)

// 한 쪽에는 있지만, 다른 쪽에는 없는 요소만을 포함시킴
let exclusivePermission = authorRole.symmetricDifference(contributeorRole)

/*
   두 개의 세트에 속한 내부 요소가 서로 완전히 같을 경우, 두 세트는 동등하다고 표현한다.
  세트는 원래붜 무순위 컬렉션이므로 내부 요소의 순서는 동등 여부판단에서 별 의미가 없다.
  두 세트가 같음을 표현기 위해 동등 연산자인 == 연산자를 사용하며, 이 연산자를 이용해서 두 개의 세트에 같은 요소들만 포함돼 있는지 확인할 수 있다.
 */

// 세트 요소의 순서는 중요치 않다.
var sourceSet: Set = [1,2,3,]
var destSet: Set = [2,1,3,]

// 같은 세트인지 확인
var isequal = sourceSet == destSet


let contactResource = authorRole
let userBob = subscriberRole
let userSally = authorRole

if userBob.isSuperset(of: fooResource) {
  print("Access granted")
} else {
  print("Access denied")
}

if userSally.isSuperset(of: fooResource) {
  print("Access granted")
} else {
  print("Access denied")
}

// 거짓
authorRole.isDisjoint(with: editorRole)

// 참
editorRole.isSubset(of: adminRole)

/*
   튜플의 특징
  튜플은 스위프트에는 있지만 오브젝티브C에는 없는 고급 타입이다.
  튜플은 배열, 딕셔너리, 세트와 같은 컬렉션 타입은 아니지만, 컬렉션과 매우 비슷한 특징을 지닌다.
  튜플은 컬렉션이 아니기 때문에 SequenceType 프로토콜에 부합할 필요가 없으며, 다른 컬렉션 타입에서 가능했던 내부 요소의 순회는 불가능하다.
 
  튜플은 한무리의 데이터를 저장하거나 전달하기 위한 목적으로 사용된다.
  튜플은 별도의 구조체 타입을 쓰지 않고도 함수에서 하나의 값으로 여러 타입의 데이터를 반환해야 하는 경우에 특히 유용하다.
  하지만 튜플의 반환 결과가 임시 범위를 넘어서서 영구 범위까지 보장해야할 때는 다른 방법을 쓰는 것이 좋다.
 */


// 무기명 튜플

//let responseCode = (4010, "Invalide file contents", 0x21451fff3b)
// "(4010, "Invalide file contents", 142893645627)"
//let responseCode = (4010, "Invalide file contents", 0x8fffffffffffffff)
// 컴파일 에러 ( 범위를 초과해서 Integer 가 )

let responseCode: (Int, String, Double) = (4010, "Invalid file contents", 0x8fffffffffffffff)

// 튜플 요소의 타입을 확인하는 것도 가능
//print(responseCode.dynamicType)
// (Int, String, Double)

// 인덱스 값 사용
print(responseCode.0)

// 분할 방법 사용
let (errorCode, errorMessage, offset) = responseCode
print(errorCode)
print(errorMessage)
print(offset)


// 기명 튜플

let reponseCode = (errorCode: 4010, errorMessage:"Invalid file contents",offset: 0x7ffffffffffff)
print(reponseCode.errorCode)

func getPartnerList() -> (statusCode:Int, description:String, metaData: (partnerStatusCode: Int, partnerErrorMessage:String, parterTraceId:String)) {
  
  return (503, "Service Unavailable", (32323, "System is down for maintainance until 2015-11-05T03:30+00:00","5A953D9C-7781-427C-BC00-257B2EB98426"))
}

var tupleResult = getPartnerList()
print(tupleResult)
tupleResult.statusCode
tupleResult.description
tupleResult.metaData.partnerErrorMessage
tupleResult.metaData.partnerStatusCode
tupleResult.metaData.parterTraceId


// 서브스크립팅 구현
class MovieList {
  private var tracks = ["The Godfather", "The Dark Knight", "Pulp Fiction"]
  subscript(index: Int) -> String {
    get {
      return self.tracks[index]
    }
    set {
      self.tracks[index] = newValue
    }
  }
}

struct Person {
  var firstName: String
  var lastName: String
  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
}

class Address {
  var street: String = ""
  var city: String = ""
  var state: String = ""
  var zipcode: String = ""
  init(street: String, city: String, state: String, zipcode: String) {
    self.street = street
    self.city = city
    self.state = state
    self.zipcode = zipcode
  }
}

let person = Person(firstName: "John", lastName: "Smith")

// person.firstName = "Erik" 컴파일 애러

let adress = Address(street: "1 Infinite Loop", city: "Cupertino",
                     state: "CA", zipcode: "95014")

adress.city = "19111 Pruneridge Avenue"

//adress = Address(street: "1", city: "1", state: "1", zipcode: "1")









