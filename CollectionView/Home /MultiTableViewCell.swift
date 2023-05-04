//
//  MultiTableViewCell.swift
//  CollectionView
//
//  Created by ElAmir Mansour on 04/05/2023.
//

import UIKit


class MultiTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var model = [HomeData]()
    var timer: Timer?
    var currentIndex = 0

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: CollectionViewCell.id, bundle: nil), forCellWithReuseIdentifier: CollectionViewCell.id)
    }
    
    func setupCell(_ model: [HomeData]) {
        self.model = model
        self.collectionView.reloadData()
    }
    
    func startAutoScrolling() {
        stopAutoScrolling()
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true, block: { [weak self] _ in
            guard let self = self else { return }
            if self.currentIndex < self.model.count - 1 {
                self.currentIndex += 1
            } else {
                self.currentIndex = 0
            }
            print(self.currentIndex)
            let indexPath = IndexPath(item: self.currentIndex, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        })
    }
    
    func stopAutoScrolling() {
        timer?.invalidate()
        timer = nil
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.id, for: indexPath) as! CollectionViewCell
        let item = model[indexPath.row]
        cell.collectionViewImage.image = item.image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 1, height: collectionView.frame.width * 0.5)
    }
    
}
