//
//  TableViewController.swift
//  DBCrud
//
//  Created by 박재원 on 2021/07/28.
//

import UIKit

class TableViewController: UITableViewController {
    
    /// Outlet
    @IBOutlet var listTableView: UITableView!
    
    /// NSArray
    var feedItem: NSArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

 
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    } // viewDidLoad

    override func viewWillAppear(_ animated: Bool) {
        // DB 불러오기 :  Data가 수정되면 다시 띄워야하기 때문에 이곳에 쓴다.
        let queryModel = QueryModel()
        queryModel.delegate = self
        
        queryModel.downloadItems()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return feedItem.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        // DBModel 형태라고 정의해줘야 밑에서 하나씩 꺼내서 쓸 수가 있다!!
        let item: DBModel = feedItem[indexPath.row] as! DBModel
        
        cell.textLabel?.text = "성명 : \(item.sname!)"
        cell.detailTextLabel?.text = "학번 : \(item.scode!)"
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            let arrItems = feedItem[indexPath.row] as! DBModel
//
//            let deleteModel = DeleteModel()
//            let result = deleteModel.deleteItems(code: arrItems.scode!)
//            if result{
//                print("")
//            }
//
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgDetail"{
            let cell = sender as! UITableViewCell
            let indexPath = self.listTableView.indexPath(for: cell)
    
            let detailView = segue.destination as! DetailViewController
            detailView.receiveStudentInfos(feedItem[indexPath!.row] as! DBModel)
        }
        
    } // prepare
    

} // TableViewController


extension TableViewController: QueryModelProtocol{
    func itemDownloaded(items: NSArray) {
        feedItem = items
        // * * * Data 받아온 시점 * * *
        
        self.listTableView.reloadData()
    }
    
}
