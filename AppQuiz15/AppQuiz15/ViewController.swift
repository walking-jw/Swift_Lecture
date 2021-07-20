//
//  ViewController.swift
//  AppQuiz15
//
//  Created by 박재원 on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblSelectedMultiName: UILabel!
    @IBOutlet weak var pickerMulti: UIPickerView!
    @IBOutlet weak var tvResult: UITextView!
    
    var multiplicationTable:[String] = []
    var multiNum:[Int] = []
    var guguDan = Array<Int>(2...9)   // 이렇게 쓸 수 있음!!
    
    var maxArrayNum = 0         // 배열의 총 길이
    let viewColumn = 1          // PickerView 한줄만 필요해요
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 구구단 이름 만들어주기
        for i in 2...9 {
            multiplicationTable.append("\(i)단")
            multiNum.append(i)
        } // for
        
        // 배열의 길이 기억해주기
        maxArrayNum = multiplicationTable.count
        
        // pickerView 와 extension 연결해주기
        pickerMulti.dataSource = self
        pickerMulti.delegate = self
        
        // 초기 화면 보여주기
        lblSelectedMultiName.text = multiplicationTable[0]
        for i in 1...9 {
            tvResult.text += "\(multiNum[0]) x \(i) = \(i * multiNum[0]) \n"
        }
        
    } // viewDidLoad

    
} // ViewController

// PickerView 모양 만들어주기
extension ViewController: UIPickerViewDataSource{
    // PickerView 몇 줄 돌릴까요?
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return viewColumn
    }
    
    // 총 몇개나 PickerView 줄을 만들까요?
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return maxArrayNum
    }
} // UIPickerViewDataSource


// PickerView 내용 & 액션 채워주기
extension ViewController: UIPickerViewDelegate{
    
    // 내용 채워주기
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return multiplicationTable[row]
    }
    
    // 선택됐으면 ?
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblSelectedMultiName.text = multiplicationTable[row]
        
        tvResult.text.removeAll()
        for i in 1...9 {
            tvResult.text += "\(multiNum[row]) x \(i) = \(i * multiNum[row]) \n"
        }
    }
    
} // UIPickerViewDelegate
