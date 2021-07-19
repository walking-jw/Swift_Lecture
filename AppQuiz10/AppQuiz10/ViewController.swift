//
//  ViewController.swift
//  AppQuiz10
//
//  Created by 박재원 on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfInputNum: UITextField!
    @IBOutlet weak var tvResult: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func btnResult(_ sender: Any) {
        let dan = Int(tfInputNum.text!)!
        if tfInputNum.text?.count == 0 {
            tvResult.text = "단을 입력해주세요"
        }else{
            for number in 1..<10{
                tvResult.text = "\(dan) * \(number) = \(dan * number)\n"
            }
        }
        
        
    }
    
    

}

