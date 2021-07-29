//
//  ViewController.swift
//  ProjectTest
//
//  Created by 박재원 on 2021/07/28.
//

import UIKit

class ViewController: UIViewController {

    /// NSArray
    var feedItem: NSArray = NSArray()
    
    @IBOutlet var lblText: UIView!
    @IBOutlet weak var tfText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Hi!")
     
        
        let itemQueryModel = ItemQueryModel()
        itemQueryModel.delegate = self
        itemQueryModel.downloadItems()
        
        
        for i in 0..<feedItem.count{
            let item: DBItemModel = feedItem[i] as! DBItemModel
            print("data : \(item.tag!)")
            
            tfText.text = tfText.text! + "\(item.tag!)"
            
        }
       
        
    }

    
    
    
    
    
    
    

}

extension ViewController: ItemQueryModelProtocol{
    func itemDownloaded(items: NSArray) {
        feedItem = items
        // * * * Data 받아온 시점 * * *
    }
}
