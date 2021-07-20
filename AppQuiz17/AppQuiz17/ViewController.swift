//
//  ViewController.swift
//  AppQuiz17
//
//  Created by 박재원 on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblNumber1: UILabel!
    @IBOutlet weak var lblNumber2: UILabel!
    @IBOutlet weak var tfAnswer: UITextField!
    @IBOutlet weak var lblTotalResult: UILabel!
    
    var totalCount:Int = 0
    var answerNumber:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getRandomNumber()
        
        lblTotalResult.text = "\(totalCount)문제 맞추셨습니다."
    } // viewDidLoad


    
    @IBAction func btnAnswer(_ sender: UITextField) {
        

        switch checkNil(str: tfAnswer.text) {
        case false:
            AlertResult(number1: lblNumber1.text!, number2: lblNumber2.text!, userAnswer: tfAnswer.text)
        default:
            // ( Alert : Controller - Action - addAction - present )
            let alertEmptyError  = UIAlertController(title: "오류", message: "숫자를 압력해주세요!", preferredStyle: .alert)
            let alertError = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: { ACTION in
                self.tfAnswer.becomeFirstResponder()
            })
            alertEmptyError.addAction(alertError)
            present(alertEmptyError, animated: true, completion: nil)
        }
        
    }
    
    
    // Alert Func
    func AlertResult(number1: String, number2: String, userAnswer: String!) {
        
        answerNumber = Int(number1)! * Int(number2)!
        

    }
    
    
    func checkNil(str: String!) -> Bool{
          let check = str.trimmingCharacters(in: .whitespacesAndNewlines)
            if check.isEmpty{
                return true
            }else{
                return false
            }
        }
        

    
    
    
    // get Random Number
    func getRandomNumber() {
        lblNumber1.text = "\(String(Int.random(in: 1..<10)))"
        lblNumber2.text = "\(String(Int.random(in: 1..<10)))"
    }
    
    
    
} // ViewController

