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


