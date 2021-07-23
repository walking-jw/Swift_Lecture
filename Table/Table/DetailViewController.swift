//
//  DetailViewController.swift
//  Table
//
//  Created by 박재원 on 2021/07/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var lblItem: UILabel!
    
    var receiveItem = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblItem.text = receiveItem
    }
    
    func receiveItems(_ item: String) {
        // TableViewController 는 이 함수를 실행 시킬 것임
        receiveItem = item
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
