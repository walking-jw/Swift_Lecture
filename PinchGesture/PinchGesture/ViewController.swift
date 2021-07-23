//
//  ViewController.swift
//  PinchGesture
//
//  Created by 박재원 on 2021/07/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgPinch: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        // Pinch Setup
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_ :)))
        self.view.addGestureRecognizer(pinch)    // 화면 전체로 확대가능 = view
        
        // selectore 는 .doPinch 처럼 만들때 빈값은 넣어줘야한다 = (_ :)
        
    } // viewDidLoad

    @objc func doPinch(_ pinch: UIPinchGestureRecognizer){
        
        // 크기는 pinch 가 알고있다. pinch 자체가 유저가 늘린 크기랑 위치값을 가지고 있기 떄문에
        // pinch.scale = pinch 가 알고 있는 크기값
        imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
        
    } // doPinch
    
    // 에뮬레이터에서 확대하는 방법 = option + 드래그
    
} // ViewController

