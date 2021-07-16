//
//  main.swift
//  Day03
//
//  Created by 박재원 on 2021/07/16.
//

import Foundation

// Dictionary
// Key 와 Value 로 구성됨

// 표준타입! <제너릭>
//var scoreDictionary: Dictionary<String, Int> = [String: Int]()
// 이렇게 많이 쓴다!  >  [:] 에서 : 만 빠지면 Array다.
var scoreDictionary: [String: Int] = [:]

// Data 넣을때
scoreDictionary["재원"] = 100
scoreDictionary["Wonny"] = 90
scoreDictionary["Jaewon"] = 80

print(scoreDictionary)  // ["재원": 100]
// ["Jaewon": 80, "재원": 100, "Wonny": 90]  -> 순서가 뒤죽박죽이다!  -> 순서가 있는 것은 배열뿐이다.
// 만약 그림 예제를 이거로 하려면, 번호를 키값으로 주던가 해야한다!

// 초기값을 가지는 Dictionary (수정불가)
let initializedDictionary: [String: String] = ["name":"James", "gender":"male"]

// Set
// Set은 집합연산에 사용되고, 중복데이터를 적용하지 않는다.

let oddDigits: Set = [1, 3, 5, 6, 9]
print(oddDigits)  // [9, 6, 1, 3, 5]  순서가 아무 상관 없다!

let oddDigits2: Set = [1, 3, 3, 5, 5, 6, 9, 9, 9, 9]
print(oddDigits2)  // [5, 1, 9, 6, 3]

let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]


// 합집합
print(oddDigits.union(evenDigits)) // [6, 5, 0, 1, 2, 9, 8, 3, 4]  -> 순서 엉망..
print(oddDigits.union(evenDigits).sorted()) // [0, 1, 2, 3, 4, 5, 6, 8, 9]  -> 오름차순 정리!

// 교집합
print(oddDigits.intersection(evenDigits).sorted()) // [6]

// 차집합
print(oddDigits.subtracting(singleDigitPrimeNumbers).sorted())

// Set의 동등 비교
let houseAnimals: Set = ["dog", "cat"]
let farmAnimals: Set = ["cow", "chicken", "sheep", "dog", "cat"]
let cityAnimals: Set = ["duck", "rabbit"]

print(houseAnimals.isSubset(of: farmAnimals))  // true (부분집합)
print(farmAnimals.isSuperset(of: houseAnimals))  // true (모집합)

let houseAnimals2: Set = ["dog", "cat", "apple"]
let farmAnimals2: Set = ["cow", "chicken", "sheep", "dog", "cat"]

print(houseAnimals2.isSubset(of: farmAnimals2))  // false Data 하나라도 포함되어 있으면 부분집합이 아니다.

print(farmAnimals.isDisjoint(with: cityAnimals)) // 서로 아예 중복되어 있는게 없다!
// -> 중복데이터 정리할때 많이 쓴다!
// 예를 들어 1학년 table 2학년 table 을 불러와서 isDisjoint를 했는데 false가 나오면
// 어떤 데이터가 중복되어 있다는 뜻이다.
// 개발할때는 잘 사용하지 않으나, Data Cleaning 할때 쓴다.

print("* * * * * * * * * * * * * * * * * * * * *")

// if
var isCar = true
var isNew = true

if isCar, isNew{
    print("New Car")
}

isNew = false
// , 는 and와 같다! 두 조건이 모두 true가 되야 if가 된다.
if isCar, isNew{
    print("New Car")
}else{
    print("Old Car")
}


// Switch 조건문
// Before Switch

let personAge = 14
if personAge < 1 {
    print("baby")
}else if personAge < 3{
    print("toddler")
}else if personAge < 5 {
    print("preschooler")
}else if personAge < 13{
    print("gradeschooler")
}else if personAge < 18{
    print("tean")
}else{
    print("adult")
}

// After using Switch statement
// 범위를 지정해줄 수 있다! 그리고 break 없이 기본값이 안흘러가는 것이다.(Java와 반대)
switch personAge{
case 0..<1:
    print("baby")
case 1..<3:
    print("toddler")
case 3..<5:
    print("preschooler")
case 5..<13:
    print("gradeschooler")
case 13..<18:
    print("tean")
default:
    print("adult")
}


