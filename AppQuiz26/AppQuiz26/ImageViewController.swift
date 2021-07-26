//
//  ImageViewController.swift
//  AppQuiz26
//
//  Created by 박재원 on 2021/07/26.
//

import UIKit

class ImageViewController: UIViewController {

    var receiveImageName = ""
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageView.image = UIImage(named: receiveImageName)
    }
    
    func receiveItems(_ imageName: String) {
        
        receiveImageName = imageName
        
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
