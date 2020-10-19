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
    

    
    override func awakeFromNib() {
        backgroundCard.layer.cornerRadius       = 14
        backgroundCard.layer.shadowColor        = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor
        backgroundCard.layer.shadowOpacity      =  0.20
        backgroundCard.layer.shadowOffset       = CGSize(width: 0, height: 8)
        backgroundCard.layer.shadowRadius       = 4
    }
    
    
    func configureCell(category: WineCategorys) {
        nameLabel.text                    = category.name
        detailImage.image                 = UIImage(named: category.wineImage)
        backgroundCard.backgroundColor    = category.backgroundColor
    }
}
