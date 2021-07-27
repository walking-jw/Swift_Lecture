//
//  ViewController.swift
//  ServerImage
//
//  Created by 박재원 on 2021/07/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Server에 있는 Image를 smartphone에 저장하고 불러오기 * * * * * * * * * * * * * * * * * * * *
    @IBAction func btnImage1(_ sender: UIButton) {
        
        let url: URL = URL(string: "http://192.168.35.219:8080/ios/flower_01.png")!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        // Async Task
        let task = defaultSession.dataTask(with: url){(data, reponse, error) in
            if error != nil{
                // Error
                print("Failed to download data")
            }else{
                print("Data is downloaded")
                DispatchQueue.main.async {
                    self.imgView.image = UIImage(data: data!)
                    // 내 디바이스에 저장하기 [PNG Type]
                    if let image = UIImage(data: data!){
                        if let data = image.pngData(){
                            let filename = self.getDocumentory().appendingPathComponent("copy.png")
                            try? data.write(to: filename)
                        } // if let data
                    } // if let image
                } // async
            } // else
        } // task
        task.resume()
        
    } // btnImage 1
    
    // 저장 위치 찾기 [Type 1]
    func getDocumentory() ->URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    } // Image Upload Type 1 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
    
    // Server에서 바로 띄우기 * * * * * << 요즘 방식
    @IBAction func btnImage2(_ sender: UIButton) {
        
        let url = URL(string: "http://172.20.10.6:8080/ios/flower_02.png")
        let data = try? Data(contentsOf: url!)
        imgView.image = UIImage(data: data!)
        
    } // btnImage2
    
    
} // ViewController

