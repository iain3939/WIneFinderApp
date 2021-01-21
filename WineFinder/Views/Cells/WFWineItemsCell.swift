//
//  CollectionViewCell.swift
//  WineFinder
//
//  Created by iain Allen on 16/08/2020.
//

import UIKit

class WFWineItemsCell: UICollectionViewCell {
    
    let wineItemsImageView     = WFWineItemsImageView(frame: .zero)
    let wineItemsLabel       = WFWineItemsLabel(textAlignment: .center, fontSize: 11)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCellShadow() {
        contentView.backgroundColor          = .systemBackground
        contentView.layer.cornerRadius       = 14
        contentView.layer.shadowColor        = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor
        contentView.layer.shadowOpacity      =  0.20
        contentView.layer.shadowOffset       = CGSize(width: 0, height: 8)
        contentView.layer.shadowRadius       = 4
    }
    
    private func configure() {
        configureCellShadow()
        addSubview(wineItemsImageView)
        addSubview(wineItemsLabel)
        wineItemsLabel.numberOfLines = 0
        let padding: CGFloat    = 8
        
        NSLayoutConstraint.activate([
            wineItemsImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            wineItemsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            wineItemsImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),

            wineItemsLabel.topAnchor.constraint(equalTo: wineItemsImageView.bottomAnchor, constant: 12),
            wineItemsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            wineItemsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
        ])
    }
    
    func configureCell(wineItem: Wine) {
        wineItemsLabel.text = wineItem.wineName
        wineItemsImageView.image = UIImage(named: wineItem.wineImg)
        
    }
}



