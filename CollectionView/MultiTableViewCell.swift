//
//  MultiTableViewCell.swift
//  CollectionView
//
//  Created by ElAmir Mansour on 04/05/2023.
//

import UIKit


class MultiTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var arrPhotos = [UIImage]()
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var timer: Timer?
    var currentIndex = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setupCell(title: String, arrPhotos: [UIImage]) {
        self.lblTitle.text = title
        self.arrPhotos = arrPhotos
        self.collectionView.reloadData()
    }
    
    func startAutoScrolling() {
        stopAutoScrolling()
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true, block: { [weak self] _ in
            guard let self = self else { return }
            if self.currentIndex < self.arrPhotos.count - 1 {
                self.currentIndex += 1
            } else {
                self.currentIndex = 0
            }
            let indexPath = IndexPath(item: self.currentIndex, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        })
    }
    
    func stopAutoScrolling() {
        timer?.invalidate()
        timer = nil
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cvCell", for: indexPath) as! MultiCollectionViewCell
        cell.img.image = arrPhotos[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 1, height: collectionView.frame.width * 0.5)
    }
    
}
