//
//  main.swift
//  Day02
//
//  Created by 박재원 on 2021/07/15.
//

import Foundation

print("Hello, World!")

import Foundation

var str1: String

str1 =  "Apple"
str1 = "Google"
print(str1)

var str2: String?
str2 = "Apple"
str2 = "Google"
print(str2)

var str3: String

str3 =  "Apple"
str3 = "Google"
//str3 = nil
print(str3)

var str4: String?
str4 = "Apple"
str4 = "Google"
str4 = nil

print(str4)


// 비교 연산자
print(1 == 1)

// Tuple에서의 비교연산
print((1, "zebra") < (2, "apple"))      // a 가 z보다 앞에있다는 것보다 앞에 1,2 를 먼저 비교하고 그걸 결과로 보여준다
print((3, "apple") < (3, "bird"))    // true , 앞에가 같으니까 뒤에서를 비교함!

// 삼항 조건 연산자
let contentHeight = 40
let hasHeader = true

let rowHeight = contentHeight + (hasHeader ?  50 : 20)   // hatHeader가 true 면? 50을 더하고, false면 20을 더해라
print(rowHeight)




// 범위 연산자

// 닫힌 범위 연산자
for i in 1...10{
    print(i)   // 1부터 10까지 나온다!
}

var sum: Int = 0
for i in 1...10{
    sum += i
}

print("1 ~ 10의 합계는 \(sum) 입니다.")

// 구구단 연습
for i in 1...9{
    print("5 X \(i) = \(i*5)")
}

for i in 1..<10{
    print("5 X \(i) = \(i*5)")
}


// 배열 for 문
let names = ["Anna", "Alex", "Brian", "Jack"]

for i in 0..<names.count{
    print("Person \(i+1) is called \(names[i])")
}

// Optional
// : 값이 있을수도 있고, 없을 수도 있음
// : nil값을 포함할 수도 있고, 포함 안할 수도 있음

//var constantNum = 100
//constantNum = nil   // 100은 정수라고 판단해서 Int로 잡음! 그런데 Int 는 안된다.

var constantNum1: Int? = 100
constantNum1 = nil

var constantNum2: Int! = 100
print(constantNum2)       // Optional(100)
print(constantNum2!)      // 100
print(constantNum2 + 10)  // 다른 정수값이 들어오면 자동으로 벗겨지고 계산된다.

// Optional Unwrapping
var name: String? = nil    // 음.. 데이터가 nil값이 있을 수도 있는 값이야.
print(myName)   // App 에선 오류뜨고 꺼짐
print(myName as Any)


// Optional Binding * * * * * * * * * * * * * * * * * * * * * * * * * *
// myName을 가져와서 nil 이면 else로 가고 아니면 if 로 간다!
var myName: String? = nil

if let name: String = myName{
    print(name)
}else{
    print("myName is nil")
}

// 이렇게 쓰고 나면 이후에 name 쓸 때는 ! 안써도 된다.

// ? 랑 ! 랑 같다!!
var yourName: String! = nil

if let name: String = myName{
    print(name)
}else{
    print("myName is nil")
}

// 요즘엔 guard let 쓴다

var myName2: String? = "James"
var yourName2: String? = nil

// if and(,) 조건
if let name = myName2, let friend = yourName2{
    print("\(name) and \(friend)")
}

// Force Unwrapping * * * * * * * * * * * * * * * * * * * * * * * * * *
// 이렇게 바로 ! 로 풀어주는 것을 F~~ 라고 한다.
print(myName2)   // Optional("James")
print(myName2!)  // James

// 이걸 쓰려면 nil값을 빼주는 method 를 통과한 다음에 써주는게 좋다.
// 이게 소스가 간단해서 좋긴한데... 전재조건으로 데이터값이 있는지 없는지 체크는 꼭 해줘야한다.


// Collection : 여러값들을 묶어서 하나의 변수로 사용
/*
 Array : 순서가 있는 리스트 컬렉션
 Dictionary : key와 Value의 쌍으로 이루어진 컬렉션
 Set : 순서가 없고 멤버가 유일한 컬렉션이다. 집합연산
 */

// Array
// 빈 Array 생성
//var intVariable: Array<Int> = Array<Int>()
//var intVariable: [Int] = [Int]()
// ** 젤많이 쓰는 방법
var intVariable:[Int] = []

// 추가하는 방법
intVariable.append(1)
intVariable.append(10)
intVariable.append(100)
intVariable.append(1000)
print(intVariable)  // [1, 10, 100, 1000] 으로 뜸 -> 순서가 있는 배열이다!

print(intVariable.contains(100)) // true, false 로 나온다.  : 100이란 값을 가지고 있니?
print(intVariable[0])  // 1 출력
print(intVariable[0...2])   // [1, 10, 100] 출력
print(intVariable[0...2][0])  // [1, 10, 100] 중에서 가장 처음것이 나옴


// 제거하는 방법
intVariable.remove(at: 0) // 0번째 자리에 있는 것을 지울거야.
intVariable.removeLast()  // 맨 끝에거 지우기
intVariable.removeAll()
intVariable = []  // 이거도 싹 지우는 방법임

// 기본값으로 배열 생성하기
// Key & Value (Dictionnary 형태로 만들기)
var threeDouble = Array(repeating: 0.0, count: 3)        // 대문자로 시작하는건 class 이다! class 는 생성자를 포함한다. 그래서 ()
print(threeDouble)  // [0.0, 0.0, 0.0]
var anotherDouble = Array(repeating: 2.5, count: 3)

var sixDouble = threeDouble + anotherDouble
print(sixDouble)   // [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]

// 배열끼리 더하고 싶으면 각 [0]은 [0] 기리 더해주는 for 문 돌려야함

let intVariable2 = [1,2,3]
print(type(of: intVariable2))    // Array<Int>

intVariable2.append(4) // 이러면 error다! 왜냐.. let은 상수/Final 이기 때문이다.
// 일단 쓸때는 var로 다 쓰고 수정해주는 동그라미에서 let으로 바꿔줄때 쓰면 된다!

var shoppingList = ["Eggs", "Milk"]

print(shoppingList.count)   // 2
if shoppingList.isEmpty{
    
}

shoppingList += ["Baking Powder"]  // 추가가 된다!
shoppingList += ["Chocolate", "Cheese", "Butter"]  // 한번에 들어간다.

// 배열의 특정 위치 데이터 변경 및 제거
shoppingList[0...3] = ["Banana"]
print(shoppingList)  // ["Banana", "Cheese", "Butter"] 이렇게 뜬다! 범위는 0~3 인데 값은 하나면 삭제밑 수정이 된다.

// 앞에 지정해준 범위는 '지우고' 새로 받는걸 넣어준다.

shoppingList[0...3] = ["Banana1", "Banana2"]

shoppingList.insert("Apple", at: 0)  // Apple 값을 0번에 넣을거야! (insert)

// Swift 는 개방형 언어이다!

// 배열의 값과 인덱스가 필요한 경우
for (index, value) in shoppingList.enumerated(){
    print("Item \(index + 1) : \(value)")
    
}
// enumerated 는 index 번호와 값이 같이 나오는 것이다.


print(sixDouble)

var tot = 0.0
for i in sixDouble {
    tot += i
}
print(tot)


// 최대값 찾기
print(sixDouble.max()!)  // max 가 없을 수도 있어서 Optional 붙여주는 거임
// 최소값 찾기
print(sixDouble.min()!)  // unwrapping


















