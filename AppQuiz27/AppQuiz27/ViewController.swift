//
//  ViewController.swift
//  AppQuiz27
//
//  Created by 박재원 on 2021/07/27.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    var index = 0
    var images : [UIImage] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        appendImageViewList()
        imgView.image = images[0]
        //loadImage(index: 0)
        // Do any additional setup after loading the view.
    }
    func appendImageViewList(){
        for i in 1...6 {
            var url = URL(string: "http://192.168.2.12:8080/ios/flower_0\(i).png")
            var data = try? Data(contentsOf: url!)
            images.append(UIImage(data: data!)!)
        }
    }
    @IBAction func btnPrev(_ sender: UIButton) {
        index -= 1
        if index < 0{
            index = images.count - 1
        }else{
            imgView.image = images[index]
        }
    }
    @IBAction func btnNext(_ sender: UIButton) {
        index += 1
        if index >= images.count{
            index = 0
        }else{
            imgView.image = images[index]
        }
    }
}




let url = URL(string: "http://\(<#IPAddress#>)/ios/\(<#imageName#>)")
let data = try? Data(contentsOf: url!)
<#imageView#>.image = UIImage(data: data!)
