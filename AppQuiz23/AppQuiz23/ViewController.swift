//
//  ViewController.swift
//  AppQuiz23
//
//  Created by 박재원 on 2021/07/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnGoImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex  = 1
    }
    
}

