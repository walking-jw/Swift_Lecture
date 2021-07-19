//
//  main.swift
//  Day04
//
//  Created by 박재원 on 2021/07/19.
//

import Foundation

// 함수

// 기본모양
func interSum(a: Int, b: Int) -> Int{
    return a + b
}

func greet(person: String) -> String{
    let greeting = "Hello, \(person)"
    return greeting
}

// 함수에서 쓰는 건 Argument , 불러서 거기에 넣을때는 Parameter

func buildAddress(_ name: String, address:String, 도시 city:String, country: String? = "USA") -> String {
    return """
        \(name)
        \(address)
        \(city)
        \(country ?? "")
        """
}

// 여기서 Argument 를 Parameter로 입력후 안보이게 하려면?
// name: String  -> _ name: String

buildAddress("원스", address: "주소", 도시: "하남", country: "한국")
buildAddress("재원", address: "주소", 도시: "하남")

// 이렇게 보면 Argument에서 한칸 띄고 입력한건 여기서 보이는게 이렇게 나온다.

// country: String? = "USA" 이렇게 쓰면 이 부분을 입력 안해도 된다는 것이다!
// 만약 공백으로 두면 기본값이 USA 로 찍힌다.
// \(country ?? "") 이것은 nil값이면 "" 이라고 지정을 해줘야한다. nil값이 들어올 경우를 생각한 함수다.
// 만약 country: String = "USA" 이렇게 쓰면 default 만 지정해 준 것이다.




// 가변 매개변수
func sayHello(me: String, friend: String...) -> String{
    
    return "Hello \(friend)! I'm \(me)"
}

print(sayHello(me: "원!", friend: "친구1", "친구2", "친구3"))
// friend: String...  : 몇개가 값으로 들어와도 출력이 가능하다!


// 시작 숫자부터 끝 숫자까지의 합계 구하는 함수
func addRange(start:Int, end:Int) -> String {
    var total:Int = 0
    
    for i in start...end {
        total += i
    }
    
    return "\(start)부터 \(end)까지의 합은 \(total)입니다."
}

func addRange2(start:Int, end:Int) -> String {
    var total:Int = 0
    var i:Int = start
    
    while i <= end {
        total += i
        i += 1
    }
    
    return "\(start)부터 \(end)까지의 합은 \(total)입니다."
}

print(addRange(start: 1, end: 100))
print(addRange2(start: 1, end: 100))


// Overloading : 함수의 이름은 중복되도 Parameter의 갯수로 구분이 가능

// 도형의 면적과 둘레를 구하는 함수

// 원
func shape(_ r:Double) {
    let pi = 3.14
    let area = pi * r * r
    let border = 2 * pi * r
    print("원 : \(area), \(border)")
}


func shape(_ w: Int, _ h: Int) {
    let area = w * h
    let border = (w * h) * 2
    
    print("직사각형 : \(area), \(border)")
}


func shape(_ w: Int, _ h: Int, _ s: Int) {
    let area = (w * h) / 2
    let border = (2 * s) * w
    
    print("직사각형 : \(area), \(border)")
}


// Swift 는 다중 상속이 가능하다!
// class ViewController: UIViewController  에서 UIViewController를 누르면 다양한 것을 상속 받은 것을 알 수 있음

/*
 Class : 전통적인 OOP (Object Oriented Programming)
 - 단일 상속
 - property
 - constructor
 - method
 - 참조 타입 선언
 
 Struct
 - 상속 불가
 - property
 - constructor
 - method (swift 에서는 func 형태)
 - Value(값) 타입 선언(Call by value)
 
 */

// Class 와 Struct 의 비교

struct ValueType {
    var property = 1
}

class ReferenceType{
    var property = 1
}

// instance 만들어보기!
let firstStructInstance = ValueType()

// 정상적인 방법
// let firstStructInstance: ValueType = ValueType()

var secondStructInstance = firstStructInstance // 똑같은애 만들어준거임!
secondStructInstance.property = 2

print("Struct // first : \(firstStructInstance.property), second : \(secondStructInstance.property)")

// Class Instance 만들어보기
let firstClassInstance: ReferenceType = ReferenceType()
var secondClassInstance = firstClassInstance
secondClassInstance.property = 2


print("Class  // first : \(firstClassInstance.property), second : \(secondClassInstance.property)")


// Struct 는 쌍둥이를 만들어도 Value랑 다 따로따로 쓴다!
// 그런데 Class 는 한곳에서 바뀌면 전체가 다 바뀐다.

// 그러면 Struct 는 어디서 쓰지?


// Sync 동기식   , Async 비동기식




