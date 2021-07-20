//
//  main.swift
//  Day05
//
//  Created by 박재원 on 2021/07/20.
//

import Foundation

// Class 랑 Struct 비슷하다. 상속이 불가능한거만 차이! 앞으로 instance를 만들때 struct를 사용하면 좋다.

// ------------------
// 구조체 : Structure
//      : Swift 에서는 Data Type을 정의할때 사용한다.


// Structure (구조체) 생성   * * * * * * * * * *
struct Sample{
    
    // property ( Java 에서 field )
    var sampleProperty: Int = 10         // var니까 가변 프로퍼티
    let fixedSampleProperty: Int = 100   // 불변 프로퍼티
    static var typeProperty: Int = 1000  // 타입 프로퍼티
    
    // 비어있는 생성자! 만약 아무 struct들을 안만들면 이렇게 하나 만들어준다.
    init() {
    }
    
    func instanceMethod() {
        print("instance method")
    }
    
    static func typeMethod() {
        print("type method")
        
    }
    
}

// Structure 사용하기   * * * * * * * * * *

var samp: Sample = Sample()       // samp 라는 instance를 하나 만들었다.
print(samp.sampleProperty)        // [10 출력] samp.~~ 보면 static으로 한건 보이지 않는다! static은 struct 내부에서만 쓰는 것이다.

// Struct는 유저 ID 저장할때 많이 사용한다.
// Class 는 화면 하나다라고 생각해라! 그리고 Struct가 퍼포먼스가 더 좋기 떄문에 더 활용하면 좋다.

samp.sampleProperty = 100
print(samp.sampleProperty)        // [100출력]

var samp1 = Sample()
print(samp1.sampleProperty)       // [10출력]

//여기서는 10이 나오는 이유가, call by value 방식이기 떄문에 위에 100으로 바뀐건 samp instance만 변한거다.


// Type Property    * * * * * * * * * *
Sample.typeMethod()
print(Sample.typeProperty)

// static 이 붙으면 Sample.~~ 로 사용가능하고,
// 없으면 꼭 불러서 사용해야한다. Sample()


// 학생 구조체 * * * * * * * * * * *
struct Student {
    var name: String = "unknown"
    var `class`: String = "Swift"     // 굳이 class 라고 이름을 지정하고 싶을땐 이렇게 사용한다.
    
    static func selfIntroduce(){
            print("학생 타입입니다.")
    }
    
    func selfIntroduce() {
        print("저는 \(`class`)반 \(name)입니다.")
        print("저는 \(self.class)반 \(name)입니다.")  // Java 의 this
    }
    
}


// 사용해보기!

Student.selfIntroduce()

var student: Student = Student()
student.name = "James"
student.class = "스위프트"
student.selfIntroduce()

// [저는 스위프트반 James입니다] 출력!

// property 는 var 로 만들어주는게 좋다.
// 만약 property가 var 여도 불러오는 instance가 let으로 불러오면 변경 불가능!
// cathy.name = "Cathy" -> 불가능

let cathy: Student = Student()
cathy.selfIntroduce()

// [저는 Swift반 unknown입니다.] 출력


// Class 로 만들어보기 !! * * * * * * * * * * * * * * *
class StudentClassVer {
    var name: String = "unknown"
    var `class`: String = "Swift"     // 굳이 class 라고 이름을 지정하고 싶을땐 이렇게 사용한다.
    
    static func selfIntroduce(){
            print("학생 타입입니다.")
    }
    
    func selfIntroduce() {
        print("저는 \(`class`)반 \(name)입니다.")
        print("저는 \(self.class)반 \(name)입니다.")  // Java 의 this
    }
    
}

StudentClassVer.selfIntroduce()
var studentClassVer: StudentClassVer = StudentClassVer()
// 이렇게 똑같이 만들어 줄 수 있다!


// * * * * * * * * * * * * * * * * * # Overload
class Shape{
    
    let pi: Double = 3.14
    let area: Double
    let border: Double
    
    
    // Constructor 를 활용한 방법
    init(radius: Double) {
        area = pi * radius * radius
        border = (2 * radius) * pi
        calc()
    }
    
