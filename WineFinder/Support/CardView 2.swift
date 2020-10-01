//
//  CardView.swift
//  ViewTest
//
//  Created by iain Allen on 19/08/2020.
//

import UIKit

class CardView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
          
        backgroundColor = .white
           layer.cornerRadius = 10
           
           translatesAutoresizingMaskIntoConstraints = false
           
           
           
       }


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
