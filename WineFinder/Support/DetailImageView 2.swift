//
//  DetailImageView.swift
//  ViewTest
//
//  Created by iain Allen on 19/08/2020.
//

import UIKit

class DetailImageView: UIImageView {

    let placeholder = Images.placeholder
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        clipsToBounds = true
        image = placeholder
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
