//
//  OptionViewController.swift
//  AppQuiz22
//
//  Created by 박재원 on 2021/07/22.
//

import UIKit

class OptionViewController: UIViewController {

    // Outlet
    @IBOutlet weak var lblLampOnOff: UILabel!
    @IBOutlet weak var lblLampColor: UILabel!
    
    @IBOutlet weak var swLampOnOff: UISwitch!
    @IBOutlet weak var swLampColor: UISwitch!
    
    // protocol
    var delegate: OptionDelegate?
    
    // set state
    var isOn = true
    var isColor = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        swLampOnOff.isOn = self.isOn
        swLampColor.isOn = self.isColor
        
        switch swLampOnOff.isOn {
        case true && self.isColor==true:
            // 빨간전구일때
            lblLampColor.text = "Red"
            lblLampOnOff.text = "On"
        case true:
            // 노랑전구일때
            lblLampColor.text = "Yellow"
            lblLampOnOff.text = "On"
        default:
            swLampColor.isEnabled = false
            lblLampOnOff.text = "Off"
        }
        
        
    } // viewDidLoad
    
    @IBAction func btnOk(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didImageOnOffDone(self, isOn: self.isOn)
            delegate?.didImageColorDone(self, isOn: self.isColor)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func swOnOff(_ sender: UISwitch) {
        switch sender.isOn {
        case true:
            // 전구 켰을때
            self.isOn = true
            lblLampOnOff.text = "On"
            swLampColor.isEnabled = true
        default:
            self.isOn = false
            lblLampOnOff.text = "Off"
            swLampColor.isEnabled = false
        }
    }
    
    
    @IBAction func swColor(_ sender: UISwitch) {
        switch sender.isOn {
        case true:
            // 빨간전구 켰을때
            self.isColor = true
            lblLampColor.text = "Red"
        default:
            self.isColor = false
            lblLampColor.text = "Yellow"
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

} // OptionViewController
