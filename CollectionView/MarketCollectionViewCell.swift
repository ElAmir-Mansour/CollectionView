//
//  MarketCollectionViewCell.swift
//  CollectionView
//
//  Created by ElAmir Mansour on 30/04/2023.
//

import UIKit

class MarketCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        layer.cornerRadius = 10
        clipsToBounds = true

    }

    
}
