//
//  Color.swift
//  WineFinderApp
//
//  Created by iain Allen on 17/02/2021.
//

import UIKit


struct BackgroundColor {
    let color: UIColor
    
    
}

extension BackgroundColor: Encodable {
    
    public func encode(to encoder: Encoder) throws {
        let nsCoder = NSKeyedArchiver(requiringSecureCoding: true)
        color.encode(with: nsCoder)
        var container = encoder.unkeyedContainer()
        try container.encode(nsCoder.encodedData)
    }
}

extension BackgroundColor: Decodable {
    
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        let decodedData = try container.decode(Data.self)
        let nsCoder = try NSKeyedUnarchiver(forReadingFrom: decodedData)
        guard let color = UIColor(coder: nsCoder) else {
            
            struct UnexpectedlyFoundNilError: Error {}
            
            throw UnexpectedlyFoundNilError()
        }
        
        self.color = color
    }
    
}

//public extension UIColor {
//    func codable() -> BackgroundColor {
//        return BackgroundColor(color: self)
//    }
//}

