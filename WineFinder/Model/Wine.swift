//
//  Wine.swift
//  WineFinder
//
//  Created by iain Allen on 16/08/2020.
//

import UIKit


struct Wine: Hashable {
    var id = UUID()
    
    var wineName: String
    var wineDescription: String
    var wineCountry: String
    var wineFood: String
    var wineImg: String
    var wineAlcohol: String
    var alcoholConetent: String
    var grapeVariety: String
    var wineColor: String
    var typeOfClosure: String
    var Tastecategory: String
    
    
    
    func hash(into hasher: inout Hasher) {
      // 2
      hasher.combine(id)
    }
    // 3
    static func == (lhs: Wine, rhs: Wine) -> Bool {
      lhs.id == rhs.id
    }
    
    
    
    
}


 
    
    





