//
//  ViewController.swift
//  PickerView
//
//  Created by 박재원 on 2021/07/20.
//

import UIKit

// * * * * * PickerView 흐름도 * * * * * * * //
//
// [1] 그림 세팅 - imageFileName -> imageArray
// [2] Extension - UIPickerViewDataSource
// [3] pickerImage.dataSource = self      // 여기까진 아직 picker 에서 ? 만 뜬다. [ 남은 기능 : 이름 넣어주기, 움직이면 액션 ]
// [4] Extension - UIPickerViewDelegate   // Title(그림 파일 이름) 잘 보임
// [5] Extension - didSelectRow           // 움직이면 액션 주기
//
// ** [3] 의 경우 pickerView 의 총 갯수, Column 모양 을 정해주는 것이다.
// ** [3] PickerView의 모양 잡기 - [4] 그 모양에 이름들 넣어주기 - [5] PickerView 선택하면 어떻게 할 지 액션 넣어주기
//
// * * * * * * * * * * * * * * * * * * * * //


class ViewController: UIViewController {

    @IBOutlet weak var pickerImage: UIPickerView!
    @IBOutlet weak var lblImageFileName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var imageFileName = ["w1.jpg", "w2.jpg", "w3.jpg", "w4.jpg", "w5.jpg", "w6.jpg", "w7.jpg", "w8.jpg", "w9.jpg", "w10.jpg"]
    
    // UI 쓰는 것들은 기본적으로 다 optional이다.
    // PickerView 에 맞춰서 같은 속도로 움직이기 위해 배열을 미리 만들어둠
    var imageArray = [UIImage?]()       // 그림 배열
    var maxArrayNum = 0                 // 배열 갯수가 몇개 있다 알려주기 (갯수는 viewDidLoad 에서!)
    let viewColumn = 1                  // 한번에 몇개 Column 보이게 할거야!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        maxArrayNum = imageFileName.count
        
        // 그림 배열에 내용 넣어주기. 사용자는 처음에 시작하기 전에 느린건 이해하지만, 사용중엔 용서없다.
        for i in 0..<maxArrayNum{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        // 처음 보이는 화면 Setting
        lblImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
        
        pickerImage.dataSource = self     // pickerImage에 들어갈 Source는 ViewController(self)에 있어!
        pickerImage.delegate = self
    } // viewDidLoad * * * * * * * * * * [한번 실행하면 끝]

    
} // ViewController

// PickerView의 외형 담당 [UIPickerViewDataSource]
extension ViewController: UIPickerViewDataSource{
    
    // PickerView의 Colomn 갯수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return viewColumn  // 처음에 1개로 지정했음
    }
    
    // 출력할 이미지 파일 갯수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return maxArrayNum
    }
} // UIPickerViewDataSource


extension ViewController: UIPickerViewDelegate{
    
    // PickerView에 Title 입히기
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageFileName[row]  // 이렇게 하면 for 문을 돌리지 않아도 알아서 세팅이 된다!
    }
    
    // didSelectRow - Row를 선택했다!
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = imageFileName[row]     // Label 에 이미지 이름 띄워주기
        imageView.image = imageArray[row]              // image 띄워주기
    }
    
} // UIPickerViewDelegate
