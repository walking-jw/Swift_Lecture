//
//  main.swift
//  Day01
//
//  Created by Wonny on 2021/07/14.
//

import Foundation

/*
 상수와 변수의 작명규칙
 - Camel Case : function, method, variable, constant
    ex) studentName, studentAge ...
 
 - Pascal Case : class, struct, enum, extension, ...
    ex) Student, Product
 
 - Snake Case : underbar로 연결하여 사용 (Android에서는 좋아하는데 Swift 에선 싫어함)
 
 - 대소문자 구분
 - 첫글자를 숫자나 특수문자로 시작하면 안되나, underbar(_)로 시작이 가능하다. (특수용도)
 
 */

// 상수 : 한번 선언된 값에 대해 변경이 불가능
/*
 let <variable name> : <type> = <value>
 */

var intLetNum1: Int = 200
let intLetNum2 = 200
let intLetNum3: Int
intLetNum3 = 200

intLetNum1 = 2000

/*
 오류 아이콘 안에 흰색 버튼이 있는데 이걸 누르면, 자동으로 수정해준다!
 -> 변경이 불가능한 let에서 var로 바꿔주었다!
 */

// 자주 하는 실수 : 더하기 할때, let으로 두면 한번밖에 연산을 할 수 없음
let sum: Int
sum = intLetNum1 + intLetNum2
//sum = intLetNum2 + intLetNum3

var nickName: String
nickName = "재원"
//nickName = 100    <- 이렇게 다른타입 사용할 수 없다!

var aNum = 9, bNum = 10  // 이렇게 같이 선언할 수도 있다.

/*
 문자열 보간법 (String Interpolation)
 */

let studentName = "홍길동"
print(type(of: studentName))

// 출력방법 (Java)
print("name : " + studentName)
// 파이썬 느낌으로
print("name :", studentName)
// Swift 느낌으로 (SI)
print("name : \(studentName)")

let age: Int = 10

print("저는 \(age)살 입니다.")
print("저의 형은 \(age + 4)살 입니다.")

var name1 = "재원"
var age1 = 31
var gender1 = "남자"

// 연습!
print("회원의 이름은 \(name1)이고 나이는 \(age1)이며 성별은 \(gender1)입니다.")

/*
 DATA TYPE
 */

// Bool
var someBool: Bool = true

// Int
var someInt: Int = -100
someInt = 100_000     // 100,000 와 같다! , 들어가면 문자로 인식하기 때문에

// Float
var someFloat: Float = 3.134

// Double
var someDouble: Double = 3.12

// 숫자 타입 변환
let doubleNum = 4.99999
print(Int(doubleNum))    // 4가 나옴 (버림)
print(Int(doubleNum.rounded()))  // 5가 나옴

// Character
var someCharacter: Character = "a"
someCharacter = "😄"    // 이건 문자다!
print(someCharacter)

// String
var someString: String = "🥰😘"
print(someString)

let temp = "b"
print(type(of: temp))  // 문자 기본은 string 이다!

// 이건 꼭 """ 밑에 한칸 띄어서 써야한다!
var someMultiString = """
    1234
    abcd
    가나다라
"""
print(someMultiString)

// 문자열과 특수문자
// \n, \t, \", \'

print("aa\tbb\ncc")
let wiseWords = "\"Imagination is more than the knowledge\" = Einstein"
print(wiseWords)

//
var name: String
var size: Int
var weight: Double
var bag: Bool
var color: Character

name = "맥북프로"
size = 16
weight = 2.56
bag = false
color = "슥"

print("이름 : \(name)")
print("크기 : \(size)")
print("무게 : \(weight)")
print("가방 : \(bag)")
print("색상 : \(color)")

// 문자열 수정
var variableString = "Horse"
variableString += " and carriage"
print(variableString)

var string1 = "hello"
var string2 = " there"
var welcome = string1 + string2
print(welcome)

string1.append(string2)
print(string1)


// 문자 길이
let str = "12345,67890"
print("str has \(str.count) sharacters")

if str.count == 0{
    print("Data가 없습니다.")
    
}else{
    print("Data는 \(str)입니다.")
}

// Any nil
// Any : Swift의 모든 타입을 지칭하는 키워드이다.
// nil : null, Null, None

// Any
var someAny: Any = 100    // Any 타입 쓰려면 꼭 지정해줘야한다 Any를, 파이썬은 전부 Any 타입
someAny = "Type"
print(someAny)
someAny = 123.12   // 마지막에 쓴거만 나온다!
print(someAny)

var someDouble1: Double = 111.1
// print(someAny + someDouble1)
// Any + Double 타입은 계산이 안된다!!! Any 는 Any 끼리만 가능하다... 안쓰는 편이 좋다고 함

// 굳이 쓰려면?
print(someAny as! Double + someDouble1)

// var someNil: String
// 이건 못쓴다! someNil = nil

// Null Safety
var someNil: String?      // 이렇게 ? 를 붙여줘야 nil이 들어갈 수 있다.
someNil = nil

// Tuple
// Tuple 사용전
var dialCode = 82
var isoCode = "KR"
var countryName = "Korea"
print(dialCode, isoCode, countryName)

// Tuple 사용
var country = (82, "KR", "Korea")
print(country)
// 하나씩 쓰고싶다면?
print(country.0, country.1, country.2)

// 0, 1, 2가 뭔지 모르고 구성 내용의 이름을 모르니까 이름으로 저장하고싶으면? Dictionary
var country1 = (dialCode1: 82, isoCode1: "KR", countryName1: "Korea")
print(country1.dialCode1, country1.isoCode1, country1.countryName1)


// Type 별칭
typealias MyInt = Int

let myage: MyInt = 20

// Tuple을 만들때 잘 쓴다!
typealias person = (name: String, height: Int, marriage: Bool)

// 이런식으로 만들 수 있다.
var p1: person = ("재원", 180, false)
print(p1.name)   // 이러면 재원이 표시된다!


// Tuple을 사용하여 직사각형의 넓이와 둘레를 출력

// 가로, 세로, 넓이, 둘레
typealias Rectangle = (shape:String, width:Int, height:Int, area:Int, border:Int)
var r1: Rectangle = ("직사각형", 5, 6, 0, 0)
r1.area = r1.width * r1.height
r1.border = (r1.width + r1.height)*2
print(r1)


// 연산자
let (x1, y1) = (1, 2)
print(x1, y1)

// 사칙연산자
print(10 / 3)
print(10.0 / 3.0)  // 정수끼리 계산한건 정수, 실수끼리 계산한건 실수로 나옴

// 단항 음수 연산자
let one = 1
let minusOne = -one





