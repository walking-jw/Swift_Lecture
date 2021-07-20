//
//  ViewController.swift
//  AlertActionSheet
//
//  Created by 박재원 on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnAlert(_ sender: UIButton) {
        // Controller 초기화
        let testAlert = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        
        
        // AlertAction ( handler 에서는 Clouser 형태 사용 )
        let actionDefault = UIAlertAction(title: "Action Default", style: .default, handler: nil)
        let actionDestructive = UIAlertAction(title: "Action Destructive", style: .destructive, handler: {ACTION in
            print("destructive action called.")
        }) // // ACTION in 이후에 코드! : 함수를 불러와도 상관 없다.
        let actionCancel = UIAlertAction(title: "Action Cancel", style: .cancel, handler: nil)
        
        
        // Controller와 Action 결합
        testAlert.addAction(actionDefault)
        testAlert.addAction(actionDestructive)
        testAlert.addAction(actionCancel)
        
        // 화면 띄우기
        present(testAlert, animated: true, completion: nil)
        
        // Controller : 타이틀과 메세지
        // Action : 버튼들
        
        
        
    }
    
    @IBAction func btnActionSheet(_ sender: UIButton) {
        // Controller 초기화
        let testAlert = UIAlertController(title: "Title", message: "Message", preferredStyle: .actionSheet)
        
        
        // AlertAction ( handler 에서는 Clouser 형태 사용 )
        let actionDefault = UIAlertAction(title: "Action Default", style: .default, handler: nil)
        let actionDestructive = UIAlertAction(title: "Action Destructive", style: .destructive, handler: {ACTION in
            print("destructive action called.")
        }) // // ACTION in 이후에 코드! : 함수를 불러와도 상관 없다.
        let actionCancel = UIAlertAction(title: "Action Cancel", style: .cancel, handler: nil)
        
        
        // Controller와 Action 결합
        testAlert.addAction(actionDefault)
        testAlert.addAction(actionDestructive)
        testAlert.addAction(actionCancel)
        
        // 화면 띄우기
        present(testAlert, animated: true, completion: nil)
        
        // Controller : 타이틀과 메세지
        // Action : 버튼들
        
        
    }
    
    
} // ViewController