let someInteger = 12345

switch someInteger{
case 0:
    print("zero")
case 1..<100:
    print("1~99")
case 101...Int.max:
    print("over 100")
default:
    print("unknown")
}

// 대소문자를 잘못 입력한 것도 받아줄때?
let aCharacter: Character = "a"

// 이렇게 조건을 여러개 줄 수도 있다!!
switch aCharacter{
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}

// 국어, 영어, 수학 점수로 총점 평균을 구하고 등급을 정하기
let name = "Wonny"
let kor = 91
let eng = 97
let math = 95

var tot = 0
var avg: Double = 0

tot = kor + eng + math
avg = Double(tot / 3)

// 점수 등급 출력 - 1
var grade: String
var score: Int = 100

print("* * * * * * * * * *")

switch score{
case 0..<60:
    print("F")
case 60..<70:
    print("D")
case 70..<80:
    print("C")
case 80..<90:
    print("B")
case 90...100:
    print("A")
default:
    print("Error")
}

print(" 삼항 * * * * * * * * * *")
// 삼항연산자 등급 출력
let point:Int = 70

grade = point >= 90 ? "A" :
        point >= 80 ? "B" :
        point >= 70 ? "C" :
        point >= 60 ? "D" : "F"

print(grade)

var testscore = [90]
var level = ["A", ]
var average:Double = 0.0

//for i in 0..<testscore.count{
//    if average {
//
//
//    }
//
//
//    break
//
//}

// 반복문

let names = ["Anna", "Alex", "Brian", "Jack"]

for i in 0..<names.count{
    print(names[i])
}

// 배열 for문은 이걸 더 써야한다!
for name in names{
    print(name)
}

// Dictionary 반복문
let numberOfLegs = ["Spider":8, "Ant":6, "Cat":4]

for (animalName, legCount) in numberOfLegs {
    print("\(animalName) have \(legCount) legs")
    
}

let seq1 = 1...5
for i in seq1{
    print(i)   // 1, 2, 3, 4, 5
}

for i in seq1.reversed() {
    print(i)   // 5, 4, 3, 2, 1
}

// 시계를 예제로 해보기
let minutes = 60
let hourInterval = 5

for tickMark in stride(from: 0, to: minutes, by: hourInterval){
    print(tickMark) // 0, 5, 10 ... 55
}

for tickMark in stride(from: 0, through: minutes, by: hourInterval){
    print(tickMark) // 0, 5, 10 ... 60
}

for tickMark in stride(from: 0, through: minutes, by: hourInterval).reversed(){
    print(tickMark) // 60, 55, ... , 0
}


// while
var startIndex = 0
var endIndex = 100
var sum = 0

while startIndex <= endIndex {
    sum += startIndex
    startIndex += 1
}

print(sum)

var startIndex2 = 0
var endIndex2 = 100
var sum2 = 0

// 1부터 100까지의 짝수의 합 (단, if문 사용금지
while startIndex2 <= endIndex2 {
    let number = startIndex2%2==0 ? startIndex2 : 0
    sum2 += number
    startIndex2 += 1
}

print(sum2)


var integerNum:Int = 12345678
var total:Int = 0

while integerNum > 0 {
    total += integerNum % 10
    integerNum = integerNum / 10
}
print("answer : \(total)")



print("Enter an integer(0~9)", terminator: " ")  // print 문에 이어서 출력이 가능하다!
var repNum = 0
var remainder = 0
var sumNo = 0

var inputNum = Int(readLine()!)
if let _:Int = inputNum{ // if let 이라 문벖항으로는 let을 써야하는데.. 어차피 안쓸거면 _로 처리한다!
    repNum = inputNum!
    while repNum != 0 {
        remainder =  repNum % 10
        sumNo += remainder
        repNum /= 10
    }
    print("Sum of digits = \(sumNo)")
}else{
    print("Input value is wrong")
}





