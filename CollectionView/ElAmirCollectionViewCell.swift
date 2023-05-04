//
//  ElAmirCollectionViewCell.swift
//  CollectionView
//
//  Created by ElAmir Mansour on 29/04/2023.
//

import UIKit

class ElAmirCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    
    func setupCell (photo: UIImage , txt : String){
        img.image = photo
        label.text = txt
    }
}
