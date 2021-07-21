//
//  ViewController.swift
//  AppQuiz18
//
//  Created by 박재원 on 2021/07/21.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var pickerWebPage: UIPickerView!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    // PickerView Settings
    var webPageNames = ["https://www.google.com", "https://www.naver.com"]
    var maxArrayNum = 0
    let viewColumn = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Array 길이 저장  -> PickerView에 씀
        maxArrayNum = webPageNames.count

        // extension 연결
        pickerWebPage.dataSource = self
        pickerWebPage.delegate = self
        webView.navigationDelegate = self
        
        // 초기페이지
        loadWebView("https://www.google.com")
        
    } // viewDidLoad

    // Url 연결 func * * * * *
    func loadWebView(_ url : String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        webView.load(myRequest)
    } // loadWebView

} // ViewController

// Extension - PickerView * * * * *
extension ViewController: UIPickerViewDataSource{
    
    // PickerView Column 갯수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return viewColumn
    }
    
    // PickerView Line 수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return maxArrayNum
    }
} // UIPickerViewDataSource

// Extension - PickerView * * * * *
extension ViewController:UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return webPageNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 웹페이지 연결
        loadWebView(webPageNames[row])
        
    }
} // UIPickerViewDelegate

// Extension - Web * * * * *
extension ViewController:WKNavigationDelegate{
    
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
