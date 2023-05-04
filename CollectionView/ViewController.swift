//
//  ViewController.swift
//  CollectionView
//
//  Created by ElAmir Mansour on 29/04/2023.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
   
    
    var arr = [img_label]()


    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        arr.append(img_label(photo: UIImage(named: "ElAmir")!, name: "ElAmir"))
        arr.append(img_label(photo: UIImage(named: "ElAmir")!, name: "ElAmir"))
        arr.append(img_label(photo: UIImage(named: "ElAmir")!, name: "ElAmir"))
        arr.append(img_label(photo: UIImage(named: "ElAmir")!, name: "ElAmir"))
        arr.append(img_label(photo: UIImage(named: "ElAmir")!, name: "ElAmir"))
        arr.append(img_label(photo: UIImage(named: "ElAmir")!, name: "ElAmir"))
        arr.append(img_label(photo: UIImage(named: "ElAmir")!, name: "ElAmir"))
        arr.append(img_label(photo: UIImage(named: "ElAmir")!, name: "ElAmir"))
        arr.append(img_label(photo: UIImage(named: "ElAmir")!, name: "ElAmir"))
        arr.append(img_label(photo: UIImage(named: "ElAmir")!, name: "ElAmir"))
        arr.append(img_label(photo: UIImage(named: "ElAmir")!, name: "ElAmir"))
        arr.append(img_label(photo: UIImage(named: "ElAmir")!, name: "ElAmir"))
        arr.append(img_label(photo: UIImage(named: "ElAmir")!, name: "ElAmir"))
        arr.append(img_label(photo: UIImage(named: "ElAmir")!, name: "ElAmir"))
        arr.append(img_label(photo: UIImage(named: "ElAmir")!, name: "ElAmir"))
        arr.append(img_label(photo: UIImage(named: "ElAmir")!, name: "ElAmir"))

    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! ElAmirCollectionViewCell
        
        let arrs = arr[indexPath.row]
        
        cell.setupCell(photo: arrs.photo, txt: arrs.name)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width * 0.493, height: self.view.frame.width * 0.45)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 2, bottom: 1, right: 2)
    }
    
    struct img_label {
        let photo : UIImage
        let name : String
    }
}

