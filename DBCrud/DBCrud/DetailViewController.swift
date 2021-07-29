//
//  DetailViewController.swift
//  DBCrud
//
//  Created by 박재원 on 2021/07/28.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tfCode: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfDept: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    
    // DB 받기 (TableViewCell -> prepare)
    var receiveStudentInfo: DBModel = DBModel.init(scode: "", sname: "", sdept: "", sphone: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initTextFields()
    }
    
    // TextField 값 구성하기
    func initTextFields() {
        tfCode.text = receiveStudentInfo.scode
        tfName.text = receiveStudentInfo.sname
        tfDept.text = receiveStudentInfo.sdept
        tfPhone.text = receiveStudentInfo.sphone
    }
    
    // prepare 로 받아오기
    func receiveStudentInfos(_ student: DBModel){
        // 받아온 값 전역변수로 적용
        receiveStudentInfo = student
    } // receiveStudentInfos
    
    // Update Button
    @IBAction func btnUpdate(_ sender: UIButton) {
        let code = tfCode.text
        let name = tfName.text
        let dept = tfDept.text
        let phone = tfPhone.text
        
        let updateModel = UpdateModel()
        let result = updateModel.updateItems(code: code!, name: name!, dept: dept!, phone: phone!)
        
        // Update 작동 확인
        if result{
            // Update Success
            let resultAlert = UIAlertController(title: "Update Complete", message: "Update info Successfully", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "OK", style: .default, handler: {_ in
                self.navigationController?.popViewController(animated: true)
            })
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
        }else{
            // Update Fail
            let resultAlert = UIAlertController(title: "Update Fail", message: "Update info Error", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "OK", style: .default, handler: {_ in
                self.navigationController?.popViewController(animated: true)
            })
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
            
        }
    } // btnUpdate
    
    
    // Delete Button
    @IBAction func btnDelete(_ sender: UIButton) {
        let code = tfCode.text
        
        let deleteModel = DeleteModel()
        let result = deleteModel.deleteItems(code: code!)
        
        // Delete 작동 확인
        if result{
            // Delete Success
            let resultAlert = UIAlertController(title: "Delete Complete", message: "Delete info Successfully", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "OK", style: .default, handler: {_ in
                self.navigationController?.popViewController(animated: true)
            })
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
        }else{
            // Delete Fail
            let resultAlert = UIAlertController(title: "Delete Fail", message: "Delete info Error", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "OK", style: .default, handler: {_ in
                self.navigationController?.popViewController(animated: true)
            })
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
            
        }
    } // btnDelete
    
    
    
    
    
    
    
} // DetailViewController
