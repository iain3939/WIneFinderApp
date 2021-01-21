//
//  WineMenu.swift
//  WineFinder
//
//  Created by iain Allen on 20/08/2020.
//

import UIKit


struct WineCategorys: Codable, Hashable {
    var  categoryName : String
    var  categoryImageURL : String
    var  wineCategorys: [Wine]
    
    
    static let jsonMockData = Bundle.main.decode([WineCategorys].self, from: "JsonWineList.json")
}












