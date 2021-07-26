//
//  TableViewController.swift
//  Kanna_03
//
//  Created by 박재원 on 2021/07/26.
//

import UIKit
import Kanna

var items:[(Int,String, String)] = []

class TableViewController: UITableViewController {
    
    @IBOutlet var movieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Data Crawling 으로 가져오기
        dataCrawling()
        
        // Navibar 붙여주기
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        
    } // viewDidLoad

    // 크롤링 하는 func
    func dataCrawling(){
        let mainUrl = "https://www.rottentomatoes.com/top/bestofrt/?year=2019"
        guard let main = URL(string: mainUrl) else {
            // nil 값이면 Error 표시
            print("Error : \(mainUrl) doesn't seem to be a valid URL")
            return
        }
        
        // nil 값 없으면 실행
        do{
            let htmlData = try String(contentsOf: main, encoding: .utf8)
            let doc = try HTML(html: htmlData, encoding: .utf8)
            var count = 1
            for title in doc.xpath("//*[@id='top_movies_main']/div/table/tr/td/a"){
                items.append((count, title.text!.trimmingCharacters(in: .whitespacesAndNewlines), "https://www.rottentomatoes.com\(title["href"]!)"))
                count += 1
            }
            
        }catch let error{
            print("Error : \(error)")
        }
    } // dataCrawling
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = "\(String(format:"%2d", items[indexPath.row].0)) : \(items[indexPath.row].1)"
        
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "sgWebView"{
            let cell = sender as! UITableViewCell
                    let indexPath = self.movieTableView.indexPath(for: cell)
            let webView = segue.destination as! WebViewController
                    // DetailViewController 에 있는 함수에 값을 넣어준다
            webView.receiveUrls(items[indexPath!.row].2)
        
        }
        
    }
    

}
