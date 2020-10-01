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
    
    
    
    override func draw(_ rect: CGRect) {
        bgView.layer.cornerRadius = 10
        wineName.numberOfLines = 0
        
        
    }
    
    
    func configureCell(wine: Wine) {
        wineImg.image = UIImage(named: wine.wineImg)
        wineName.text = wine.wineName
        
    }
}


