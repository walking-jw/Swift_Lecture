//
//  UpdateModel.swift
//  DBCrud
//
//  Created by 박재원 on 2021/07/28.
//

import Foundation

class UpdateModel{
    // URL
    var urlPath = "http://192.168.35.219:8080/ios/studentUpdate_ios.jsp"
    
    func updateItems(code: String, name: String, dept: String, phone: String) -> Bool {
        
        // jsp가 작동이 됐는지 확인값
        var result: Bool = true
        
        // Url Setting
        let urlAdd = "?code=\(code)&name=\(name)&dept=\(dept)&phone=\(phone)"
        urlPath = urlPath + urlAdd
        
        // 한글 url encoding (%붙은 글씨로 변경해주기)
        urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        // Task Setting
        let url: URL = URL(string: urlPath)!
        let defaultSession = URLSession(configuration: URLSessionConfiguration.default)
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            if error != nil{
                // Update Fail
                print("Failed to update data")
                result = false
            }else{
                // Update Success
                print("Data is updated!")
                result = true
            }
            
        } // task
        task.resume()
        return result
    } // updateItems
    
} // UpdateModel
