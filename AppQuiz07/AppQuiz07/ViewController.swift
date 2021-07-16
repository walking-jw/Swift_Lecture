//
//  ViewController.swift
//  AppQuiz07
//
//  Created by 박재원 on 2021/07/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfNumber01: UITextField!
    @IBOutlet weak var tfNumber02: UITextField!
    @IBOutlet weak var tfResult: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lblResult.text?.removeAll()
    } // viewDidLoad
    
    @IBAction func btnCalc(_ sender: UIButton) {
        if emptyCheck(str01: tfNumber01.text!, str02: tfNumber02.text!) == true, oddCheck(str01: tfNumber01.text!, str02: tfNumber02.text!) == true {
            
            tfResult.text = "\(Int(tfNumber01.text!)! + Int(tfNumber02.text!)!)"
            lblResult.text = "계산을 완료했습니다!"
        }else{
            lblResult.text = "숫자를 확인해주세요"
        }
    } // btnCalc
    
    func emptyCheck(str01: String!, str02: String!) -> Bool {
        if str01.count != 0, str02.count != 0 {
            return true
        }else{
            return false
        }
    } // emptyCheck
    
    func oddCheck(str01: String!, str02: String!) -> Bool {
        if Int(str01!)! % 2 == 0, Int(str02!)! % 2 == 0 {
            return true
        }else{
            return false
        }
    } // oddCheck
    
} // ViewController

