//
//  ViewController.swift
//  AppQuiz11
//
//  Created by ë°ėŽė on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tvResult: UITextView!
    @IBOutlet weak var tfMessage: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnSend(_ sender: UIButton) {
        tvResult.text += tfMessage.text! + "\n"
        tfMessage.text?.removeAll()
        
    }
    
    @IBAction func btnEmoji(_ sender: UIButton) {
        tfMessage.text! += "ð"
        
    }
    
}

