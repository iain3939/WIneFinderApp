//
//  WFButton.swift
//  WineFinder
//
//  Created by iain Allen on 27/08/2020.
//

import UIKit

class WFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
        private func  configure() {
            
            titleLabel?.font    = UIFont.preferredFont(forTextStyle: .footnote)
            setTitleColor(.orange, for: .normal)
            translatesAutoresizingMaskIntoConstraints = false
        }
    
    convenience init(backgroundColor: UIColor, title: String) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        
    }
        
    
    
    
    
}
