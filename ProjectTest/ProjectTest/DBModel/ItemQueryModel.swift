//
//  ItemQueryModel.swift
//  ProjectTest
//
//  Created by 박재원 on 2021/07/28.
//

import Foundation

protocol ItemQueryModelProtocol{
    func itemDownloaded(items:NSArray)
}

class ItemQueryModel{
    // Protocol 을 가지고 있음
    var delegate: ItemQueryModelProtocol!
    let urlPath = "http://192.168.35.219:8080/ios/item_query_ios.jsp"
    
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
        
        // 배열만들기 -> Dictionary 만들기 -> Dic 빼서 각각 배열에 저장하기
        
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
            if let tag = jsonElement["tag"] as? String{
                // 이상이 없으면 넣어준다.
                let query = DBItemModel(tag: tag)
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
