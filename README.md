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


# Day 04 

>## Lecture
<br>

## 함수
Java 에서는 Method 라고 불리는 이 기능을 Swift 에서는 함수(function)라고 부른다. 
함수의 기본 형태는 다음과 같은데, `-> Int` 부분은 return 하는 type이고, return 값이 없으면 `void`를 써주거나 생략한다.

 ```swift
  func interSum(a: Int, b: Int) -> Int{
      return a + b
  }
 ```
 
 >Argument & Parameter
 >함수에서 쓸 때 Argument, 그 함수를 사용할때 Parameter 라고 구분하기는 하지만, 대부분 섞어서 사용한다!

함수의 Argument를 설정해줄때 다양한 방법으로 보기쉽게 하거나 편하게 사용할 수 있다.

 ```swift
  func buildAddress(_ name: String, address:String, 도시 city:String, country: String? = "USA") -> String {
      return """
          \(name)
          \(address)
          \(city)
          \(country ?? "")
          """
 ```
 * `_ name:` : func에서는 name이라고 보이며 처음 함수를 불러와 사용할 때는 name이라고 보이지만, Parameter 값을 지정해주면 name 설명은 사라진다.
 * `도시 city:` : 좀더 알기 쉽게 함수를 쓰기위해, Parameter를 넣어줄 때, 추가적인 설명을 줄 수 있다.
 * `country: String? = "USA"` : nil값이 들어왔을 경우를 생각해, `?`를 주었고, 아무것도 작성하지 않으면 USA로 작성된다!
 * `\(country ?? "")` : 만약 nil 값이 들어오면? ""로 대체한다라는 뜻

위의 내용을 함수로 불러와 사용하고자 하면 아래와 같겠다. 보면 `country` 부분은 공백으로 생략하고 작성하지 않아도 된다(default값인 USA로 저장)

 ```swift
  buildAddress("원스", address: "주소", 도시: "하남", country: "한국")
  buildAddress("재원", address: "주소", 도시: "하남")
 ```


<br>

## 가변 매개변수
 ```swift
  func sayHello(me: String, friend: String...) -> String{
      return "Hello \(friend)! I'm \(me)"
  }

  print(sayHello(me: "원!", friend: "친구1", "친구2", "친구3"))

 ```
 * `friend: String...` : Parameter로 여러개를 받을 수 있다. 출력은 ["친구1,", "친구2", "친구3"] 형태로 출력

<br>

## Overloading
함수의 이름은 중복되도 Parameter의 갯수로 구분이 가능하다.


<br>

## Class & Struct
#### 1. Class : 전통적인 OOP (Object Oriented Programming)
 * 단일 상속
 * property, constructor, method
 * 참조 타입 선언

#### 2. Struct
 * 상속 불가
 * property, constructor, method
 * Value(값) 타입 선언 (Call by value)


#### 3. Class 와 Struct 의 비교
 * Class 는 한 곳에서 값이 변하면 전체가 다 변하지만, Struct는 각자 따로 값을 가진다.

<br>

## 상태변수 ( Set Status )
 * 추가적인 공부 필요!
<br>

## switch object & ImageView
switch object 의 기본적인 구조는 아래와 같다. `sender.isOn`을 기본으로 해서 switch 문과 엮어서 쓰면 좋다.
 ```swift
  @IBAction func switchImageOnOff(_ sender: UISwitch) {

          switch  sender.isOn {
          case true:
              imgView.image = imgOn
          default:
              imgView.image = imgOff
          }
   }
 ```
  > Switch는 inspectors 에서 `state > On` 으로 기본 값을 줄 수 있다.

<br>

## DatePicker & Timer
 * Timer에 대한 설명
 * Selector 에 대한 설명
 * NSDate


 <br><br>

>## Tips
 
 ## DateFormat
 *  "yyyy-MM-dd EEE a hh:mm:ss"  HH 는 24시간
 
 <br>
 
 ## 배경색 변경하기 (view.backgroundColor)
 
 <br><br>
 
>## Quiz

