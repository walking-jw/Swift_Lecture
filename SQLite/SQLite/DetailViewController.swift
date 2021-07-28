//
//  DetailViewController.swift
//  SQLite
//
//  Created by 박재원 on 2021/07/27.
//

import UIKit
import SQLite3

class DetailViewController: UIViewController {

    @IBOutlet weak var tfId: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfDept: UITextField!
    @IBOutlet weak var tfTel: UITextField!
    
    // Global Variable
    var db: OpaquePointer?
    var receiveItems = (0,"","","")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // SQLite 생성하기 * * * * * * * * * * * * *
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("StudentData.sqlite")
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK{
            // SQLite가 열리지 않으면?
            print("error opening database")
        }
        
        initDetails()
        
        
    } // viewDidLoad
    
    // 최초화면 띄우기
    func initDetails(){
        tfId.text = String(self.receiveItems.0)
        tfName.text = String(self.receiveItems.1)
        tfDept.text = String(self.receiveItems.2)
        tfTel.text = String(self.receiveItems.3)
    } // initDetails
    
    // prepare
    func receiveItems(_ id: Int, _ name: String, _ dept: String, _ phone: String) {
        receiveItems = (id, name, dept, phone)
        
    } // receiveItems
    
    // 수정버튼 눌렀을때
    @IBAction func btnUpdate(_ sender: UIButton) {
        updateValues()
        navigationController?.popViewController(animated: true)
        
    } // btnUpdate
    

    @IBAction func btnDelete(_ sender: UIButton) {
        deleteValues()
        navigationController?.popViewController(animated: true)
        
    } // btnDelete
    
    
    func updateValues() {
        var stmt: OpaquePointer?
        // 한글 깨짐 방지 (-1 는 2byte의 범위를 잡아주는 것이다)
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
        
        let queryString = "UPDATE students SET sname = ?, sdept = ?, sphone = ? WHERE sid = ?"
        
        // != SQLITE_OK 가 아니면 {  } 실행
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing update : \(errmsg)")
            return    // return 할께 없는게 이게 있으면? 그냥 함수를 빠져나가는 것이다!
        }
        
        // 1번째 VALUES(?) 처리
        if sqlite3_bind_text(stmt, 1, tfName.text, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error binding name : \(errmsg)")
            return
        }
        // 2번째 VALUES(?) 처리
        if sqlite3_bind_text(stmt, 2, tfDept.text, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error binding dept : \(errmsg)")
            return
        }
        // 3번째 VALUES(?) 처리
        if sqlite3_bind_text(stmt, 3, tfTel.text, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error binding phone : \(errmsg)")
            return
        }
        // 4번째 VALUES(?) 처리
        if sqlite3_bind_text(stmt, 4, tfId.text, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error binding id : \(errmsg)")
            return
        }
        
        // 실행시키기
        if sqlite3_step(stmt) != SQLITE_DONE{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure updating student : \(errmsg)")
            return
        }
        
        // 오류가 있으면 return 으로 함수 밖으로 나가게 되기때문에 여기까지 오지 못한다.
        // 이게 print 되면 이상이 없다는 의미!
        print("Students info saved successfully")
    }
    
    
    
    func deleteValues(){
        var stmt: OpaquePointer?
        // 한글 깨짐 방지 (-1 는 2byte의 범위를 잡아주는 것이다)
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
        
        let queryString = "DELETE FROM students WHERE sid = ?"
        
        // != SQLITE_OK 가 아니면 {  } 실행
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing update : \(errmsg)")
            return    // return 할께 없는게 이게 있으면? 그냥 함수를 빠져나가는 것이다!
        }
        
        // 4번째 VALUES(?) 처리
        if sqlite3_bind_text(stmt, 1, tfId.text, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error binding id : \(errmsg)")
            return
        }
        
        // 실행시키기
        if sqlite3_step(stmt) != SQLITE_DONE{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting student : \(errmsg)")
            return
        }
        
        // 오류가 있으면 return 으로 함수 밖으로 나가게 되기때문에 여기까지 오지 못한다.
        // 이게 print 되면 이상이 없다는 의미!
        print("Students info delete successfully")
        
    }
    
    
} // DetailViewController




func insertValues() {

    // Statement
    var stmt: OpaquePointer?
    
    // 한글 깨짐 방지
    let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
        
    // INSERT 할 DATA 값
    let <#Column1#> = <#TextField1#>.text?.trimmingCharacters(in: .whitespacesAndNewlines)
    let <#Column2#> = <#TextField2#>.text?.trimmingCharacters(in: .whitespacesAndNewlines)
    
    // Query
    let queryString = "INSERT INTO <#TableName#>(<#Column01#>, <#Column02#>) VALUES (?,?)"
        
    // Prepare
    if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
        let errmsg = String(cString: sqlite3_errmsg(db)!)
        print("error preparing insert : \(errmsg)")
        return
    }
        
    // 1번째 VALUES(?) 처리
    if sqlite3_bind_text(stmt, 1, <#Column1#>, -1, SQLITE_TRANSIENT) != SQLITE_OK{
        let errmsg = String(cString: sqlite3_errmsg(db)!)
        print("error binding <#Column1#> : \(errmsg)")
        return
    }
    // 2번째 VALUES(?) 처리
    if sqlite3_bind_text(stmt, 2, <#Column2#>, -1, SQLITE_TRANSIENT) != SQLITE_OK{
        let errmsg = String(cString: sqlite3_errmsg(db)!)
        print("error binding <#Column2#> : \(errmsg)")
        return
    }
    // 실행시키기
    if sqlite3_step(stmt) != SQLITE_DONE{
        let errmsg = String(cString: sqlite3_errmsg(db)!)
        print("failure inserting <#TableName#> : \(errmsg)")
        return
    }
        
    // Result Alert
    let resultAlert = UIAlertController(title: "결과", message: "입력 되었습니다.", preferredStyle: .alert)
    let okAction = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: {_ in
        self.navigationController?.popViewController(animated: true)
    })
    resultAlert.addAction(okAction)
    present(resultAlert, animated: true, completion: nil)
    
} // insertValues
