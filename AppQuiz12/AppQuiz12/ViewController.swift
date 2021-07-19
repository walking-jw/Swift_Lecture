//
//  ViewController.swift
//  AppQuiz12
//
//  Created by 박재원 on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    // Outlet
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblSize: UILabel!
    @IBOutlet weak var lblSwitch: UILabel!
    
    // 전역변수
    var imgOn: UIImage?    // 켜진 전구 이미지
    var imgOff: UIImage?   // 꺼진 전구 이미지
    var isZoom = false     // 이미지 확대 여부
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // 이미지 파일 준비
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        // 이미지 할당 (상태변수, set status)
        imageView.image = imgOn
        
    } // viewDidLoad

    
    // 사이즈 조정하기
    @IBAction func switchSize(_ sender: UISwitch) {
        let scale: CGFloat = 2.0
        var newWidth: CGFloat
        var newHeight: CGFloat
        
        switch sender.isOn {
        case true:
            // 전구 확대 스위치 켜져있을 때 (On)
            newWidth = imageView.frame.width * scale
            newHeight = imageView.frame.height * scale
            lblSize.text = "전구 축소"
        default:
            // 전구 확대 스위치 꺼져있을 때 (Off)
            // 전구 확대 스위치 켜져있을 때 (On)
            newWidth = imageView.frame.width / scale
            newHeight = imageView.frame.height / scale
            lblSize.text = "전구 확대"
        }
        
        imageView.frame.size = CGSize(width: newWidth, height: newHeight)
        
    } // switchSize
    
    // 전구 끄고 키기
    @IBAction func switchOnOff(_ sender: UISwitch) {
        switch  sender.isOn {
        case true:
            imageView.image = imgOn
        default:
            imageView.image = imgOff
        }
        
        
    }
    
    
    
    
} // ViewController

