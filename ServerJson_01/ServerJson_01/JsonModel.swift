//
//  JsonModel.swift
//  ServerJson_01
//
//  Created by 박재원 on 2021/07/27.
//

import Foundation

// protocol은 이름만 있지만 기능은 없다.
// 기능은 추가적으로 만들어줘야 하는 것이다.
// protocol은 정말로 연결을 하기 위한 장치일뿐
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
        let defaultSession = URLSession(configuration: URLSessionConfiguration.default)
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
                // 들어오는 값을 NSArray로 바꾼다. [  ,  , ] 이런식으로 바꿔줌
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
        
        // 데이터를 TableView에 넘겨주려고 하는데 그때 다른 작업을 TableView하고있다? -> 충돌남
        // 그 상황을 처리하기위해서는 비동기 방식을 사용해야한다.
        // tableView에서 작업하는 것과 동시에 이루어진다 = Async
        DispatchQueue.main.async(execute: {() -> Void in
            // delegate = JsonModelProtocol
            self.delegate.itemDownloaded(items: locations)
        })
    }
    
} // JsonModel
