//
//  DeleteModel.swift
//  DBCrud
//
//  Created by 박재원 on 2021/07/28.
//

import Foundation

class DeleteModel{
    // URL
    var urlPath = "http://192.168.35.219:8080/ios/studentDelete_ios.jsp"
    
    // Insert 는 argument 필요
    func deleteItems(code: String) -> Bool {
        
        // jsp가 작동이 됐는지 확인값
        var result: Bool = true
        
        // Url Setting
        let urlAdd = "?code=\(code)"
        urlPath = urlPath + urlAdd
        
        // 한글 url encoding (%붙은 글씨로 변경해주기)
        urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        // Task Setting
        let url: URL = URL(string: urlPath)!
        let defaultSession = URLSession(configuration: URLSessionConfiguration.default)
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            if error != nil{
                // Delete Fail
                print("Failed to delete data")
                result = false
            }else{
                // Delete Success
                print("Data is deleted!")
                result = true
            }
    
        } // task
        task.resume()
        return result
    } // deleteItems
    
} // deleteModel
