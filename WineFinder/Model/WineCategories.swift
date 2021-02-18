//
//  WineCategories.swift
//  WineFinder
//
//  Created by iain Allen on 20/08/2020.
//

import UIKit


struct WineCategories: Codable, Hashable {
    var  categoryName : String
    var  categoryImageURL : String
    var  wineCategories: [Wine]
    
    
    static let jsonMockData = Bundle.main.decode([WineCategories].self, from: "JsonWineList.json")
}












