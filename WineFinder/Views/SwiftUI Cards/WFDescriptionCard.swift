//
//  WFDescriptionCard.swift
//  WineFinderDetail
//
//  Created by iain Allen on 13/09/2020.
//

import SwiftUI

struct WFDescriptionCard: View {
    let color = #colorLiteral(red: 0.9338523746, green: 0.9283010364, blue: 0.9381195903, alpha: 1)
    
    let wine: Wine
    init(wine: Wine) {
        self.wine = wine
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Description")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.gray)
                .padding(.leading, 10)
                .padding(.top, 10)
            
            HStack {
                Spacer()
                Text(wine.wineDescription)
                    .foregroundColor(.gray)
                    .lineLimit(nil)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 10))
                Spacer()
            }
        }
        .background(Color.white)
        .cornerRadius(14)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
}

struct WFDescriptionCard_Previews: PreviewProvider {
    static var previews: some View {
        WFDescriptionCard(wine: Wine(wineName: "Brancott Estate Sauvignon Blanc 75cl", wineDescription: "Côtes de Provence Rosé", wineCountry: "New Zealand", wineFood: "", wineImg:"BrancottEstateSauvignonBlanc", wineAlcohol: "Alcohol by volume: 12.5%", alcoholContent: "", grapeVariety: "", wineColor:"",typeOfClosure: "", tasteCategory: "2", isRanged: true))
    }
}
