//
//  EditViewController.swift
//  Navigation
//
//  Created by 박재원 on 2021/07/22.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var lblWay: UILabel!
    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var lblOnOff: UILabel!
    @IBOutlet weak var swIsOn: UISwitch!
    
    // segue 용
    var textWayValue: String = ""
    var textMessage: String = ""
    
    // protocol 용
    var delegate: EditDelegate?
    
    // ViewController 에 있는 상태변수 값을 여기로 가져와야한다!
    var isOn: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        // ViewController 는 viewDidLoad 는 계속 실행되는 것이 아니라 prepare 에서 적용
        
        
        
        lblWay.text = textWayValue
        tfMessage.text = textMessage
    
        
        // 스위치에 상태 적용시켜주기
        swIsOn.isOn = isOn
        if isOn{
            // 전역변수 isOn이 true 면?
            lblOnOff.text = "On"
        }else{
            lblOnOff.text = "Off"
        }
        
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            // self 에 있는 값을 넘겨줄게.
            delegate?.didMessageEditDone(self, message: tfMessage.text!)
            // 지금 여기에 있는 Bool 값 넘겨줄게.
            delegate?.didImageOnOffDone(self, isOn: isOn)
            
        }
        // 값 넘겨줬으니 해당 페이지 닫기
        // pop : 뒤에서부터 하나씩 없앤다 ( in Python )
        // animated: true  - 부드럽게 없어짐  / false  -  팍 없어짐
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func swImageOff(_ sender: UISwitch) {
        // 스위치 작동하면 바꿔주는 것들.
        if sender.isOn{
            isOn = true
            lblOnOff.text = "On"
        }else{
            isOn = false
            lblOnOff.text = "Off"
        }
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
