//
//  PhotosViewController.swift
//  CollectionView
//
//  Created by ElAmir Mansour on 29/04/2023.
//

import UIKit

class PhotosViewController: UIViewController ,UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
   
    @IBOutlet weak var collectionView: UICollectionView!
    
    var arrPhotos = [Photo]()


    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
//         i am making a section with multiple photos
        arrPhotos.append(Photo(name: "ElAmir Photos ", photos: [UIImage(named: "ElAmir")!,UIImage(named: "ElAmir")!,UIImage(named: "ElAmir")!]))
        
        arrPhotos.append(Photo(name: "ElAmir Photos 2 ", photos: [UIImage(named: "ElAmir")!,UIImage(named: "ElAmir")!,UIImage(named: "ElAmir")!]))
        
        arrPhotos.append(Photo(name: "ElAmir Photos 3 ", photos: [UIImage(named: "ElAmir")!,UIImage(named: "ElAmir")!,UIImage(named: "ElAmir")!,UIImage(named: "ElAmir")!]))

        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrPhotos[section].photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photosCell", for: indexPath) as! PhotosCollectionViewCell
        cell.photo.image = arrPhotos[indexPath.section].photos[indexPath.row]
        
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return arrPhotos.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.3, height: collectionView.frame.width * 0.3)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "photosHeader", for: indexPath) as! CollectionReusableView
            
            header.lblHeader.text = arrPhotos[indexPath.section].name
            
            return header
        }else {
            
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "photosFooter", for: indexPath)
            return footer
        }
       
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    
        return CGSize(width: collectionView.frame.width
                      , height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 10)
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
    struct Photo {
        let name : String
        let photos : [UIImage]
    }

}
