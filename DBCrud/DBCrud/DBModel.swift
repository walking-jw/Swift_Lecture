//
//  DBModel.swift
//  DBCrud
//
//  Created by 박재원 on 2021/07/28.
//

import Foundation

class DBModel: NSObject{
    
    /// Property
    var scode: String?
    var sname: String?
    var sdept: String?
    var sphone: String?
    
    /// Empty Constructor
    override init() {
    
    }
    
    /// Constructor
    init(scode: String, sname: String, sdept: String, sphone: String) {
        self.scode = scode
        self.sname = sname
        self.sdept = sdept
        self.sphone = sphone
    }
 
} // DBModel
