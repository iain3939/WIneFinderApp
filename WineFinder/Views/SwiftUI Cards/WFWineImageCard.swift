//
//  WFWineImageCard.swift
//  WineFinderDetail
//
//  Created by iain Allen on 13/09/2020.
//

import SwiftUI

struct WFWineImageCard: View {
    let color = #colorLiteral(red: 0.9338523746, green: 0.9283010364, blue: 0.9381195903, alpha: 1)
    
    let wine: Wine
    init(wine: Wine) {
        self.wine = wine
    }
    
    var body: some View {
        
        
        VStack(alignment: .center, spacing: 15) {
            Image(uiImage: UIImage(named: wine.wineImg)!)
                .resizable()
                .frame(width: 250, height: 250, alignment: .center)
                .aspectRatio(contentMode: .fill)
            
            Text(wine.wineName)
                .font(Font.system(size: 17))
                .fontWeight(.medium)
                .foregroundColor(.gray)
                .lineLimit(nil)
                .multilineTextAlignment(.center)
            
            HStack(spacing:5) {
                Text("Dry")
                Spacer()
                Group {
                    Image(systemName: "1.circle")
                    Image(systemName: "2.circle.fill")
                    Image(systemName: "3.circle")
                    Image(systemName: "4.circle")
                    Image(systemName: "5.circle")
                    Image(systemName: "6.circle")
                    Image(systemName: "7.circle")
                    Image(systemName: "8.circle")
                }
                Spacer()
                Text("Sweet")
            }
            .foregroundColor(.gray)
            .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
            
            HStack {
                Spacer()
                HStack {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(Color.orange)
                        Text("Add to list")
                            .font(Font.system(size: 15))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.orange)
                    }
                    .cornerRadius(14)
                    .padding(.leading, 32)
                    .padding(.bottom,20)
                    
                    Spacer()
                    
                }
                if wine.isRanged == true {
                Text("Ranged")
                    .font(Font.system(size: 15))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.green)
                    
                    .frame(width: 120, height: 22)
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.green, lineWidth: 3)
                    )
                    .cornerRadius(14)
                    .padding(.trailing, 40)
                    .padding(.bottom,20)
                } else {
                    Text("Not-Ranged")
                        .font(Font.system(size: 15))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.red)
                        
                        .frame(width: 120, height: 22)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.red, lineWidth: 3)
                        )
                        .cornerRadius(14)
                        .padding(.trailing, 40)
                        .padding(.bottom,20)
                }
            }
        }
        .background(Color.white)
        .cornerRadius(14)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
}

struct WFWineImageCard_Previews: PreviewProvider {
    static var previews: some View {
        WFWineImageCard(wine: Wine(wineName: "Brancott Estate Sauvignon Blanc 75cl", wineDescription: "Award Winning Premium white wine from Marlborough, New Zealand has sweet ripe fruit characters with a delightful mix of citrus, floral, pear and tropical fruit and a crisp nettle highlight, making it perfect for dinner parties and BBQ's. Our story began over 40 years ago with a bold idea to plant vines in Marlborough, New Zealand..", wineCountry: "New Zealand", wineFood: "", wineImg:"BrancottEstateSauvignonBlanc", wineAlcohol: "Alcohol by volume: 12.5%", alcoholConetent: "", grapeVariety: "", wineColor:"",typeOfClosure: "", Tastecategory: "2", isRanged: true))
    }
}
