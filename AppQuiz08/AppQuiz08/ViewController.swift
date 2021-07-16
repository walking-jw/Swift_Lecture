//
//  ViewController.swift
//  AppQuiz08
//
//  Created by 박재원 on 2021/07/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfKorean: UITextField!
    @IBOutlet weak var tfMath: UITextField!
    @IBOutlet weak var tfEnglish: UITextField!
    
    @IBOutlet weak var lblResult: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblResult.text?.removeAll()
    }

    // 버튼 클릭
    @IBAction func btnCalc(_ sender: UIButton) {
        if emptyCheck(str01: tfKorean.text!, str02: tfMath.text!, str03: tfEnglish.text!) == true {
            lblResult.text = gradeAndResultCalc(avg:
                             averageCalc(str01: tfKorean.text!,
                                         str02: tfMath.text!,
                                         str03: tfEnglish.text!))
        }else{ lblResult.text = "빈칸을 채워주세요" }
    } // btnCalc
    
    
    // 공백 체크하기
    func emptyCheck(str01: String!, str02: String!, str03: String!) -> Bool {
        if str01.count != 0, str02.count != 0, str03.count != 0 {
            return true
        }else{ return false }
    } // emptyCheck
    
    
    // 평균 구하기
    func averageCalc(str01: String!, str02: String!, str03: String!)-> Double {
        let avg:Double = (Double(str01)! + Double(str02)! + Double(str03)!) / 3
        return avg
    } // averageCalc
    
    
    // 등급 계산하고 결과 전달하기
    func gradeAndResultCalc(avg:Double)->String {
        var grade: String
        grade = avg >= 90 ? "A" :
                avg >= 80 ? "B" :
                avg >= 70 ? "C" :
                avg >= 60 ? "D" : "F"
        
        return "평균은 \(String(format:"%.2f", avg))이고, 등급은 \(grade) 입니다."
    } // gradeAndResultCalc
    
    
} // ViewController

