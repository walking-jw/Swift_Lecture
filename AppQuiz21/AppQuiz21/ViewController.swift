//
//  ViewController.swift
//  AppQuiz21
//
//  Created by 박재원 on 2021/07/21.
//

import UIKit

class ViewController: UIViewController {

    var images = ["flower_01.png", "flower_02.png", "flower_03.png", "flower_04.png", "flower_05.png", "flower_06.png"]
    var page = 0
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.image = UIImage(named: images[0])
        
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        // 한손가락 Gesture 구성
        makeSingleTouch()//
        
    }

    @IBAction func pageController(_ sender: UIPageControl) {
        showImage()
    
    }
    
    func showImage(){
        imageView.image = UIImage(named: images[pageControl.currentPage])
    }
    
    // 한손 터치 * * * * * * * * * * * * * * * *
    func makeSingleTouch(){

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
      
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.left:
                if pageControl.currentPage > 0 {
                    pageControl.currentPage -= 1
                    showImage()
                }
                pageControl.currentPage = 0
                showImage()
                // Swipe 를 아래로 했을 떄
                // * * * * * * * * * * * * * * * * * * //
                //                                     //
                //     이 부분이 스와이프 했을때 실행내용       //
                //       ( 한손 // 왼쪽 스와이프 )          //
                // * * * * * * * * * * * * * * * * * * //
            case UISwipeGestureRecognizer.Direction.right:
                if pageControl.currentPage == 5 {
                    pageControl.currentPage = 5
                    showImage()
                }
                
                pageControl.currentPage += 1
                showImage()
                // Swipe 를 아래로 했을 떄
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
    
    
}

