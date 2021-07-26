//
//  TableViewController.swift
//  Table
//
//  Created by 박재원 on 2021/07/22.
//

import UIKit

// 변수 선언을 Class 정의 전에 한다.
// 그 이유는 project 전체에서 사용할 수 있게 한다.
// 이 쪽은 class 가 아니라 project 가 관리하는 구역이다. * * * * * * * * * * * * * * * * * * *
// 그리고 '처음뜨는 화면' 에서 해줘야한다.

var items = ["책 구매", "철수와 약속", "스터디 준비하기"]
var itemsImageFile = ["cart.png", "clock.png", "pencil.png"]


class TableViewController: UITableViewController {

    // TableView와 꼭 연결해야한다!!
    @IBOutlet var tvListView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    
        // Edit버튼을 만들고 삭제 기능을 추가하기, 왼쪽으로 배치
        self.navigationItem.leftBarButtonItem = self.editButtonItem
   
    } // viewDidLoad
    
    
    // 위 : 화면 뜨기전에 동작     아래 : 화면 뜬 다음에 동작
    
    // 이 부분이 없으면 viewDidLoad 만 실행되고 있으면 여기까지 동작한다.
    // 화면이 뒤로 숨었다가 다시 나타날때 동작하는 함수이다! (Life Cycle)
    override func viewWillAppear(_ animated: Bool) {
        // 이 메소드로 아래에 있는 함수들 다시한번씩 실행시켜줌.
        tvListView.reloadData()
    }

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
        
        cell.textLabel?.text = items[indexPath.row]
        cell.imageView?.image = UIImage(named: itemsImageFile[indexPath.row])
        
        return cell
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

  
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: indexPath.row)            // 선택한 'row'의 데이터 삭제
            itemsImageFile.remove(at: indexPath.row)   //

            // Delete the row from the data source
             tableView.deleteRows(at: [indexPath], with: .fade)  // Data를 지웠으면 화면에서도 지워주기
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
   
    // 삭제시 Delete 라고 나오는 것 '삭제'로 보이게 하기
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"

    }
    // 목록 순서 바꾸기
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        // 이동할 item 의 위치
        let itemToMove = items[fromIndexPath.row]
        let itemImageToMove = itemsImageFile[fromIndexPath.row]
        
        // 이동할 item 을 삭제
        items.remove(at: fromIndexPath.row)
        itemsImageFile.remove(at: fromIndexPath.row)
        
        // 이동 위치를 찾고 빼내서 그쪽으로 이동한
        items.insert(itemToMove, at: to.row)
        itemsImageFile.insert(itemImageToMove, at: to.row)
    }
        
        
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgDetail"{
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            // 이상황이면 indexPath가 몇번째 자리인지 알고 있다.
            
            let detailView = segue.destination as! DetailViewController
            // DetailViewController 에 있는 함수에 값을 넣어준다
            detailView.receiveItems(items[indexPath!.row])
        }
        
    }
    

    
}
