//
//  WFCountry.swift
//  WineFinderDetail
//
//  Created by iain Allen on 16/09/2020.
//

import SwiftUI

struct WFCountry: View {
    let color = #colorLiteral(red: 0.9338523746, green: 0.9283010364, blue: 0.9381195903, alpha: 1)
    
    let wine: Wine
    init(wine: Wine) {
        self.wine = wine
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                
                Text("Country of Origin:")
                    .font(Font.system(size: 17, weight: .semibold))
                    .padding(.leading, 10)
                
                Text(verbatim: wine.wineCountry)
                    .font(Font.system(size: 15, weight: .medium))
                    .padding(.horizontal)
                Spacer()
            }
            .frame(height: 45)
            .foregroundColor(.gray)
            .background(Color.white)
            .cornerRadius(14)
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        }
    }
}

struct WFCountry_Previews: PreviewProvider {
    static var previews: some View {
        WFCountry(wine: Wine(wineName: "Brancott Estate Sauvignon Blanc 75cl", wineDescription: "Award Winning Premium white wine from Marlborough, New Zealand has sweet ripe fruit characters with a delightful mix of citrus, floral, pear and tropical fruit and a crisp nettle highlight, making it perfect for dinner parties and BBQ's. Our story began over 40 years ago with a bold idea to plant vines in Marlborough, New Zealand..", wineCountry: "New Zealand", wineFood: "", wineImg:"BrancottEstateSauvignonBlanc", wineAlcohol: "Alcohol by volume: 12.5%", alcoholConetent: "", grapeVariety: "", wineColor:"",typeOfClosure: "", Tastecategory: "2", isRanged: true))
    }
}
