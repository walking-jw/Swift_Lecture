//
//  ViewController.swift
//  textImage
//
//  Created by 박재원 on 2021/07/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgunder: UIImageView!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var imgup: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgunder.image = UIImage(named: "swift.png")
        imgup.image = UIImage(named: "tomcat.png")
        
        
    }
    @IBAction func btn(_ sender: UIButton) {
        
    }
    
    func imgchange() {
        <#function body#>
    }
    
}

