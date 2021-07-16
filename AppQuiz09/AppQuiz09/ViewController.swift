//
//  ViewController.swift
//  AppQuiz09
//
//  Created by 박재원 on 2021/07/16.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lblSubject: UILabel!
    @IBOutlet weak var tfPoint: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    // 배열 값
    var subjectArray:[String] = ["국어 점수", "영어 점수", "수학 점수", "요약"]
    var pointArray:[Int] = []
    
    // 변수
    var countNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblSubject.text = "\(subjectArray[0])"
        lblResult.text?.removeAll()
        
    } // viewDidLoad

    // 화면 전환해주기  * * * * *
    @IBAction func btnCalc(_ sender: UIButton) {
        
        // 값 저장해주기
        if emptyCheck(str01: tfPoint.text!) == true {
            savePoint(point: Int(tfPoint.text!)!)
        }
        
        // 다시 입력하게 지워주기
        tfPoint.text?.removeAll()
        
        // 화면 새로 띄워주기
        countNumber += 1
        if countNumber == subjectArray.count {
            countNumber = 0
        }
        
        if subjectArray[countNumber] == "요약" {
            lblSubject.text = "요약"
            tfPoint.isHidden = true
            printResult(result: summaryCalc(subject: subjectArray, point: pointArray))
        }else{
            lblResult.text?.removeAll()
            tfPoint.isHidden = false
            lblSubject.text = "\(subjectArray[countNumber])" }
    }
    
    
    // 공백체크 & 100점 넘나 확인  * * * * *
    func emptyCheck(str01: String!) -> Bool {
           if str01.count != 0 {
               return true
           }else{ return false }
    }
    // 값 저장하기
    func savePoint(point:Int) {
        pointArray.append(point)
    }
    

    
    // 계산하기 * * * * *
    func summaryCalc(subject: Array<String>, point: Array<Int>) -> Array<Int> {
        
        var resultArray:[Int] = []
        
        // 총점수 구하기
        var total:Int = 0
        for i in 0..<subject.count-1 {
            total += point[i]
            resultArray.append(point[i])
        }
        
        resultArray.append(total)
        // [국어잠수, 영어점수, 수학점수, 총점, 평균]
        return resultArray
    }

    // 출력하기 * * * * *
    func printResult(result: Array<Int>) {
        
        var avgResultArray:[String] = []
        
        
        for i in 0...2 {
            if result[i] > (result[3]/3) {
                avgResultArray.append("보다 높습니다")
            }else if result[i] == (result[3]/3) {
                avgResultArray.append("과 같습니다")
            }else {
                avgResultArray.append("보다 낮습니다")
            }
        }
        
        lblResult.text = "총점은 \(result[3]) 입니다.\n평균은 \(String(format:"%.2f", Double(result[3]/3))) 입니다.\n국어 점수는 \(result[0]) 으로 평균 \(avgResultArray[0]).\n영어 점수는 \(result[1]) 으로 평균 \(avgResultArray[1]).\n수학 점수는 \(result[2]) 으로 평균 \(avgResultArray[2]). "
        
        pointArray = []
        avgResultArray = []
        tfPoint.text?.removeAll()
        
    }
    
} // ViewController

