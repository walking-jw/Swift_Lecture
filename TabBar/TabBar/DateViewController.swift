//
//  ViewController.swift
//  DataPicker
//
//  Created by 박재원 on 2021/07/19.
//

import UIKit

class DateViewController: UIViewController {

    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblPickerTime: UILabel!
    
    let interval = 1.0   // 1초
    let timeSelector: Selector = #selector(DateViewController.updateTime)
    // Selector = objc 타입 불러올때 쓴다.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lblPickerTime.text = "시간을 선택하세요!"
        // 시간을 주기 위해서는 objective-C 형태로 주어야한다. iOS 가 그거로 만들어져서!
        
        // 1초에 한번씩 연월일 ~~ 초를 나타내주는 기능이다.(Async)
        // 1초에 한번씩 타겟을 구동시킨다.
        // 내부 함수에는 가능하면 숫자를 쓰지 않는게 좋다! 왜냐하면 나중에 1이 무슨 의미인지 어려워지고, 수정하기가 편하기 때문이다.
        // interval 시간에 한번씩 self 에 있는 selector 를 실행시켜주면 되는구나!
        // repeats : true 무한반복
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
//        print(datePickerView.date)    // 2021-07-19 ~~ 똑같이 나온다 밑에랑. 이후엔 이제 똑같이 쓰면 된다!
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE HH:mm"     // HH 는 24시간 단위
        lblPickerTime.text = "선택시간 : \(formatter.string(from: datePickerView.date))"
            
        
    }
    
    @objc func updateTime(){
        // interval 초에 한번씩 이 안에 있는 것을 실행시켜준다!
        // 위에 있는 Timer 는 달력과 전혀 상관이 없다. 지정한 초에 한번씩 무언가를 실행시킨다는 연결고리이다.
        
        let date = NSDate()  // Next Step   ( 시간 값을 가지고 있는 것은 여기에 있다 )
//        print(date)  // 2021-07-19 07:29:30 +0000 이렇게 1초에 한번씩 뜬다!
        let formatter = DateFormatter()    // Date date = new Date() 라고 생각하면 좋다.
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss"     // (EEE : 요일, a : ampm)
        lblCurrentTime.text = "현재시간 : \(formatter.string(from: date as Date))"
        // 그냥 from: date 쓰면 에러가 난다! as Date 붙인건.. objc 타입에서 swift 시간 타입으로 바꿔주는 것이다.
        
        
        
    }
    
    
    

} // ViewController

