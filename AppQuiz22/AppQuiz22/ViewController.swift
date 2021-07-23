//
//  ViewController.swift
//  AppQuiz22
//
//  Created by 박재원 on 2021/07/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    // property
    var isOn = true
    var isColor = false
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    let imgColor = UIImage(named: "lamp_red.png")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 최초 전구상태 ( On )
        imageView.image = imgOn
        
    } // viewDidLoad

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let optionViewController = segue.destination as! OptionViewController
        
        optionViewController.delegate = self
        
        // Main 의 전구상태 보내기
        optionViewController.isOn = self.isOn
        optionViewController.isColor = self.isColor
        
    }

} // ViewController

extension ViewController: OptionDelegate{
    func didImageOnOffDone(_ controller: OptionViewController, isOn: Bool) {
        print(isOn)
        if isOn{
            imageView.image = imgOn
            self.isOn = true
        }else{
            imageView.image = imgOff
            self.isOn = false
        }
    } // didImageOnOffDone
    
    func didImageColorDone(_ controller: OptionViewController, isOn: Bool) {
        if isOn, self.isOn==true{
            imageView.image = imgColor
            self.isColor = true
        }else if isOn==false, self.isOn==true{
            imageView.image = imgOn
            self.isColor = false
        }else{
            imageView.image = imgOff
            self.isOn = false
        }
    } // didImageColorDone
    
} // OptionDelegate
