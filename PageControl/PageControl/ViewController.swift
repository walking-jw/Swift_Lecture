//
//  ViewController.swift
//  PageControl
//
//  Created by 박재원 on 2021/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var images:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 1...6{
            images.append("flower_0\(i).png")
        }
        
        imgView.image = UIImage(named: images[0])
        
        // PageControl 의 길이 설정해주기
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0                                 // 초기 위치
        pageControl.pageIndicatorTintColor = UIColor.green          // indicator 색상
        pageControl.currentPageIndicatorTintColor = UIColor.red     // 현재 위치 색상
        
        // currentPage 만 주면 자신의 위치를 알고 움직임.
        
    }

    
    @IBAction func pageChange(_ sender: UIPageControl) {
        // currentPage에서 초기 위치를 알기 때문에 맞춰서 움직인다.
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
    
    

} // ViewController

