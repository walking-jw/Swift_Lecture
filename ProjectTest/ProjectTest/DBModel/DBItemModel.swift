//
//  DBItemModel.swift
//  ProjectTest
//
//  Created by 박재원 on 2021/07/28.
//

import Foundation

class DBItemModel: NSObject{
    
    var tag: String?

    override init() {
    }
    
    init(tag: String) {
        self.tag = tag
    }
    
}
