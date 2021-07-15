//
//  ViewController.swift
//  Emoji
//
//  Created by 박재원 on 2021/07/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblEmoji: UILabel!
    var arrEmoji = ["😀","😅","😂","🥲","😍","😎"]
    //                 0 , 1  2, 3 4 5
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblEmoji.text = arrEmoji[index]
    }

    @IBAction func btnPlay(_ sender: UIButton) {
        index += 1
        if index == arrEmoji.count {
            index = 0
        }
        
        lblEmoji.text = arrEmoji[index]
        
        
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        index -= 1
        if index <= -1 {
            index = arrEmoji.count - 1
        }
        
        lblEmoji.text = arrEmoji[index]
    }
} // ViewController



