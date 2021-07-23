//
//  AddViewController.swift
//  AppQuiz24
//
//  Created by 박재원 on 2021/07/23.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pickerSelectIcon: UIPickerView!
    @IBOutlet weak var tfImageName: UITextField!
    
    // Property - PickerView
    var maxArrayNum = 0
    var viewColumn = 1
    var imageArray = [UIImage?]()
    var currentImageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Settings - PickerView
        maxArrayNum = items.count    // Total Lines of PickerView
        for i in 0..<maxArrayNum{
            let image = UIImage(named: itemsImageFile[i])
            imageArray.append(image)
        }
        pickerSelectIcon.dataSource = self
        pickerSelectIcon.delegate = self
        
        // 초기 세팅
        imgView.image = imageArray[0]
        
    } // viewDidLoad

    
    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfImageName.text!)
        itemsImageFile.append(currentImageName)
        navigationController?.popViewController(animated: true)
    } // btnAddItem
    

} // AddViewController

// Extension - PickerView
extension AddViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return viewColumn   // 선택되는 Column 갯수
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return maxArrayNum  // 총 Column 갯수
    }
} // UIPickerViewDataSource

extension AddViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        // x,y 0,0에서부터 시작해서 30, 30 씩 주겠다.
        imageView.frame = CGRect(x:0, y:0, width: 30, height: 30)

        return imageView
    }


    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imgView.image = imageArray[row]             // 이미지 뷰에 사진 보여주기
        currentImageName = itemsImageFile[row]      // 저장할때 이 값(데이터 이름)을 가지고 감
    }
} // UIPickerViewDelegate
