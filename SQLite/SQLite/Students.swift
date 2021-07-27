//
//  Students.swift
//  SQLite
//
//  Created by 박재원 on 2021/07/27.
//

import Foundation

class Students{
    
    // property
    var id:Int
    var name: String?        // nil이 들어올 수도 있으니 ? 추가
    var dept: String?
    var phone: String?
    
    // Constructor
    init(id: Int, name:String?, dept:String?, phone: String?) {
        self.id = id
        self.name = name
        self.dept = dept
        self.phone = phone
    }
    
} // Students
