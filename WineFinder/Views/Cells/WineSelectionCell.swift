//
//  WineSelectionCell.swift
//  WineFinder
//
//  Created by iain Allen on 20/08/2020.
//

import UIKit

class WineSelectionCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var backgroundCard: UIView!
    
    override func draw(_ rect: CGRect) {
        backgroundCard.layer.cornerRadius = 14
    }
    
    
    func configureCell(category: WineCategorys) {
        nameLabel.text                    = category.name
        detailImage.image                 = UIImage(named: category.wineImage)
        backgroundCard.backgroundColor    = category.backgroundColor
    }
}
