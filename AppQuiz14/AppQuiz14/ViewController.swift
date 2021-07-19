//
//  ViewController.swift
//  AppQuiz14
//
//  Created by 박재원 on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    // Outlet * * * * *
    @IBOutlet weak var lblImageName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    // 전역변수 * * * * *
    
    // 이미지 파일 순서 & 이름들
    var numImage = 0
    var imageName = ["flower_01.png", "flower_02.png", "flower_03.png", "flower_04.png", "flower_05.png", "flower_06.png"]
    
    // Timer Settings
    let interval = 3.0
    let timeSelector: Selector = #selector(ViewController.imageChangeTimer)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 처음 그림 보여주기 [0번째 그림]
        displayImage(numImage: numImage)
        
        // Timer Setting
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
    } // viewDidLoad

    // 시간마다 그림 바꿔주기 * * * * *
    @objc func imageChangeTimer(){
        numImage += 1
        if numImage == imageName.count {
            numImage = 0
        }
        displayImage(numImage: numImage)
   
    } // imageChangeTimer
    
    // 그림 보여주기 * * * * *
    func displayImage(numImage: Int){
        lblImageName.text = imageName[numImage]
        imageView.image = UIImage(named: imageName[numImage])
        
    } // displayImage
    

}

