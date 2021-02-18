//
//  CollectionViewCell.swift
//  WineFinder
//
//  Created by iain Allen on 16/08/2020.
//

import UIKit

class WFWineItemsCell: UICollectionViewCell {
    
    let wineAvator     = WFWineItemsImageView(frame: .zero)
    let wineListLabel       = WFWineItemsLabel(textAlignment: .center, fontSize: 11)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {

        addSubview(wineAvator)
        addSubview(wineListLabel)
        wineListLabel.numberOfLines = 0
        let padding: CGFloat    = 8
        
        NSLayoutConstraint.activate([

            wineAvator.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            wineAvator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            wineAvator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            wineAvator.heightAnchor.constraint(equalTo: wineAvator.widthAnchor),

            wineListLabel.topAnchor.constraint(equalTo: wineAvator.bottomAnchor, constant: 12),
            wineListLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            wineListLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            wineListLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureCell(wineItem: Wine) {
        wineListLabel.text = wineItem.wineName
        wineAvator.image = UIImage(named: wineItem.wineImg)
        
    }
    
    
}



