//
//  WineCategories.swift
//  WineFinder
//
//  Created by iain Allen on 20/08/2020.
//

import UIKit
import UIColor_Hex_Swift


struct WineCategories: Decodable, Hashable {
    var  categoryName : String
    var  categoryImageURL : String
    var  wineCategories: [Wine]
    var  backgroundColor: ColorCodable
    
    static let jsonMockData = Bundle.main.decode([WineCategories].self, from: "JsonWineList.json")
}

struct ColorCodable : Decodable, Hashable {
    let color: UIColor

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        self.color = try UIColor(rgba_throws: string) 
    }
}
