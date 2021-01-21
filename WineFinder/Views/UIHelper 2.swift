//
//  UIHelper.swift
//  
//
//  Created by iain Allen on 07/01/2020.
//  Copyright © 2020 iain Allen. All rights reserved.
//

import UIKit

enum UIHelper {
    
    static func  createThreeColumFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width                       = view.bounds.width
        let padding: CGFloat            = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth              = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth                   = availableWidth / 2
        
        let flowLayout                  = UICollectionViewFlowLayout()
        flowLayout.sectionInset         = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize             = CGSize(width: itemWidth, height: itemWidth + 80)
    
        return flowLayout
    }
}
