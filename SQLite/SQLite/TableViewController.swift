//
//  TableViewController.swift
//  SQLite
//
//  Created by 박재원 on 2021/07/27.
//

import UIKit
import SQLite3 // <<<<<

class TableViewController: UITableViewController {

    // Outlet
    @IBOutlet var tvListView: UITableView!
    
    // Global Variable
    var db: OpaquePointer?
    var studentsList:[Students] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // SQLite 생성하기 * * * * * * * * * * * * *
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("StudentData.sqlite")
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK{
            // SQLite가 열리지 않으면?
            print("error opening database")
        }
        
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS students(sid INTEGER PRIMARY KEY AUTOINCREMENT, sname TEXT, sdept TEXT, sphone TEXT)", nil, nil, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table : \(errmsg)")
        }
        // * * * * * * * * * * * * * * * * * * * *
        
        // Temporary Insert
//        tempInsert()
        
        // DB내용 불러오기
        readValues()
        
    } // viewDidLoad

    override func viewWillAppear(_ animated: Bool) {
        readValues()
        tvListView.reloadData()
    }
    
    
    func tempInsert() {
        // Statement
        var stmt: OpaquePointer?
        // 한글 깨짐 방지 (-1 는 2byte의 범위를 잡아주는 것이다)
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
        
        let queryString = "INSERT INTO students(sname, sdept, sphone) VALUES (?,?,?)"
        
        // != SQLITE_OK 가 아니면 {  } 실행
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert : \(errmsg)")
            return    // return 할께 없는게 이게 있으면? 그냥 함수를 빠져나가는 것이다!
        }
        
        // 1번째 VALUES(?) 처리
        if sqlite3_bind_text(stmt, 1, "재원", -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error binding name : \(errmsg)")
            return
        }
        // 2번째 VALUES(?) 처리
        if sqlite3_bind_text(stmt, 2, "프랑스어과", -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error binding dept : \(errmsg)")
            return
        }
        // 3번째 VALUES(?) 처리
        if sqlite3_bind_text(stmt, 3, "010-1111-3333", -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error binding phone : \(errmsg)")
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
        print("Students saved successfully")
        
    } // tempInsert
    
    
    func readValues() {
        // Init Array
        studentsList.removeAll()
        
        // Query
        let queryString = "SELECT * FROM students"
        
        // Statement
        var stmt: OpaquePointer?
        
        //
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing select : \(errmsg)")
            return
        }
        
        // 한줄씩 가져오기
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            // Int 값 불러오기
            let id = sqlite3_column_int(stmt, 0)
            // String 값 불러오기
            let name = String(cString: sqlite3_column_text(stmt, 1))
            let dept = String(cString: sqlite3_column_text(stmt, 2))
            let phone = String(cString: sqlite3_column_text(stmt, 3))
            
            // Data 잘 들어갔나 확인
            print(id, name, phone)
            
            // describing:
            studentsList.append(Students(id: Int(id), name: String(describing: name), dept: String(describing: dept), phone: String(describing: phone)))
        }
        // 값이 들어왔으면 재구성
        self.tvListView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return studentsList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        // Configure the cell...
        
        // DB에서 값을 받아오는 것
        let students: Students
        students = studentsList[indexPath.row]
        
        // 이름은 정해져있다. (detailTextLabel)
        cell.textLabel?.text = "학번 : \(students.id)"
        cell.detailTextLabel?.text = "성명 : \(students.name!)"
        
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgDetail"{
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            // 이상황이면 indexPath가 몇번째 자리인지 알고 있다.
            
            let detailView = segue.destination as! DetailViewController
            // DetailViewController 에 있는 함수에 값을 넣어준다
            detailView.receiveItems(studentsList[indexPath!.row].id,
                                    studentsList[indexPath!.row].name ?? "",
                                    studentsList[indexPath!.row].dept ?? "",
                                    studentsList[indexPath!.row].phone ?? "")
        }
    } // prepare
    

} // TableViewController
