//
//  ViewController.swift
//  SwipeGesture
//
//  Created by 박재원 on 2021/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgViewUp: UIImageView!
    @IBOutlet weak var imgViewDown: UIImageView!
    @IBOutlet weak var imgViewLeft: UIImageView!
    @IBOutlet weak var imgViewRight: UIImageView!
    
    var imgLeft = [UIImage]()
    var imgRight = [UIImage]()
    var imgUp = [UIImage]()
    var imgDown = [UIImage]()
    
    var numOfTouches = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Image 설정하기
        makeImages()
        
        // 초기 Image
        imgViewUp.image = imgUp[0]
        imgViewDown.image = imgDown[0]
        imgViewLeft.image = imgLeft[0]
        imgViewRight.image = imgRight[0]
        
        
        // * * * * * * * * //
        //                 //
        // 한손가락 Gesture 구성
        makeSingleTouch()//
        //                 //
        // 두손가락 Gesture 구성
        makeDoubleTouch()//
        //                 //
        // * * * * * * * * //
    } // viewDidLoad

    func makeImages() {
        // UI는 Optional
        // Array[0] 초기값 : 검정색
        imgUp.append(UIImage(named: "arrow-up-black.png")!)
        imgDown.append(UIImage(named: "arrow-down-black.png")!)
        imgLeft.append(UIImage(named: "arrow-left-black.png")!)
        imgRight.append(UIImage(named: "arrow-right-black.png")!)
        
        // Array[1] 작동 : 빨간색
        imgUp.append(UIImage(named: "arrow-up-red.png")!)
        imgDown.append(UIImage(named: "arrow-down-red.png")!)
        imgLeft.append(UIImage(named: "arrow-left-red.png")!)
        imgRight.append(UIImage(named: "arrow-right-red.png")!)
        
        // Array[2] 두손가락 작동 : 초록색
        imgUp.append(UIImage(named: "arrow-up-green.png")!)
        imgDown.append(UIImage(named: "arrow-down-green.png")!)
        imgLeft.append(UIImage(named: "arrow-left-green.png")!)
        imgRight.append(UIImage(named: "arrow-right-green.png")!)
        
    } // makeImages
    
    // 한손 터치 * * * * * * * * * * * * * * * *
    func makeSingleTouch(){

        // Swipe Up 설정
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        
        // Swipe Down 설정
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
        
        // Swipe Left 설정
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        // Swipe Right 설정
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
    } // makeSingleTouch
    
    // 한손가락 제스쳐 * * * * * * * * * * * * * * * *
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        // gesture :  어디로 swipe했는지 받아야한다.
        
        // if let 은 swipe 를 애매하게 할때 nil 값이 들어오기 때문에 쓴다.
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            // * * * * * * * * * * * * * * //
            //                             //
            //       여기에 초기값을 줌.        //
            //       ( 한손가락 사용 )         //
            // * * * * * * * * * * * * * * //
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.up:
                // Swipe 를 위로 했을 떄
                imgViewUp.image = imgUp[1]          // 빨간 화살표
                // * * * * * * * * * * * * * * * * * * //
                //                                     //
                //     이 부분이 스와이프 했을때 실행내용       //
                //       ( 한손 // 위로 스와이프 )          //
                // * * * * * * * * * * * * * * * * * * //
            case UISwipeGestureRecognizer.Direction.down:
                // Swipe 를 아래로 했을 떄
                imgViewDown.image = imgDown[1]      // 빨간 화살표
                // * * * * * * * * * * * * * * * * * * //
                //                                     //
                //     이 부분이 스와이프 했을때 실행내용       //
                //       ( 한손 // 아래 스와이프 )          //
                // * * * * * * * * * * * * * * * * * * //
            case UISwipeGestureRecognizer.Direction.left:
                // Swipe 를 아래로 했을 떄
                imgViewLeft.image = imgLeft[1]      // 빨간 화살표
                // * * * * * * * * * * * * * * * * * * //
                //                                     //
                //     이 부분이 스와이프 했을때 실행내용       //
                //       ( 한손 // 왼쪽 스와이프 )          //
                // * * * * * * * * * * * * * * * * * * //
            case UISwipeGestureRecognizer.Direction.right:
                // Swipe 를 아래로 했을 떄
                imgViewRight.image = imgRight[1]    // 빨간 화살표
                // * * * * * * * * * * * * * * * * * * //
                //                                     //
                //     이 부분이 스와이프 했을때 실행내용       //
                //       ( 한손 // 오른쪽 스와이프 )        //
                // * * * * * * * * * * * * * * * * * * //
            default:
                break
                
            } // switch
        } // if let
    } // respondToSwipeGesture
    
    // 두손 터치 * * * * * * * * * * * * * * * *
    func makeDoubleTouch(){
        // Option + Shift + 마우스 = 에뮬레이터 두손
        
        // Swipe Up 설정
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        swipeUp.numberOfTouchesRequired = numOfTouches   // 두 손가락이 필요하다는 내용
        self.view.addGestureRecognizer(swipeUp)
        
        // Swipe Down 설정
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        swipeDown.numberOfTouchesRequired = numOfTouches   // 두 손가락이 필요하다는 내용
        self.view.addGestureRecognizer(swipeDown)
        
        // Swipe Left 설정
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        swipeLeft.numberOfTouchesRequired = numOfTouches   // 두 손가락이 필요하다는 내용
        self.view.addGestureRecognizer(swipeLeft)
        
        // Swipe Right 설정
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        swipeRight.numberOfTouchesRequired = numOfTouches   // 두 손가락이 필요하다는 내용
        self.view.addGestureRecognizer(swipeRight)
        
    } // makeSingleTouch
    
    
    // 두손가락 제스쳐 * * * * * * * * * * * * * * * *
    @objc func respondToSwipeGestureMulti(_ gesture: UIGestureRecognizer){
        // gesture :  어디로 swipe했는지 받아야한다.
        
        // if let 은 swipe 를 애매하게 할때 nil 값이 들어오기 때문에 쓴다.
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            // * * * * * * * * * * * * * * //
            //                             //
            //       여기에 초기값을 줌.        //
            //       ( 두손가락 사용 )         //
            // * * * * * * * * * * * * * * //
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            
            // 각 방향별 Action
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.up:
                // Swipe 를 위로 했을 떄
                imgViewUp.image = imgUp[2]          // 빨간 화살표
                // * * * * * * * * * * * * * * * * * * //
                //                                     //
                //     이 부분이 스와이프 했을때 실행내용       //
                //       ( 두손 // 위로 스와이프 )          //
                // * * * * * * * * * * * * * * * * * * //
            case UISwipeGestureRecognizer.Direction.down:
                // Swipe 를 아래로 했을 떄
                imgViewDown.image = imgDown[2]      // 빨간 화살표
                // * * * * * * * * * * * * * * * * * * //
                //                                     //
                //     이 부분이 스와이프 했을때 실행내용       //
                //       ( 두손 // 아래 스와이프 )          //
                // * * * * * * * * * * * * * * * * * * //
            case UISwipeGestureRecognizer.Direction.left:
                // Swipe 를 아래로 했을 떄
                imgViewLeft.image = imgLeft[2]      // 빨간 화살표
                // * * * * * * * * * * * * * * * * * * //
                //                                     //
                //     이 부분이 스와이프 했을때 실행내용       //
                //       ( 두손 // 왼쪽 스와이프 )          //
                // * * * * * * * * * * * * * * * * * * //
            case UISwipeGestureRecognizer.Direction.right:
                // Swipe 를 아래로 했을 떄
                imgViewRight.image = imgRight[2]    // 빨간 화살표
                // * * * * * * * * * * * * * * * * * * //
                //                                     //
                //     이 부분이 스와이프 했을때 실행내용       //
                //       ( 두손 // 오른쪽 스와이프 )        //
                // * * * * * * * * * * * * * * * * * * //
            default:
                break
            
            } // switch
        } // if let
    } // respondToSwipeGestureMulti
    
    
} // ViewController

