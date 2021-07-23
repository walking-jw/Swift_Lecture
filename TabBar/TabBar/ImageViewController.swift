//
//  ViewController.swift
//  ImageView
//
//  Created by 박재원 on 2021/07/19.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnResize: UIButton!
    
    // 전역볂수로 선언해서 모두 사용 가능하게 해주었다!
    // 이 부분은 모두 Comment가 있어야 정상이다.
    
    var imgOn: UIImage?    // 켜진 전구 이미지
    var imgOff: UIImage?   // 꺼진 전구 이미지
    
    var isZoom = false     // 이미지 확대 여부
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 이미지 파일 준비
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        // 이미지 할당 (상태변수, set status)
        imgView.image = imgOn
    }

    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale: CGFloat = 2.0
        var newWidth: CGFloat
        var newHeight: CGFloat
        
        if isZoom {
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
            btnResize.setTitle("Image 확대", for: .normal)
        } else{
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
            btnResize.setTitle("Image 축소", for: .normal)
        }
        
        // 그림 그려주기
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        // 중요함! ( future : current )
        isZoom = !isZoom
        
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        
        switch  sender.isOn {
        case true:
            imgView.image = imgOn
        default:
            imgView.image = imgOff
        }
        
//        if sender.isOn{
//            // 스위치가 On 상태면
//            imgView.image = imgOn
//        } else{
//            imgView.image = imgOff
//        }
    }
    
    
}

