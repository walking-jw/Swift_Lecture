//
//  EditDelegate.swift
//  Navigation
//
//  Created by 박재원 on 2021/07/22.
//

protocol EditDelegate {
    // controller: 에서 주는 message: 다.
    func didMessageEditDone(_ controller: EditViewController, message: String)
    
    // 전구 상태를 다시 되돌려주기
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
    
    
}
