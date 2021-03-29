//
//  WFAlcoholCard.swift
//  WineFinderDetail
//
//  Created by iain Allen on 16/09/2020.
//

import SwiftUI

struct WFAlcoholCard: View {
    let color = #colorLiteral(red: 0.9338523746, green: 0.9283010364, blue: 0.9381195903, alpha: 1)
    
    let wine: Wine
    init(wine: Wine) {
        self.wine = wine
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("Alcohol")
                .font(.title2)
                .fontWeight(.medium)
                .padding(.top, 10)
                Spacer()
            }
            
            HStack(spacing: 20) {
                Text("Alcohol by volume:")
                Text(wine.wineAlcohol)
            }
            
            HStack(spacing: 28) {
                Text("Alcoholic content:")
                Text(wine.alcoholContent)
            }
            
            HStack(alignment: .top, spacing: 55) {
                
                Text("Grape Variety:")
                
                Text(wine.grapeVariety)
                    .lineLimit(4)
            }
            
            HStack(spacing: 67) {
                Text("Wine colour:")
                Text(wine.wineColor)
            }
            
            HStack(spacing: 38) {
                Text("Type of closure:")
                Text(wine.typeOfClosure)
            }
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))
        .foregroundColor(.gray)
        .background(Color.white)
        .cornerRadius(14)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
}

struct WFAlcoholCard_Previews: PreviewProvider {
    static var previews: some View {
        WFAlcoholCard(wine: Wine(wineName: "Brancott Estate Sauvignon Blanc 75cl", wineDescription: "Award Winning Premium white wine from Marlborough, New Zealand has sweet ripe fruit characters with a delightful mix of citrus, floral, pear and tropical fruit and a crisp nettle highlight, making it perfect for dinner parties and BBQ's. Our story began over 40 years ago with a bold idea to plant vines in Marlborough, New Zealand..", wineCountry: "New Zealand", wineFood: "", wineImg:"BrancottEstateSauvignonBlanc", wineAlcohol: "13%", alcoholContent: "9.8 units", grapeVariety: "50 to 55% Pinot Noir, 15 to 20% Pinot Meunier, 28 to 33% Chardonnay", wineColor:"White",typeOfClosure: "Natural Cork", tasteCategory: "2", isRanged: true))
    }
}
