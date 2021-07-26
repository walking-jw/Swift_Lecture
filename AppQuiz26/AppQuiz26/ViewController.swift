//
//  ViewController.swift
//  AppQuiz26
//
//  Created by 박재원 on 2021/07/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ImageCollectionView: UICollectionView!
    
    var ImageFileName = ["flower_01.png", "flower_02.png"]
    var ImageFile:[UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        for i in 0..<ImageFileName.count {
            ImageFile.append(UIImage(named: ImageFileName[i])!)
        }
        
        ImageCollectionView.delegate = self
        ImageCollectionView.dataSource = self
        
        
    } // viewDidLoad

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgImage"{
            // sender 가 몇번째 cell을 클릭했는지 알고 있다.
            let cell = sender as! CollectionViewCell
            let indexPath = self.ImageCollectionView.indexPath(for: cell)  // cell 의 위치를 알고있기때문에, 거기서 몇번째 배열인지 가져오는 것
            let detailView = segue.destination as! ImageViewController
            detailView.receiveItems(ImageFileName[indexPath!.row])   // 값이 무조건 있는거니까 '!' 썼다.
            
        }
    }
    
    
} // ViewController

extension ViewController:UICollectionViewDataSource, UICollectionViewDelegate {
    
    //
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImageFileName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        cell.CellImageView.image = ImageFile[indexPath.row]
        
        return cell
    }
}

extension ViewController:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    // 옆 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 1.0
    }
    
    // Cell 사이즈 ( 옆 라인을 고려하여 설정 )
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 3등분 : 한 줄에 셀 3개 들어가게! (옆 간격이 1이라 1을 빼준 것이다)
        let width:CGFloat = collectionView.bounds.width / 3 - 1.0
        let size = CGSize(width: width, height: width)  // 정사각형
        
        return size
    }
    
}

