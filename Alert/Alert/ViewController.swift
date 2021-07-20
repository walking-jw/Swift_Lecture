//
//  ViewController.swift
//  Alert
//
//  Created by 박재원 on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lampImage: UIImageView!
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    let imgRemove = UIImage(named: "lamp_remove.png")
    
    var isLampOn = false   // // 상태변수 (Lamp State)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lampImage.image = imgOff
        
    } // viewDidLoad

    @IBAction func btnLampOn(_ sender: UIButton) {
        if isLampOn {
            // Alert : Controller - Action - addAction - present
            lampOnOff(lampisOn: true)
            // animated : false -> 창이 빨리뜸
            
        }else{
            // 램프가 꺼져있는 상태
            self.turnOnOff(lampisOn: false)
        }
        
    } // btnLampOn
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        
        switch isLampOn {
        case true:
            // 램프가 켜져있을 때 ( Alert : Controller - Action - addAction - present )
            let lampOffAlert  = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: .alert)
            let offActionYes = UIAlertAction(title: "네", style: .default, handler: { ACTION in
                self.turnOnOff(lampisOn: true)  // 전구 끄기
            })
            let offActionNo = UIAlertAction(title: "아니오", style: .default, handler: nil)
            lampOffAlert.addAction(offActionYes)
            lampOffAlert.addAction(offActionNo)
            present(lampOffAlert, animated: true, completion: nil)
            
        default:
            lampOnOff(lampisOn: false)
        }
        
    } // btnLampOff
    
    @IBAction func btnLampRemove(_ sender: UIButton) {
        let lampRemoveAlert  = UIAlertController(title: "램프 제거?", message: "램프를 제거 할까요?", preferredStyle: .alert)
        let lampOff = UIAlertAction(title: "아니오 끕니다.", style: .default, handler: {ACTION in
            switch self.isLampOn {
            case true:
                // 켜져있을 때 -> 꺼야함
                self.turnOnOff(lampisOn: true)
            default:
                // 꺼져있을 때 -> 알림창
                self.lampOnOff(lampisOn: false)
            }
        })
        let lampOn = UIAlertAction(title: "아니오 켭니다.", style: .default, handler: {ACTION in
            switch self.isLampOn {
            case true:
                // 켜져있을 떄 -> 알림창
                self.lampOnOff(lampisOn: true)
            default:
                // 꺼져있을 때 -> 켜야함
                self.turnOnOff(lampisOn: false)
            }
            
        })
        let lampRemove = UIAlertAction(title: "네, 제거합니다.", style: .default, handler: {_ in
            self.lampImage.image = self.imgRemove
            self.isLampOn = false
        })
        lampRemoveAlert.addAction(lampOff)
        lampRemoveAlert.addAction(lampOn)
        lampRemoveAlert.addAction(lampRemove)
        present(lampRemoveAlert, animated: true, completion: nil)
        
        
    } // btnLampRemove
    
    func turnOnOff(lampisOn: Bool) {
        switch lampisOn {
        case true:
            // 램프 켜져있다 -> 꺼야함
            self.lampImage.image = self.imgOff
            self.isLampOn = false
        default:
            // 램프 꺼져있다 -> 켜야함
            lampImage.image = imgOn
            isLampOn = true
        }
    }
    
    func lampOnOff(lampisOn: Bool){
        switch lampisOn {
        case true:
            // 램프가 켜져있을때
            // Alert : Controller - Action - addAction - present
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On 상태입니다", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다", style: .default, handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        default:
            // 램프가 꺼져있을때
            // 램프가 꺼져있을 때 ( Alert : Controller - Action - addAction - present )
            let lampOffAlert = UIAlertController(title: "경고", message: "현재 Off 상태입니다", preferredStyle: .alert)
            let offAction = UIAlertAction(title: "네, 알겠습니다", style: .default, handler: nil)
            lampOffAlert.addAction(offAction)
            present(lampOffAlert, animated: true, completion: nil)
        }
    } // lampOnOff
    
    
    
    
} // ViewController

