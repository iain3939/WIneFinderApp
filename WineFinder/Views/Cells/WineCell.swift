//
//  CollectionViewCell.swift
//  WineFinder
//
//  Created by iain Allen on 16/08/2020.
//

import UIKit

class WineCell: UICollectionViewCell {
    
    @IBOutlet weak var wineImg: UIImageView!
    @IBOutlet weak var wineName: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var statusIndicator: UIView!
    
    override func awakeFromNib() {
        bgView.layer.cornerRadius               = 10
        bgView.layer.shadowColor                = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor
        bgView.layer.shadowOpacity              =  0.20
        bgView.layer.shadowOffset               = CGSize(width: 0, height: 5)
        bgView.layer.shadowRadius               = 4
        wineName.numberOfLines                  = 0
        statusIndicator.layer.cornerRadius      = 3
    }

    
    func configureCell(wine: Wine) {
        wineImg.image                   = UIImage(named: wine.wineImg)
        wineName.text                   = wine.wineName
        
        if wine.isRanged == true {
            statusIndicator.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        } else {
            statusIndicator.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        }
     }
}


