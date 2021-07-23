//
//  DetailViewController.swift
//  AppQuiz24
//
//  Created by 박재원 on 2021/07/23.
//

import UIKit

class DetailViewController: UIViewController {

    var receiveItem = ""
    var receiveImage = ""
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblImageName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblImageName.text = receiveItem
        imgView.image = UIImage(named: receiveImage)
        
    }
    
    func receiveItems(_ item: String, _ image: String) {
        // TableViewController 는 이 함수를 실행 시킬 것임
        receiveItem = item
        receiveImage = image
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