    // Method를 활용한 방법
    func input(radius r: Double){
        let area = pi * r * r
        let border = (2 * r) * pi
        print("원의 면적은 \(area)이고 둘레는 \(border)입니다.")
    }
    
    func input(width w: Int, height h: Int){
        let area = w * h
        let border = (w + h) * 2
        print("직사각형의 면적은 \(area)이고 둘레는 \(border)입니다.")
    }
    
    func input(width w: Int, height h: Int, c:Int) {
        let area = w * h
        let border = (w + h + c)
        
        print("직각삼각형의 면적은 \(area)이고 둘레는 \(border)입니다.")
    }
    
    func calc() {
        print("원의 면적은 \(area)이고 둘레는 \(border)입니다.")
    }
    
}

//let sh1: Shape = Shape()
//sh1.input(radius: 5)        // 원의 면적과 둘레 구하기
//// * * 목표 출력 내용 * *
//// 원의 면적은 __ 이고 둘레는 __ 입니다.
//
//let sh2: Shape = Shape()
//sh2.input(width: 5, height: 6)     // 직사각형의 면적과 둘레 구하기
//
//let sh3: Shape = Shape()
//sh3.input(width: 5, height: 6, c: 8)  // 직각삼각형의 면적과 둘레 구하기


class Shape1{
    // class 내부에서는 무조건 초기화 해줘야한다.
    // Constructor 와 Method 둘다 사용해서 계산이 가능하다.
    
    var area = 0.0
    var border = 0.0
    let pi = 3.14157
    
    init() {
        print("계산시작")  // class 시작하면 이게 먼저 실행된다.
    }
    
    init(radius: Double) {
        area = radius * radius * pi
        calc()
    }
    
    init(width: Double, height:Double) {
        area =  width * height
        border = (width + height) * 2
        calc()
    }
    
    func input(r: Double){
        area = r * r * pi
        calc()
    }
    
    func calc() {
        print("원의 면적은 \(Int(area))입니다.")
    }
    
}

//let sh4: Shape1 = Shape1(radius: <#Double#>)      // [계산시작] 출력
//sh4.input(r: 5.0)
let sh5: Shape1 = Shape1(radius: 5.0)               // Constructor 로 [원]계산!
let sh6: Shape1 = Shape1(width: 3.0, height: 4.0)   // Constructor 로 [직사각형]계산!

// Java 에서는 Constructor 를 class 이름과 동일하게 하지만, 여기서는 Init 으로 써준다.


// Extension * * * * * * * * * * * * *
// Siwft 4.0 까지는 상속을 많이 썼지만, 5.0 이후부터는 Extension 으로 많이 씀
// Constructor, Class, Protocal 타입에 새호운 기능을 추가할 수 있는 기능.
// 기존에 존재하는 기능은 재정의 할 수 없다. ( 새로운 기능만 추가하는 것이다 )

extension Int{
    var isEven: Bool{
        return self % 2 == 0
        // self = 들어온 값
    }
    var isOdd: Bool{
        return self % 2 == 1
    }
}

print(1.isEven)   // 이런걸 쓸 수 있어짐!

// 따로 클라스를 만들지 않고 확장시켜서 사용하면 정말 편하다.
// extension  <->  delegate



// Closure  ( Lamda 함수와 비슷하다 )
// Alert 와 Action Sheet 를 쓸 때 사용한다.
// 함수를 하나 만들고 Closure 를 만들어 보고자 한다.

// 함수
func sumFunction(a:Int, b: Int) -> Int{
    return a + b
}

var sumResult: Int = sumFunction(a: 10, b: 20)
print(sumResult)        // 30 출력

// Clousure 로 만들어보기
var sumClosure: (Int, Int) -> Int = {(a: Int, b: Int) -> Int in
    return a + b
}
// in 이 쓰인 다는 것만 기억하자!!

sumResult = sumClosure(10, 20)
print(sumResult)



// Random
print(Int.random(in: 1..<10))

func genNum() -> String{
    return String(Int.random(in: 1..<10))
}
