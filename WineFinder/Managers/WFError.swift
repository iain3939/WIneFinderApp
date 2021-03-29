//
//  WFError.swift
//  WineFinderApp
//
//  Created by iain Allen on 04/01/2020.
//  Copyright © 2020 iain Allen. All rights reserved.
//

import Foundation

enum WFError: String, Error {
    
    case unableToAdd        = "There was an error adding this item. please try again."
    case alreadyInFavorites = "You've already favorited this item."
    
    
}
