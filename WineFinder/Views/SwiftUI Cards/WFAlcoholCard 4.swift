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
        VStack(alignment: .leading, spacing: 10) {
                
            Text("Alcohol")
                    .font(.title2)
                    .fontWeight(.medium)
                    .padding(.leading, 10)
                    .padding(.top, 10)
                
            HStack(alignment: .firstTextBaseline, spacing: 20) {
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Alcohol by volume:")
                        Text("Alcoholic content:")
                        Text("Grape Variety:")
                        Text("Wine colour:")
                        Text("Type of closure:")
                    }
                
                VStack(alignment: .leading, spacing: 20) {
                    Text(wine.wineAlcohol)
                    Text(wine.alcoholContent)
                    Text(wine.grapeVariety)
                        
                    Text(wine.wineColor)
                    Text(wine.typeOfClosure)
                }
                    Spacer()
                }
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 20))
            }
            
            .foregroundColor(.gray)
            .background(Color.white)
            .cornerRadius(14)
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        }
    }

struct WFAlcoholCard_Previews: PreviewProvider {
    static var previews: some View {
        WFAlcoholCard(wine: Wine(wineName: "Brancott Estate Sauvignon Blanc 75cl", wineDescription: "Award Winning Premium white wine from Marlborough, New Zealand has sweet ripe fruit characters with a delightful mix of citrus, floral, pear and tropical fruit and a crisp nettle highlight, making it perfect for dinner parties and BBQ's. Our story began over 40 years ago with a bold idea to plant vines in Marlborough, New Zealand..", wineCountry: "New Zealand", wineFood: "", wineImg:"BrancottEstateSauvignonBlanc", wineAlcohol: "", alcoholContent: "", grapeVariety: "Syrah, Grenache, Cinsault", wineColor:"",typeOfClosure: "", tasteCategory: "2", isRanged: true))
    }
}
