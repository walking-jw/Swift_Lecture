//
//  ViewController.swift
//  Kanna_01
//
//  Created by 박재원 on 2021/07/26.
//

import UIKit
import Kanna

class ViewController: UIViewController {

    let html = """
        
        <html>
            <body>
                <h1>My First Heading</h1>
                <p>과일 상점 과일 종류</p>
                <a class'mylink' id='applelink' href='http://www.apple.com'>Apple</a>
                <ul>
                    <li>사과</li>
                    <li>포도</li>
                    <li>복숭아</li>
            </body>
        </html>
        
        """
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dataCrawling()
    } // viewDidLoad


    func dataCrawling(){
        // try 와 같은 do
        do{
            let doc = try HTML(html: html, encoding: .utf8)
            
            // 전체 출력
            print(doc.text!)
            print("* * * * * * * * * *")
            
            // tag를 찾는 법
            for p in doc.xpath("//p"){
                print(p.text!)
            }
            print("* * * * * * * * * *")
            
            for li in doc.xpath("//li") {
                print(li.text!)
            }
            
        }catch let error{
            print("Error: \(error)")
        }
        
        
    } // dataCrawling
    
    
} // ViewController

