//
//  ViewController.swift
//  AppQuiz19
//
//  Created by 박재원 on 2021/07/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var numbers = Array<Int>(1...10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lblNumber.text = String(numbers[0])
        lblNumber.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
  
        // Page Control
        pageControl.numberOfPages = numbers.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
    }

    @IBAction func pageControlAction(_ sender: UIPageControl) {
    
        lblNumber.text = String(numbers[pageControl.currentPage])
        switch Int(lblNumber.text!)! % 2 {
        case 0:
            lblNumber.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        default:
            lblNumber.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        }
        
        
        
        
    }
    

}

