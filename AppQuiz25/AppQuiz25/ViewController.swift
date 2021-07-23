//
//  ViewController.swift
//  AppQuiz25
//
//  Created by 박재원 on 2021/07/23.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    // Outlet
    @IBOutlet weak var lblPlaceName: UILabel!
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MAP
    let myLoc = CLLocationManager()
    
    // DATA
    var seoultraditionalGates:[(String, Double, Double)] = [("혜화문", 37.5878892, 127.0037098), ("흥인지문", 37.5711907, 127.00950), ("창의문", 37.5926027, 126.9664771), ("숙정문", 37.5956584, 126.9810576)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // PageControl 의 길이 설정해주기
        pageControl.numberOfPages = seoultraditionalGates.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
        // Map
        myLoc.requestWhenInUseAuthorization()  // 승인 허용 문구 받아서 처리
        myLoc.startUpdatingLocation()          // GPS 좌표 받기 시작
        myMap.showsUserLocation = true
        
        mapMove(seoultraditionalGates[0].1, seoultraditionalGates[0].2, seoultraditionalGates[0].0)
        
        lblPlaceName.text = seoultraditionalGates[0].0
        
    } // viewDidLoad


    @IBAction func pageChange(_ sender: UIPageControl) {
        mapMove(seoultraditionalGates[pageControl.currentPage].1, seoultraditionalGates[pageControl.currentPage].2, seoultraditionalGates[pageControl.currentPage].0)
        lblPlaceName.text = seoultraditionalGates[pageControl.currentPage].0
        
    }
    
    func mapMove(_ lat: CLLocationDegrees, _ lon:CLLocationDegrees, _ txt1:String) {
        // 지도 가운데 부분 잡아준 것임.
        let pLoc = CLLocationCoordinate2DMake(lat, lon)
        // 배율  ( 숫자에 따라 차이가 큼 )
        let pSpan = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        
        /// 좌표 정보
        let pRegion = MKCoordinateRegion(center: pLoc, span: pSpan)
        
        /// 현재 지도를 좌표 정보로 보이기 (animated 무조건 true)
        myMap.setRegion(pRegion, animated: true)
        
        // * * * * * * 지도 띄워주기 끝 * * * * * *
        
        // 해당 위치의 이름 띄워주기
        let addLoc = CLLocation(latitude: lat, longitude: lon)
        var txt2 = ""
        
        // 어느 주소인지 주소값 가져오기 ( 미국이랑 한국이랑 주소 읽는 순서가 달라서 reverse )
        CLGeocoder().reverseGeocodeLocation(addLoc, completionHandler: {place, error in
            let pm = place!.first
            txt2 = pm!.country!              // 국가 값 가져오기
            txt2 += " " + pm!.locality!      // 시, 도
//            txt2 += " " + pm!.thoroughfare!  // 동
    
                                                        
        }) // CLGeocoder
        
      
        setPoint(pLoc, txt1, txt2)
    }
    
    func setPoint(_ loc: CLLocationCoordinate2D, _ txt1: String, _ txt2: String){
        let pin = MKPointAnnotation()    // 핀 꼽기
        
        pin.coordinate = loc
        pin.title = txt1
        pin.subtitle = txt2
        
        myMap.addAnnotation(pin)
    }
    
} // ViewController

//// Extension - GPS 사용하는 기능
//extension ViewController:CLLocationManagerDelegate{
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        let lastLoc = locations.last
//
//        // 지도보기
//        mapMove((lastLoc?.coordinate.latitude)!, (lastLoc?.coordinate.longitude)!, "현재위치")
//        myLoc.stopUpdatingLocation()  // 좌표 받기 중지
//
//    }
//
//}

