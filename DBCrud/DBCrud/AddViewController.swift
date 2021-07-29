//
//  AddViewController.swift
//  DBCrud
//
//  Created by 박재원 on 2021/07/28.
//

import UIKit

class AddViewController: UIViewController {

    /// Outlet
    @IBOutlet weak var tfCode: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfDept: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    } // viewDidLoad
    
    @IBAction func btnInsert(_ sender: UIButton) {
        let code = tfCode.text
        let name = tfName.text
        let dept = tfDept.text
        let phone = tfPhone.text
        
        let insertModel = InsertModel()
        let result = insertModel.insertItems(code: code!, name: name!, dept: dept!, phone: phone!)
        
        // Insert 작동 확인
        if result{
            // Insert Success
            let resultAlert = UIAlertController(title: "Insert Complete", message: "Insert info Successfully", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "OK", style: .default, handler: {_ in
                self.navigationController?.popViewController(animated: true)
            })
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
        }else{
            // Insert Fail
            let resultAlert = UIAlertController(title: "Insert Fail", message: "Insert info Error", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "OK", style: .default, handler: {_ in
                self.navigationController?.popViewController(animated: true)
            })
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
            
            
        }
        
    }
    

} // AddViewController