* [Quiz12](https://github.com/walking-jw/Swift_Lecture/blob/main/AppQuiz12/AppQuiz12/ViewController.swift)  :   switch object  전구 확대 & 색변경
* [Quiz13](https://github.com/walking-jw/Swift_Lecture/blob/main/AppQuiz13/AppQuiz13/ViewController.swift)  :  알람 맞추기 - 알람시간 동안 색 변하게 하기
* [Quiz14](https://github.com/walking-jw/Swift_Lecture/blob/main/AppQuiz14/AppQuiz14/ViewController.swift)  :  3초마다 이미지 변경 무한 반복

<br><br>

# Day 05

>## Lecture

## Struct
Class 랑 Struct 는 비슷한 개념이다. 다만 Struct 는 상속이 불가능하다. Swift 에서는 Struct를 권장하고, Performance 면에서eh Class에 앞선다. 구조체는 Data Type 을 정의할때 사용한다.

### 1. Structure 생성 
 ```swift
   struct Sample{
       // property
       var sampleProperty: Int = 10         // 가변 프로퍼티
       let fixedSampleProperty: Int = 100   // 불변 프로퍼티
       static var typeProperty: Int = 1000  // 타입 프로퍼티

       init() {
       }

       func instanceMethod() {
           print("instance method")
       }

       static func typeMethod() {
           print("type method")
       }
   }
 ```
만약 별도의 Method 를 만들지 않을 경우, `init()` `Constructor` 를 만들어줘야한다. 
Java 에서는 Class 이름과 `Constructor` 의 이름을 일치시키는 것에 비해, swift 는 `init`으로 쓴다. 

### 2. Structure 사용
밑에서는 samp 라는 `instance`를 만들었다. 첫번째 `samp.sampleProperty`를 보면 자동완성 시, `static` 으로 만든 function은 나타나지 않는다. 
처음 `samp` 로 불러왔을 경우, 초기 `Sample` 에서 가지고 있던 10 값을 가지고 있지만, 수정이 가능하다. 
또한, 새롭게 불러왔을 경우, 수정되었던과는 별개로 처음 10의 값을 가지고 온다 `(Call By Value 방식)`


 ```swift
  var samp: Sample = Sample() 
  print(samp.sampleProperty)    // 10 출력

  samp.sampleProperty = 100
  print(samp.sampleProperty)    // 100 출력

  var samp1 = Sample()
  print(samp1.sampleProperty)   // 10 출력
 ```
 > Struct 는 유저 ID 저장할때 많이 사용한다! ⭐️

### 3. Type Property 사용
`static` 이 붙은 것들은 `Sample.~~` 형태로 사용이 가능하다. 만약 없을 경우 `func` 을 호출해서 사용해야한다.
 ```swift
  Sample.typeMethod()
  print(Sample.typeProperty)
 ```

### 4. 기타사항
 * property 는 var 로 만들어 주는 것이 좋다.

<br>

## Extension ✨
Swift 4.0 까지는 상속 형태를 많이 사용했지만, 5.0 이후부터는 Extension 을 많이 사용하게 되었다.     
Extension 은 Constructor, Class, Protocol 타입에 새로운 기능을 추가할 수 있다.    
단, 기존에 존재하는 기능은 재정의 할 수 없다.    
새롭게 원하는 기능을 만들 수 있으나, 다양한 기능이 swift에 내장되어 있다.


<br>

## Delegate ✨
swift 자체적으로 많은 delegate가 있다. 상황에 맞는 기능을 찾아서 쓰면 좋다.
예를 들어 return 키를 눌렀을때 글자를 지워지게 하고싶다. 
 1. 기능을 만든다
 ```swift
    extension ViewController: UITextFieldDelegate{
       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           lblResult.text = tfInput.text
           return true
       }
    }
 ```
 2. viewDidLoad 에 추가시켜준다.
 ```swift
    override func viewDidLoad() {
          super.viewDidLoad()
          tfInput.delegate = self
    }
 ```


<br>

## PickerView
  📎 참고 링크 [PickerView](https://github.com/walking-jw/Swift_Lecture/blob/main/PickerView/PickerView/ViewController.swift)
 1. 그림 세팅 : imageFileName(파일명)과 UI 이미지 파일 매칭해주기
 2. Extension : `UIPickerViewDataSource` PickerView 의 모양과 범위를 세팅해준다
 3. pickerImage.dataSource = self : `.dataSource` 와 `ViewController(self)` 연결해주기
 4. Extension - UIPickerViewDelegate : `Delegate`가 Android 의 `Adapter` 느낌이다. 
 5. Extension - didSelectRow : 선택된 Row 를 어떻게 할지 Action 을 설정한다.

 > 3번 : PickerView 모양잡기 -> 4번 : PickerView Row 들 이름 넣어주기 -> 5번 : Action 넣어주기

<br>

## AlertActionSheet
 1. Controller 초기화
 2. AlertAction 설정
 3. Controller 와 Action 연결해주기
 4. 화면 띄우기
 > `preferredStyle:` 만 `.alert`와 `.actionSheet` 구분해서 사용하면 좋다.

 ```swift
  let lampRemoveAlert  = UIAlertController(title: "램프 제거?", message: "램프를 제거 할까요?", preferredStyle: .alert)
  let lampRemove = UIAlertAction(title: "네, 제거합니다.", style: .default, handler: {_ in
      self.lampImage.image = self.imgRemove
      self.isLampOn = false
      })
  lampRemoveAlert.addAction(lampRemove)
  present(lampRemoveAlert, animated: true, completion: nil)
 ```
 * `UIAlertAction` 을 부를때, `title`의 길이에 따라 한줄로 네, 아니오 처럼 보이게 할 수도 있다.
 * `UIAlertAction` 부분에서 `style:` 은 글씨의 색생 차이이다
 * `handler` 부분은 `{ACTION in ~~ <#버튼 눌렀을때 기능#>}`
 * `present > animated:` `false` 일 경우는, `Alert`가 더 빨리 뜬다


<br><br>

>## Tips

### UI를 사용하는 것들은 기본적으로 `Optional`이다.

<br>

### 랜덤 숫자 : Int.random( #range )
 ```swift
  func genNum() -> String{
      return String(Int.random(in: 1..<10))
  }
 ```

<br><br>
 
>## Quiz
* [Quiz15](https://github.com/walking-jw/Swift_Lecture/blob/main/AppQuiz15/AppQuiz15/ViewController.swift)  :   구구단 선택해서 출력하기 (PickerView)
* [Quiz16](https://github.com/walking-jw/Swift_Lecture/blob/main/AppQuiz16/AppQuiz16/ViewController.swift)  :   알람을 맞추어 배경화면 색변경 & Alert 출력
* [Quiz17]()  :  랜덤 숫자 구구단 퀴즈

<br><br>

# Day 06

>## Lecture

## Hybrid App Network Setting
- Internet 을 사용하기 위해 다음과 같이 info.plist에 추가한다.

 1. Information property list 의 오른쪽 [+] 누른다.
 2. 목록에서 App Transport Security Setting을 선택하고 enter 를 친다.
 3. App Transport Security Setting 에서 왼쪽의 화살표를 아래로 향하게 하고, [+]을 누른다.
 4. Allow arbitrary loads 을 선택하고 Enter를 친다.
 5. Allow Arbitrary 의 오른쪽에 있는 No 값을 Yes로 변경하고 Enter를 친다.

<br>

## Web Site 연결하기
1. import Webkit
2. 사이트 이름 변수선언
3. URL로 변환
4. 연결 결과 받을 Request 필요
5. WebView 와 연결
 ```swift
    // naver 사이트 연결
    let tempSite = "https://www.naver.com"
    // String 값을 URL 형태로 받아야한다!
    let myUrl = URL(string: tempSite)
    // myURL 은 Optional 이다. 연결은 했는데 결과를 받아야 하기 때문에 Request 필요
    let myRequest = URLRequest(url: myUrl!)
    // 받아온 결과를 어디에 띄울꺼야?
    myWebView.load(myRequest)
 ```

## Indicator 연결해주기
`Indicator` 를 띄우기 위해서는 `Extension` 을 써줘야한다.    
왜냐하면 `ViewController` 가 `UI`만 상속받아왔기 때문에 `WK` 는 사용할 수가 없다.   
`Indicator` 사용전, inspertor 에서 hide when stop 체크    
`extension ViewController:WKNavigationDelegate` 으로 Extension 해준 후, 세팅해준다.

<br>

## Toolbar
 ```swift
    // ToolBar Buttons
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }

    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }

    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }

    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
 ```

<br><br>

>## Tips

### 특정 글자로 시작하는지 확인 : .hasPrefix()
특정 글자로 시작하는지 확인하는지 체크할때, .hasPrefix 를 통해서 Bool 값을 return 받을 수 있다.
 ```swift
     func checkUrl(_ url:String) -> String {
         var strUrl = url
         let flag = strUrl.hasPrefix("http://") // 앞 글자가 이렇게 시작하면
         if !flag{                              // hasPrefix 는 Bool
             strUrl += "http://"
         }
         return strUrl
     }
 ```
 
<br><br>

>## Quiz
* [Quiz18](https://github.com/walking-jw/Swift_Lecture/blob/main/AppQuiz18/AppQuiz18/ViewController.swift)  :  PickerView & WebView
