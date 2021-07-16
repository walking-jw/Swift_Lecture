# Swift 강의 노트

#### Swift Lecture : 2021.07.14 ~ 07.30
<br>


# Day 01 


## Swift 실행 환경
1. Xcode의 Playground (OS : MaxOSX, Linux)
2. Terminal 에서 swift 입력 후, REPL 방식으로 사용 가능하다 (OS : MacOSX)
3. Online Swift Playground : http://online.swiftplayground.run (OS : All)
4. 구름 IDE : https://ide.goorm.io/
5. iPAD용 : App Store Swift Playgrounds 검색

<br>

## Mac 에서의 개발환경
1. Playground
2. Comman Line Tool Project
3. iOS / WatchOS / iPadOS / tvOS

<br>

## 스토리보드를 활용한 화면구성

 `cmd + shift + L`  Object 가져오기
 `cmd + K` 시뮬레이터에서 키보드 꺼내기
 
  >NOTE
  > Project로 개발진행시, storyboard 에서 View as : 와 상단 기기정보를 일치시켜야 한다!
  > Error : Select a development team in the Signing... 이 뜬다. 

Editor 에서 마우스 오른쪽으로 클릭해서 드래그 해 가져온다. 이때 주의해야 할 점은, IBOutlet으로 끌고 온 것을 이름을 바꾸어버리면 앱 충돌이 일어나게 된다! 그리고 실수로 두번 드래그 해서 가져오게 되면 에러코드가 없이 앱이 종료되어버린다.
이때 확인해줘야 할 것은 Referencing Outlets 가 두개가 아닌지 확인!
만약 버튼을 불러올 땐, `Any type` 보다 `UIButton`이 메모리 소모가 덜하다

<br>

## weak 와 strong의 차이
  ```swift
    @IBOutlet weak var lblWelcome: UILabel!
  ```

위의 모습처럼 Editor 에서 가져올때, weak 와 strong으로 가져오게 되는데, 둘의 차이점은
* `weak` : 화면에서 나가면 사라지는 것
* `strong` : 앱을 종료하기 전까지 남아있는 것

`IBOutlet` Interface Builder

<br>

## 상수와 변수의 작명규칙
* Camel Case : function, method, variable, constant
  + ex) studentName, studentAge ...
* Pascal Case : class, struct, enum, extension, ...
  + ex) Student, Product
* Snake Case : underbar로 연결하여 사용 (Android 에선 👍 Swift 에선 👎)
* 대소문자 구분
* 첫글자를 숫자나 특수문자로 시작하면 안되나, underbar(_)로 시작이 가능하다. (특수용도)

<br>

# Day 02

>## Lecture

<br>

## 비교 연산

## 범위 연산자

## Optional


<br>

>## Tips

## Keyboard 내리기
  ```swift
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
  ```

<br>

## 공백 체크

`.trimmingCharacters(in: .whitespacesAndNewlines)` 공백과 Enter키를 다 trim 해준다.
  ```swift
    func checkNil(str: String!) -> Bool{
      let check = str.trimmingCharacters(in: .whitespacesAndNewlines)
        if check.isEmpty{
            return true
        }else{
            return false
        }
    }
  ```

<br>

## becomeFirstResponder()

<br>

## 무한반복 만들기

<br>

## Image 띄우기

<br><br>

# Day 03 

>## Lecture
<br>

## Dictionary
Dictionary는 `Key`와 `Value`로 구성되어 있다. 
표준타입은 `var scoreDictionary: Dictionary<String, Int> = [String: Int]()` 형태이나 아래와 같이 많이 사용한다.
  ```swift
    var scoreDictionary: [String: Int] = [:]
  ```
여기서 `[:], :` 만 빠지면 `Array`와 같다! 

Dictionary는 순서가 없다. 순서가 있는 것은 배열뿐이다! 만약 순서를 주려면 key값을 번호로 주어야한다.

<br>

## 초기값을 가지는 Dictionary
`let` 으로 선언해주었기 때문에 수정이 불가능하다
  ```swift
   let initializedDictionary: [String: String] = ["name":"James", "gender":"male"]
  ```

<br>


## Set

Set 은 집합연산에 사용되고, **중복데이터를 적용하지 않는다.**
  ```swift
    let oddDigits2: Set = [1, 3, 3, 5, 5, 6, 9, 9, 9, 9]
    print(oddDigits2)  // [5, 1, 9, 6, 3]
  ```
Set도 역시 순서가 정리되어 있지 않다. 순서대로 사용하고 싶을 때는 `.sorted()` 를 사용한다.

`print(oddDigits2.sorted())`

