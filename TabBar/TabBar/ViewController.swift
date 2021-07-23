//
//  ViewController.swift
//  TabBar
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
        // Tab Bar 의 1번 으로 가라! (순서 배열과 같음)
        tabBarController?.selectedIndex  = 1
        
    }
    
    @IBAction func btnGoDatePicker(_ sender: UIButton) {
        tabBarController?.selectedIndex  = 2
    }
    

}

