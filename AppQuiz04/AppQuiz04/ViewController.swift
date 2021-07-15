//
//  ViewController.swift
//  AppQuiz04
//
//  Created by 박재원 on 2021/07/15.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfNumber: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lblResult.text?.removeAll()
        
    } // viewDidLoad

    
    @IBAction func btnTest(_ sender: UIButton) {
        
        let numCheck = checkNil(str: tfNumber.text!)
        if numCheck == 1 {
            let returnValue = numberDecision(str: tfNumber.text!)
            lblResult.text = "입력하신 숫자는 \(returnValue)입니다."
        }else{
            lblResult.text = "숫자를 확인하세요!"
        }
        
        
//
//        var message: String
//
//        let checkNumber = Int(tfNumber.text!) ?? 0    // 인풋넘버가 아무것도 없으면! 0으로 간주할거야
//
//        if checkNumber % 2 == 0{
//            message = "짝수"
//        }else{
//            message = "홀수"
//        }
//        lblResult.text = "입력하신 숫자는 \(message)입니다."
        
//        if emptyCheck() == true {
//            guard let inputNum = tfNumber.text else { return }
//            let num = Int(inputNum)!
//            lblResult.text = numberCheck(num)
//            tfNumber.text?.removeAll()
//        }
        
        
    } // btnTest
    
    func checkNil(str: String!) -> Int{
        let check = str.trimmingCharacters(in: .whitespacesAndNewlines) // 공백이랑 Enter키를 다 trim 할래!
        if check.isEmpty{
            return 0
        }else{
            return 1
        }
    }
    
    func numberDecision(str: String!) -> String {
        if Int(str)! % 2 == 0 {
            return "짝수"
        }else{
            return "홀수"
        }
    }
    
    
    
//    // 숫자 판별하기
//    func numberCheck(_ number: Int) -> String{
//
//        var result: String
//
//        result =  (number % 2 == 0 ? "짝수" : "홀수")
//
//        return "입력하신 숫자 \(number)는(은) \(result)입니다."
//
//    } // numberCheck
//
//    // 공백 판별하기
//    func emptyCheck() -> Bool{
//        if tfNumber.text?.count == 0 {
//            tfNumber.becomeFirstResponder()
//            lblResult.text = "숫자를 입력하세요"
//            return false
//        }
//        return true
//    }
    
    
    
} // ViewController




