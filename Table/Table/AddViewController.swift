//
//  AddViewController.swift
//  Table
//
//  Created by 박재원 on 2021/07/22.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var tfAddItem: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
        
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        // 배열에 값 넣어주기
        items.append(tfAddItem.text!)
        itemsImageFile.append("clock.png")
        navigationController?.popViewController(animated: true)
        
    }
    
    
    
    // 해당 화면에서 또 다른 페이지로 넘어가는 것을 예상해서 준비가 되어있는 것임.
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
