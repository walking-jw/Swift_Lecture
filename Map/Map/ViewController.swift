//
//  ViewController.swift
//  Map
//
//  Created by 박재원 on 2021/07/23.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var locationGo: UISegmentedControl!
    // Segment 버튼 위치가 바껴야 하기 때문에 Outlet으로 해줬다!
    @IBOutlet weak var myMap: MKMapView!  // MK extension 해야한다!
    @IBOutlet weak var addr1: UILabel!
    @IBOutlet weak var addr2: UILabel!

    
    let myLoc = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myLoc.delegate = self
        myLoc.requestWhenInUseAuthorization()  // 승인 허용 문구 받아서 처리
        myLoc.startUpdatingLocation()          // GPS 좌표 받기 시작
        myMap.showsUserLocation = true
    } // viewDidLoad

    // parameter : 좌표값
    func mapMove(_ lat: CLLocationDegrees, _ lon:CLLocationDegrees, _ txt1:String) {
        // 지도 가운데 부분 잡아준 것임.
        let pLoc = CLLocationCoordinate2DMake(lat, lon)
        // 배율  ( 숫자에 따라 차이가 큼 )
        let pSpan = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        
        // 좌표 정보
        let pRegion = MKCoordinateRegion(center: pLoc, span: pSpan)
        
        // 현재 지도를 좌표 정보로 보이기 (animated 무조건 true)
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
            txt2 += " " + pm!.thoroughfare!  // 동
            // ---> addr2 에 줄 것임.
            self.addr2.text = txt2
                                                                       
        }) // CLGeocoder
        
        addr1.text = txt1
        setPoint(pLoc, txt1, txt2)
    }
    
    func setPoint(_ loc: CLLocationCoordinate2D, _ txt1: String, _ txt2: String){
        let pin = MKPointAnnotation()    // 핀 꼽기
        
        pin.coordinate = loc
        pin.title = txt1
        pin.subtitle = txt2
        
        myMap.addAnnotation(pin)
    }
    
    
    @IBAction func locationGo(_ sender: UISegmentedControl) {
        // Segment 움직이기
        if sender.selectedSegmentIndex == 0{
            myLoc.startUpdatingLocation()
        }else if sender.selectedSegmentIndex == 1{
            mapMove(37.65243153, 127.0276397, "둘리 뮤지엄")
        }else if sender.selectedSegmentIndex == 2{
            mapMove(37.57244171, 126.9595412, "서대문 형무소 역사관")
        }
        
    }
    
} // ViewController

// Extension - GPS 사용하는 기능
// myLoc = CLLocationManager()가 호출시 자동 실행
extension ViewController:CLLocationManagerDelegate{
    // GPS 는 지속적으로 받아와야하니까 locations 이다.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lastLoc = locations.last
        
        // 지도보기
        mapMove((lastLoc?.coordinate.latitude)!, (lastLoc?.coordinate.longitude)!, "현재위치")
        myLoc.stopUpdatingLocation()  // 좌표 받기 중지
        
    }
    
}
