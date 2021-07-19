//
//  ViewController.swift
//  AppQuiz13
//
//  Created by 박재원 on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblSelectTime: UILabel!
    
    let interval = 1.0      // Timer - timeInterval : 1초
    let timeSelector: Selector = #selector(ViewController.changeColorTime)
    var count:Int = 0       // 알람 색상을 구분하기 위한 숫자
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lblSelectTime.text = "시간을 선택해주세요!"
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE HH:mm"
        lblSelectTime.text = "\(formatter.string(from: datePickerView.date))"
        
    }
    
    
    // 색상이 변하는 함수
    @objc func changeColorTime() {
        
        let date = NSDate()              // 시간 값 가져오기
        let formatter = DateFormatter()  // 시간타입 변경 함수
        let formatterForColor = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")   // 한국 시간으로 변경
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss"
        
        formatterForColor.locale = Locale(identifier: "ko")
        formatterForColor.dateFormat = "yyyy-MM-dd EEE HH:mm"
        
        lblCurrentTime.text = "\(formatter.string(from: date as Date))"
        
        changeViewColor(현재시간: formatterForColor.string(from: date as Date), 선택시간: lblSelectTime.text!)
    }
    
    
    func changeViewColor(현재시간 time1: String, 선택시간 time2: String) {
        
        if time1 == time2 {
            switch count % 2 {
            case 0:
                view.backgroundColor = UIColor.red
            default:
                view.backgroundColor = UIColor.blue
            }
        } else{
            view.backgroundColor = UIColor.white
        }
        
        count += 1
       
    } // changeViewColor
    
    
    
}

