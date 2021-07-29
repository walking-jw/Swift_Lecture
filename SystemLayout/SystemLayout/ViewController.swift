//
//  ViewController.swift
//  SystemLayout
//
//  Created by 박재원 on 2021/07/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfUserid: UITextField!
    @IBOutlet weak var tfUserPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnOK(_ sender: UIButton) {
        if tfUserid.text == "aaa" && tfUserPassword.text == "1111"{
            
            // Struct 를 통해 ID 값 가져가기
            Share.userID = tfUserid.text!
            
            // Segue 많아지면 혼동될때! (상황에 따라 같은 버튼에서 여러 segue로 가게하기)
            self.performSegue(withIdentifier: "afterChecking", sender: self)
            
            /// [중요사항]
            // 이러면 Button 도 넘어가는 기능이 있기때문에! 두번 넘어간다.
            // Button 에 segue 를 연결하지 말고
            // ViewController 와 다음 View 를 연결해주고 사용해야 한번만 넘어간다!
            //
            // Web에서는 static 를 사용하면 메모리문제가 있지만, mobile 은 각자 devise 사용이기때문에 상관없다!
            //
            /// * * * * * * * * * * * * * * * * * * * *
            
        }else{
            let idAlert = UIAlertController(title: "경고", message: "아이디와 패스워드를 확인해주세요", preferredStyle: .alert)
            let idAction = UIAlertAction(title: "Yes", style: .default, handler: nil)
            idAlert.addAction(idAction)
            present(idAlert, animated: true, completion: nil)
        }
        
    }
    
    
    
}

