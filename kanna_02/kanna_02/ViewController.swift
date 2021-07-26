//
//  ViewController.swift
//  Kanna_02
//
//  Created by 박재원 on 2021/07/26.
//

import UIKit
import Kanna

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dataCrawling()
        
    }

    func dataCrawling(){
        
        let mainUrl = "https://www.rottentomatoes.com/top/bestofrt/?year=2019"
        guard let main = URL(string: mainUrl) else {
            print("Error : \(mainUrl) doesn't seem to be a valid URL")
            return
        }
        // nil 값이 안들어왔으면 아래 실행
        do{
            // 크롬 > 도구더보기 > 개발자도구 > 화살표 클릭 > copy xpath
            // //*[@id="top_movies_main"]/div/table/tbody/tr[1]/td[3]/a
        
            let htmlData = try String(contentsOf: main, encoding: .utf8)
            let doc = try HTML(html: htmlData, encoding: .utf8)
            
            var count = 1
            // " 는 ' 로 바꿔줬음 ( "" 으로 묶으면 안쪽에 있는 " 때문에 혼동되기 때문에 )
            // [1] 이런거 지워줘야함!
            for title in doc.xpath("//*[@id='top_movies_main']/div/table/tr/td/a"){
                print(count, title.text!.trimmingCharacters(in: .whitespacesAndNewlines))
                count += 1
            }
            
        }catch let error{
            print("Error : \(error)")
        }
        
        
    }
    

}

