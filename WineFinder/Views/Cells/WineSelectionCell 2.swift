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
    
//    layer.cornerRadius, Number, 14
//    layer.shadowOpacity, Number 0.25
//    layer.shadowOffset, Size, {0, 10}
//    layer.shadowRadius, Number, 20
    
    
    func configureCell(category: WineCategorys) {
        nameLabel.text = category.name
        detailImage.image = UIImage(named: category.wineImage)
        backgroundCard.backgroundColor = category.backgroundColor
    }
    
    
    

}
