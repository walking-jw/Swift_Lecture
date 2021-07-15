//
//  ViewController.swift
//  AppQuiz06
//
//  Created by 박재원 on 2021/07/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    // 그림은 다 배열이다!
    var numImage = 0
    var imageName = ["flower_01.png", "flower_02.png", "flower_03.png", "flower_04.png", "flower_05.png", "flower_06.png"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lblTitle.text = imageName[numImage]
        imgView.image = UIImage(named: imageName[numImage])
        
    }

    @IBAction func btnPrev(_ sender: UIButton) {
        numImage -= 1
        if numImage <= -1 {
            numImage = imageName.count - 1
        }
        imgView.image = UIImage(named: imageName[numImage])
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        numImage += 1
        if numImage == imageName.count {
            numImage = 0
        }
        imgView.image = UIImage(named: imageName[numImage])
    }
    
    
    
} //ViewController

