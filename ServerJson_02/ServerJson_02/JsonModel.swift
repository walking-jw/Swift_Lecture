//
//  JsonModel.swift
//  ServerJson_02
//
//  Created by 박재원 on 2021/07/28.
//

import Foundation

protocol JsonModelProtocol{
    func itemDownloaded(items:NSArray)
}


class JsonModel{
    // Protocol 을 가지고 있음
    var delegate: JsonModelProtocol!
    let urlPath = "http://192.168.35.219:8080/ios/student.json"
    
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
        }catch let error as NSError{
            print(error)
        }
        
        var jsonElement = NSDictionary()
        let locations = NSMutableArray()
        
        for i in 0..<jsonResult.count{
            jsonElement = jsonResult[i] as! NSDictionary
            if let scode = jsonElement["code"] as? String,
               let sname = jsonElement["name"] as? String,
               let sdpet = jsonElement["dept"] as? String,
               let sphone = jsonElement["phone"] as? String{
                let query = DBModel(scode: scode, sname: sname, sdept: sdpet, sphone: sphone)
                locations.add(query)
            }
            
        } // for
        
        DispatchQueue.main.async(execute: {() -> Void in
            // delegate = JsonModelProtocol
            self.delegate.itemDownloaded(items: locations)
        })
    }
    
} // JsonModel
