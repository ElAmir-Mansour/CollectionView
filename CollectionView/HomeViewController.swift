//
//  HomeViewController.swift
//  CollectionView
//
//  Created by ElAmir Mansour on 29/04/2023.
//

import UIKit

class HomeViewController: UIViewController ,UICollectionViewDelegate ,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
   
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    var images = [UIImage(named: "ElAmir")!,UIImage(named: "ElAmir")!,UIImage(named: "ElAmir")!,UIImage(named: "ElAmir")!,UIImage(named: "ElAmir")!]
    
    var currentCellIndex = 0
    
    @IBOutlet weak var pageControl: UIPageControl!
    var timer : Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource =  self
        collectionView.delegate = self
        pageControl.numberOfPages = images.count
        startTimer()

        // Do any additional setup after loading the view.
    }
    @objc func movetoNextIndex(){
        if currentCellIndex < images.count - 1 {
            
        }else {
            currentCellIndex = 0
        }
        currentCellIndex += 1
        collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        pageControl.currentPage = currentCellIndex
       
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(movetoNextIndex), userInfo: nil, repeats: true)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeCollectionViewCell
        
        cell.img.image = images[indexPath.row]
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
 

}
