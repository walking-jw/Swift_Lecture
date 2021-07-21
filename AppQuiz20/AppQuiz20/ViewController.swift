//
//  ViewController.swift
//  AppQuiz20
//
//  Created by 박재원 on 2021/07/21.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var lblWebPage: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    
    var webPages:[String] = ["www.google.com", "www.naver.com", "www.daum.net"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loadWebPage(url: "www.google.com")
        webView.navigationDelegate = self
        
        pageController.numberOfPages = webPages.count
        pageController.currentPage = 0                                 // 초기 위치
        pageController.pageIndicatorTintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)          // indicator 색상
        pageController.currentPageIndicatorTintColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)    // 현재 위치 색상
    }

    func loadWebPage(url: String) {
        let myUrl = URL(string: "https://\(url)")
        let myRequest = URLRequest(url: myUrl!)
        webView.load(myRequest)
    }
    
    @IBAction func pageControl(_ sender: UIPageControl) {
        loadWebPage(url: webPages[pageController.currentPage])
        lblWebPage.text = webPages[pageController.currentPage]
        
    }
    
} // ViewController

extension ViewController: WKNavigationDelegate{
    
    // Indicator 시작 ('didcom' 으로 검색)
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()   // 이거만 하면 화면에 안보임
        myActivityIndicator.isHidden = false   // 화면에 이제 보인다.
    }
    
    // Indicator 종료 ('didfin' 으로 검색)
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true     // Data 다 불러오면 움직이는것을 멈추고 모습을 감춘다
    }
    
    // Error 발생했을 때 ('didFail'로 검색)
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
} // WKNavigationDelegate
