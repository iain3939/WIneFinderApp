//
//  WFPriceCard.swift
//  WineFinderDetail
//
//  Created by iain Allen on 14/09/2020.
//

import SwiftUI

struct WFPriceCard: View {
    let color = #colorLiteral(red: 0.9338523746, green: 0.9283010364, blue: 0.9381195903, alpha: 1)
    
    let wine: Wine
    
    init(wine: Wine) {
        self.wine = wine
    }
    var body: some View {
        
        VStack(spacing: 5) {
            HStack {
                Text("Price")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
                Spacer()
                Text("Stock")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            Divider()
            HStack {
                
                 Text("£6.80")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
                Spacer()
                wine.isRanged ? Text("12 (36)") : Text("0")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
            }
            
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        }
        .background(Color.white)
        .cornerRadius(14)
        
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
}

struct WFPriceCard_Previews: PreviewProvider {
    static var previews: some View {
        WFPriceCard(wine: Wine(wineName: "Brancott Estate Sauvignon Blanc 75cl", wineDescription: "Award Winning Premium white wine from Marlborough, New Zealand has sweet ripe fruit characters with a delightful mix of citrus, floral, pear and tropical fruit and a crisp nettle highlight, making it perfect for dinner parties and BBQ's. Our story began over 40 years ago with a bold idea to plant vines in Marlborough, New Zealand..", wineCountry: "New Zealand", wineFood: "", wineImg:"BrancottEstateSauvignonBlanc", wineAlcohol: "Alcohol by volume: 12.5%", alcoholContent: "", grapeVariety: "", wineColor:"",typeOfClosure: "", tasteCategory: "2", isRanged: true))
    }
}
