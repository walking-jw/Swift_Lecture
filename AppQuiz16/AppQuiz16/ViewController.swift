//
//  ViewController.swift
//  AppQuiz16
//
//  Created by 박재원 on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    // Outlet
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblSelectTime: UILabel!
    
    
    // Timer Settings
    let interval:Double = 1.0    // Timer Setting : 1초
    let timeSelector: Selector = #selector(ViewController.updateTime)
    var check: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 최초 세팅
        lblSelectTime.text = "알람 시간을 선택 하세요"
        lblCurrentTime.text = ""
        
        // Timer Setting
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
    } // viewDidLoad

    
    // changeDatePicker
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE HH:mm"
        lblSelectTime.text = "\(formatter.string(from: datePickerView.date))"
        
    }
    
    
    // updateTime
    @objc func updateTime() {
        let date = NSDate()              // 시간 값 가져오기
        let formatter = DateFormatter()  // 시간타입 변경 함수
        let formatterForColor = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")   // 한국 시간으로 변경
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss"
        
        formatterForColor.locale = Locale(identifier: "ko")
        formatterForColor.dateFormat = "yyyy-MM-dd EEE HH:mm"
        
        lblCurrentTime.text = "\(formatter.string(from: date as Date))"
        
        checkCurrentAndSelectTime(currentTime: formatterForColor.string(from: date as Date), selectTime: lblSelectTime.text!)
        
        
    }
      
    // Alert func
    func alertAlarm() {
        // ( Alert : Controller - Action - addAction - present )
        self.check = true
        let alertAlarm  = UIAlertController(title: "알림", message: "설정한 시간입니다!!", preferredStyle: .alert)
        let alertOff = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: { ACTION in
            self.view.backgroundColor = UIColor.white
           
        })
        alertAlarm.addAction(alertOff)
        present(alertAlarm, animated: true, completion: nil)
        
    }
    
    // 시간 일치하는지 확인하는 func
    func checkCurrentAndSelectTime(currentTime: String, selectTime: String) {
        if currentTime == selectTime, check == false {
            view.backgroundColor = UIColor.gray
            alertAlarm()
        }else{
            view.backgroundColor = UIColor.white
        }
    }
    
    

} // ViewController

