//
//  WebViewController.swift
//  Kanna_03
//
//  Created by 박재원 on 2021/07/26.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    var receiveUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        webView.navigationDelegate = self
        showWebView()
    }
    
    
    func showWebView(){
        guard let url = URL(string: receiveUrl) else {
            print("Error")
            return
        }
        let myRequest = URLRequest(url: url)
        webView.load(myRequest)

    }

    func receiveUrls(_ url: String){
        receiveUrl = url
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension WebViewController: WKNavigationDelegate{
    
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
