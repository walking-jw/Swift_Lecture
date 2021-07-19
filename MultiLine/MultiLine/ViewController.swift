//
//  ViewController.swift
//  MultiLine
//
//  Created by 박재원 on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfInput: UITextField!
    @IBOutlet weak var tvResult: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tvResult.isEditable = false
        
    }

    @IBAction func btnAppend(_ sender: UIButton) {
//        tvResult.text = tfInput.text!
//        tvResult.text += tfInput.text!  // 이렇게 하면 지속적으로 추가
//        tvResult.text += tfInput.text! + "\n"    // 띄어쓰기까지!
        
        // 그런데 이러면 공백상태로 넣으면 띄어쓰기만 들어감.
        
        let strInput = tfInput.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        // 이거로 공백을 지운다.
        
        if strInput.isEmpty {
            tvResult.text += tfInput.text! + "\n"
        }
        
        
        // 함수를 쓸때 = 다른데서도 똑같이 쓸때! = 함수
        
        
        
    }
    
    
    
} // 커맨드 키 누르고 func 가져다 대면 범위가 보인다.

