//
//  WineTitleLabel.swift
//  ViewTest
//
//  Created by iain Allen on 19/08/2020.
//

import UIKit

class WineTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .semibold)
    }
    
    private func configure() {
        numberOfLines = 0
        textColor = .systemGray
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor  = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
