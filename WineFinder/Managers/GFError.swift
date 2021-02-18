//
//  GFError.swift
//  GHFollowers
//
//  Created by iain Allen on 04/01/2020.
//  Copyright © 2020 iain Allen. All rights reserved.
//

import Foundation

enum GFError: String, Error {
    
    case invalidUsername    = "This username created a invalid reauest. Please try again"
    case unableToComplete   = "Unable to complete your request. PLease check your internet connection"
    case invalidResponse    = "Invalid response from the server. Please try again"
    case invalidData        = "The data received from the server was invalid, Please try again"
    case unableToAdd        = "There was an error adding this item. please try again."
    case alreadyInFavorites = "You've already favorited this user. You must really like them."
    
    
}
