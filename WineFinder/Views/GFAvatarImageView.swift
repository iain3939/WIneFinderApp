//
//  GFAvatarImageView.swift
//  WineFinder
//
//  Created by iain Allen on 05/01/2020.
//  Copyright © 2020 iain Allen. All rights reserved.
//

import UIKit


class WFWineItemsImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds      = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
