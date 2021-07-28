//
//  TableViewController.swift
//  ServerJson_02
//
//  Created by 박재원 on 2021/07/28.
//

import UIKit

class TableViewController: UITableViewController {

    // App을 종료하지 않고 나가도 사라지면 weak
    // App을 종료해야만 사라지는게 strong
    @IBOutlet var listTableView: UITableView!
    // NSArray
    var feedItem:NSArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let jsonModel = JsonModel()
        jsonModel.delegate = self
        jsonModel.downloadItems()
        
        // Cell의 크기를 정한다.
        listTableView.rowHeight = 125
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    } // viewDidLoad

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // feedItem = NSArray 형태로 DB에서 받아오는 값
        return feedItem.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell
        // **** as! <# 만들어둔 Custom Cell #>

        // Configure the cell...
        let item: DBModel = feedItem[indexPath.row] as! DBModel
        
        // as! <# 만들어둔 Custom Cell #> 에 있는 Object 이름으로 쓰기
        // upwrapping !
        cell.lblCode.text = "학번 : \(item.scode!)"
        cell.lblName.text = "이름 : \(item.sname!)"
        cell.lblDept.text = "전공 : \(item.sdept!)"
        cell.lblPhone.text = "연락처 : \(item.sphone!)"
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

} // TableViewController

/// Extension
extension TableViewController: JsonModelProtocol{
    func itemDownloaded(items: NSArray) {
        feedItem = items
        // * * * Data 받아온 시점 * * *
        
        self.listTableView.reloadData()
    }
    
}