* 합집합 : `oddDigits.union(evenDigits).sorted()`
* 교집합 : `oddDigits.intersection(evenDigits).sorted()`
* 차집합 : `oddDigits.subtracting(singleDigitPrimeNumbers).sorted()`
* 부분집합 : `houseAnimals.isSubset(of: farmAnimals)` : true
* 확대집합 : `farmAnimals.isSuperset(of: houseAnimals)` : true

### 데이터 중복 확인
`farmAnimals.isDisjoint(with: cityAnimals)`
아예 중복되어 있는게 없을때 `true`값으로 반환한다. 만약 겹치는 데이터가 있을 경우에는 `false`를 반환한다.

개발할때는 많이 사용하지는 않으나, 중복데이터를 찾는 등의 `Data Cleaning` 할때 사용한다.

<br>
 
## switch
### 1. 범위 지정 switch 문
 
 
### 2. 특정조건 + 범위지정 switch 문
  
  ```swift
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
  ```
 
### 3. 조건 여러개일때도 사용
                
  ```swift
  let aCharacter: Character = "a"

  switch aCharacter{
    case "a", "A":
       print("The letter A")
    default:
       print("Not the letter A")
  }
  ```
                
 사용자가 대문자와 소문자를 잘못 입력해줬을 경우, 해당 조건으로 대소문자 모두 인식이 가능한 코딩이 가능하다.
                
<br>
 
## 삼항연산자 활용 
 삼항 연산자를 연속적으로 활용하여 `switch`대용으로 사용도 가능하다. 
  
  ```swift
   let point:Int = 70

   grade = point >= 90 ? "A" :
           point >= 80 ? "B" :
           point >= 70 ? "C" :
           point >= 60 ? "D" : "F"
  ```

<br>

## 반복문

### 1. Index를 활용한 for 문
for문의 범위를 배열의 길이인 `.count`로 잡아준다.
  ```swift
    let names = ["Anna", "Alex", "Brian", "Jack"]

    for i in 0..<names.count{
        print(names[i])
    }
  ```

### 2. 배열을 값으로 한 for 문
  ```swift
    for name in names{
        print(name)
    }
  ```

### 3. Dictionary 반복문
  ```swift
    let numberOfLegs = ["Spider":8, "Ant":6, "Cat":4]

    for (animalName, legCount) in numberOfLegs {
        print("\(animalName) have \(legCount) legs")
    }
  ```

### 4. stirde 활용
  ```swift
    // 시계를 예제로 해보기
    let minutes = 60
    let hourInterval = 5

    for tickMark in stride(from: 0, to: minutes, by: hourInterval){
        print(tickMark)   // 0, 5, 10 ... 55
    }

    for tickMark in stride(from: 0, through: minutes, by: hourInterval){
       print(tickMark)    // 0, 5, 10 ... 60
    }

    for tickMark in stride(from: 0, through: minutes, by: hourInterval).reversed(){
       print(tickMark)    // 60, 55, ... , 0
    }

  ```

### 5. while
  ```swift
    var startIndex = 0
    var endIndex = 100
    var sum = 0

    while startIndex <= endIndex {
        sum += startIndex
        startIndex += 1
    }

    print(sum) // 5050
```

<br><br>

>## Tips
  
## if문 활용
if 문에서도 `콤마(,)`는 `and`와 같다. 두 조건 모두 해당해야 `if` 문을 실행하고, 하나라도 맞지 않으면 `else`로 간다.
 
  ```swift
    if <조건1>, <조건2>{
      <조건에 부합하면 이곳을 실행>
    } else{   }
  ```
 
<br>
 
## format 변환
  ```swift
    String(format:"%.2f", <변환하고자 하는 값>)
  ```
    
<br>
    
## for - reversed
for 문에서 값을 역순으로 출력 및 활용하고 싶을 경우, `.reversed()`를 활용한다.
  ```swift
    let seq1 = 1...5
    for i in seq1{
        print(i)   // 1, 2, 3, 4, 5
    }

    for i in seq1.reversed() {
        print(i)   // 5, 4, 3, 2, 1
    }
  ```

<br><br>
 
>## Quiz

* [Quiz07](https://github.com/walking-jw/Swift_Lecture/blob/main/AppQuiz07/AppQuiz07/ViewController.swift)  :  짝수인 경우에만 덧셈 계산하기
* [Quiz08](https://github.com/walking-jw/Swift_Lecture/blob/main/AppQuiz08/AppQuiz08/ViewController.swift)  :  평균점수 등급 계산하기
* [Quiz09](https://github.com/walking-jw/Swift_Lecture/blob/main/AppQuiz09/AppQuiz09/ViewController.swift)  :  평균점수, 총점, 평균대비 구하기(한페이지에)
 
