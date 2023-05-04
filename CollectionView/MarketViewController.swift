//
//  MarketViewController.swift
//  CollectionView
//
//  Created by ElAmir Mansour on 30/04/2023.
//

import UIKit

class MarketViewController: UIViewController , UICollectionViewDelegate ,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    let homeModel = HomeModel(data: [
            HomeData(category: "Category 1", item: [
                Items(name: "Item 1", price: "$10"),
                Items(name: "Item 2", price: "$20"),
                Items(name: "Item 3", price: "$30")
            ]),
            HomeData(category: "Category 2", item: [
                Items(name: "Item 4", price: "$40"),
                Items(name: "Item 5", price: "$50")
            ])
        ])
   
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self

        let nib = UINib(nibName: "MarketCollectionViewCell", bundle: nil)
           collectionView.register(nib, forCellWithReuseIdentifier: "marketCell")
        
        let headerNib = UINib(nibName: "MyHeaderViewCollectionReusableView", bundle: nil)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        
        

    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return homeModel.data.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeModel.data[section].item.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "marketCell", for: indexPath) as! MarketCollectionViewCell
        
        let item = homeModel.data[indexPath.section].item[indexPath.row]
        
        cell.price.text = item.price
        cell.lblName.text = item.name
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.45, height: collectionView.frame.height * 0.4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
   

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 25
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
           let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath) as! MyHeaderViewCollectionReusableView

        if let titleLabel = headerView.titleLabel {
            print("Category: \(homeModel.data[indexPath.section].category)")

             titleLabel.text = homeModel.data[indexPath.section].category
          }

          return headerView


       }
    
    struct HomeModel {
        let data : [HomeData]
    }
    
    struct HomeData {
        let category : String
        let item : [Items]
    }
    
    struct Items {
        let name : String
        let price : String
    }
    
}
