//
//  JsonModel.swift
//  ServerJson_01
//
//  Created by 박재원 on 2021/07/27.
//

import Foundation

protocol JsonModelProtocol{
    func itemDownloaded(items:NSArray)
}

// NSArray 사용하는 이유 : [ ] 안에 String, Int 를 같이 쓸 수 있다.
// NS 라고 쓰여있는 것이 가장 큰 단위이다.

class JsonModel{
    // Protocol 을 가지고 있음
    var delegate: JsonModelProtocol!
    let urlPath = "http://172.20.10.6:8080/ios/student.json"
    
    func downloadItems(){
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            if error != nil{
                print("Failed to download data")
            }else{
                print("Data is downloaded")
                self.parseJSON(data!)
            }
            
        } // task
        task.resume()
    } // download
    
    // Async 방식
    func parseJSON(_ data: Data) {
        var jsonResult = NSArray()
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
        }catch let error as NSError{
            print(error)
        }
        
        var jsonElement = NSDictionary()
        let locations = NSMutableArray()
        
        for i in 0..<jsonResult.count{
            // Json 형태가 Kay&Value 형태로 되어있어서 그렇다.
            jsonElement = jsonResult[i] as! NSDictionary
            if let scode = jsonElement["code"] as? String,
               let sname = jsonElement["name"] as? String,
               let sdpet = jsonElement["dept"] as? String,
               let sphone = jsonElement["phone"] as? String{
                // 이상이 없으면 넣어준다.
                let query = DBModel(scode: scode, sname: sname, sdept: sdpet, sphone: sphone)
                locations.add(query)
            }
            
        } // for
        
        // tableView에서 작업하는 것과 동시에 이루어진다 = Async
        DispatchQueue.main.async(execute: {() -> Void in
            // delegate = JsonModelProtocol
            self.delegate.itemDownloaded(items: locations)
        })
    }
    
} // JsonModel
