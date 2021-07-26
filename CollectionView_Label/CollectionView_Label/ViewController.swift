//
//  ViewController.swift
//  CollectionView_Label
//
//  Created by 박재원 on 2021/07/26.
//

import UIKit

var list = ["쯔위", "모모", "사나"]

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    // Cell 의 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    // Cell 구성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // return 이 UICollectionViewCell 이여서 .swift 를 따로 만든 것이다.
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        cell.lblHuman.text = list[indexPath.row]
        cell.lblHuman.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        return cell
        
    }
    
    
    
   /// Prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgDetail"{
            // sender 가 몇번째 cell을 클릭했는지 알고 있다.
            let cell = sender as! CollectionViewCell
            let indexPath = self.collectionView.indexPath(for: cell)  // cell 의 위치를 알고있기때문에, 거기서 몇번째 배열인지 가져오는 것
            let detailView = segue.destination as! DetailViewController
            detailView.receiveItems(list[indexPath!.row])   // 값이 무조건 있는거니까 '!' 썼다.
            
        }
    }
    
} // ViewController

// * * Cell Layout 정의 * *
extension ViewController:UICollectionViewDelegateFlowLayout{
    // 위 아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 1
    }
    
    // 옆 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 1
    }
    
    // Cell 사이즈 ( 옆 라인을 고려하여 설정 )
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 3등분 : 한 줄에 셀 3개 들어가게! (옆 간격이 1이라 1을 빼준 것이다)
        let width = collectionView.frame.width / 3 - 1
        let size = CGSize(width: width, height: width)  // 정사각형
        
        return size
    }
    
    
}

