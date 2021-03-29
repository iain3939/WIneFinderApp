//
//  ChecklistCell.swift
//  WineFinderApp
//
//  Created by iain Allen on 28/01/2021.
//

import UIKit

class ChecklistCell: UITableViewCell {

    static let  resuseID         = "ChecklistCell"
    let checklistImageView       = WFWineItemsImageView(frame: .zero)
    let checklistLabel           = WFWineItemsLabel(textAlignment: .left, fontSize: 11)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(checklistLabel)
        addSubview(checklistImageView)
        
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            checklistImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            checklistImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            checklistImageView.heightAnchor.constraint(equalToConstant: 60),
            checklistImageView.widthAnchor.constraint(equalToConstant: 60),
            
            checklistLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            checklistLabel.leadingAnchor.constraint(equalTo: checklistImageView.trailingAnchor, constant: 24),
            checklistLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            checklistLabel.heightAnchor.constraint(equalToConstant: 40)
            
            
            ])
    }
    
    func configureCell(favorites: Wine) {
        checklistLabel.text = favorites.wineName
        checklistImageView.image = UIImage(named: favorites.wineImg)
        
        
    }
    
}
