//
//  WineSelectionCell.swift
//  WineFinder
//
//  Created by iain Allen on 20/08/2020.
//

import UIKit

class WFCategoryCell: UICollectionViewCell {
    
    let categoryItemsLabel       = WFWineItemsLabel(textAlignment: .center, fontSize: 28)
    let categoryImage            = WFWineItemsImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureStackView() {
        let stackView = UIStackView(arrangedSubviews: [categoryItemsLabel, categoryImage])
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis              = .horizontal
        stackView.distribution      = .fill
        stackView.spacing           = 28
        stackView.alignment         = .center
        stackView.backgroundColor   = .systemBackground
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
        
    private func configure() {
        configureStackView()
        categoryItemsLabel.textColor = .orange
        categoryImage.contentMode = .scaleAspectFit
        
        contentView.layer.cornerRadius       = 14
        contentView.layer.shadowColor        = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor
        contentView.layer.shadowOpacity      =  0.20
        contentView.layer.shadowOffset       = CGSize(width: 0, height: 8)
        contentView.layer.shadowRadius       = 4
        
        NSLayoutConstraint.activate([
            categoryImage.widthAnchor.constraint(equalToConstant: 189),
            categoryImage.heightAnchor.constraint(equalToConstant: 210)
        ])
    }
    
    func configureCell(category: WineCategorys) {
        categoryItemsLabel.text  = category.categoryName
        categoryImage.image      = UIImage(named: category.categoryImageURL)
    }
}
