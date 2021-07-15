//
//  ViewController.swift
//  AppQuiz05
//
//  Created by 박재원 on 2021/07/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfNumber1: UITextField!
    @IBOutlet weak var tfNumber2: UITextField!
    
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblResult.text?.removeAll()
    }

    
    @IBAction func btnResult(_ sender: UIButton) {
        
        if checkNil(str: tfNumber1.text!) == false {
            tfNumber1.becomeFirstResponder()
            lblResult.text = "1번 숫자를 입력해주세요"
        }else if checkNil(str: tfNumber2.text!) == false {
            tfNumber2.becomeFirstResponder()
            lblResult.text = "2번 숫자를 입력해주세요"
        }else{
            lblResult.text = calcFunc(num1: tfNumber1.text, num2: tfNumber2.text)
        }
    
    } //btnResult
    
    func checkNil(str: String!) -> Bool{
            let check = str.trimmingCharacters(in: .whitespacesAndNewlines)
            if check.isEmpty{
                return false
            }else{
                return true
            }
        } // checkNil
    
    func calcFunc (num1: String!, num2: String!) -> String {
        var sum: Int = 0
        let calcNum1: Int = Int(num1!)!
        let calcNum2: Int = Int(num2!)!
        
        if calcNum1 < calcNum2 {
            for i in calcNum1...calcNum2{
                sum += i
            }
        }else if calcNum1 == calcNum2 {
            sum = calcNum1
        }else{
            for i in calcNum2...calcNum1{
                sum += i
            }
        }
        return "합계는 \(sum)입니다"
    } // calcFunc
    

}

