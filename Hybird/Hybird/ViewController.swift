//
//  ViewController.swift
//  Hybird
//
//  Created by 박재원 on 2021/07/21.
//

import UIKit

// Cannot find type 'WKWebView' in scope 라고 뜬다!
// 다른건 UI 인데 이건 WK 으로 시작한다. 이건 Module이 다르다는 뜻이기 때문에 불러와야한다.
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var tfUrl: UITextField!
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loadWebPage(url: "https://www.naver.com")
        
        // extension 이랑 연결해주기
        myWebView.navigationDelegate = self
    }

    // To Google Button
    @IBAction func btnGoogle(_ sender: UIButton) {
        loadWebPage(url: "https://www.google.com")
    }
    
    // To GitHub Button
    @IBAction func btnGitHub(_ sender: UIButton) {
        loadWebPage(url: "https://github.com/")
    }
    
    // To Swift Button
    @IBAction func btnSwift(_ sender: UIButton) {
        loadWebPage(url: "https://swift.org/")
    }
    
    // To Search Button
    @IBAction func btnSearch(_ sender: UIButton) {
        let myUrl = checkUrl(tfUrl.text!)
        tfUrl.text = ""
        loadWebPage(url: myUrl)
    }
    
    
    @IBAction func btnHtml(_ sender: UIButton) {
        let htmlString = """
            <html>
                <head>
                    <meta charset="utf-8">
                    <meta name="viewport" content="width=device-width, initail-scale=1.0">
                </head>
                <body>
                    <h1>HTML String</h1>
                    <p> String 변수를 이용한 웹페이지 </p>
                    <p><a href = "http://jtbc.joins.com">JTBC</a>로 이동</p>
                </body>
            </html>
            """
        // load 가 아니라 loadHTML 이다! baseURL 은 내가 직접 작성했으니까 nil
        myWebView.loadHTMLString(htmlString, baseURL: nil)
        
        // 크기가 작게 보인다?
        // <meta name="viewport" content="width=device-width, initail-scale=1.0">
        // 이 tag를 붙여줘야 사이즈가 맞게 나온다.
        // 더 크게 띄우고 싶으면 scale 을 더 키우면 된다.
    }
    
    // file 로 가져오기
    @IBAction func btnFile(_ sender: UIButton) {
        // html file 을 하나 만들어야 한다.
        // New File > Other > Empty > htmlView.html 로 만들었음.
        
        // 연결하기 (File name + .html)
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: ".html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
        
    }
    
    // http 거르기
    func checkUrl(_ url:String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://") // 앞 글자가 이렇게 시작하면
        if !flag{                              // hasPrefix 는 Bool
            strUrl += "http://"
        }
        return strUrl
    }
    
    // Web Page 로 연결하는 것 func 으로 만들기
    func loadWebPage(url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    
    // ToolBar Buttons
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    
    
    
    
} // ViewController

// Web이랑 indicator 연결해주기 Extension -> ViewController: UIViewController 보면 WK 는 없어서 추가해줘야함.
// Web이 시작했다, 끝났다, 에러걸렸다 등을 알려주는 기능
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
