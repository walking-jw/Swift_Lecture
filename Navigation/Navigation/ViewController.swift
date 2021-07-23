//
//  ViewController.swift
//  Navigation
//
//  Created by 박재원 on 2021/07/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    

    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    
    // 전구 상태를 알려주는 상태변수
    var isOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 초기 전구 켜진 이미지 넣기
        imgView.image = imgOn

    } // viewDidLoad

    // 어디서 형성된 segue 인지 알 수 있다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segue와 연결되어 있는 Controller 이다.
        // EditViewController 와 연결된 segue 라고 선언
        // 쉽게 말해서 EditViewController 를 대표하는 instance 를 만들어줬다!
        let editViewController = segue.destination as! EditViewController
        
        // EditViewController에 지정해놓은 var 변수에 값을 넘겨주기
        if segue.identifier == "editButton"{
            editViewController.textWayValue = "Segue : Use Button!"
        }else{
            editViewController.textWayValue = "Segue : USer Bar Button!"
        }
        
        // TF에 있는 메세지 전달하기
        editViewController.textMessage = tfMessage.text!
        
        // 이 함수는 EditViewController 가 실행시킨 것이다.
        // 그런데 거기서 실행시킨 함수를 여기서 한다고 꼭 알려줘야한다.
        // delegate 라는 함수에게 self(내 페이지)에서 써도 된다고 권한을 준 것이다.
        editViewController.delegate = self // <<<<<<< Extentsion 만들었으면 꼭!! 이렇게 적용시켜주기
        
        
        // 전구 여기에 지금 상태를 prepare 통해서 알려주기!
        editViewController.isOn = self.isOn
        
    }
    
    
    
} // ViewController

// 새로만든 swift 파일을 쓰려면 extendsion
extension ViewController: EditDelegate{
   
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        tfMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn{
            // 받아온 Bool 값이 true 면? (전구가 on 이면?)
            imgView.image = imgOn
            self.isOn = true    // 전역변수에 있는 isOn 쓰기! = self
        }else{
            imgView.image = imgOff
            self.isOn = false
        }
    }
    
    
}
