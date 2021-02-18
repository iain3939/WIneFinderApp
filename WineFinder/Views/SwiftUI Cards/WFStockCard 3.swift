//
//  WFStockCard.swift
//  WineFinderDetail
//
//  Created by iain Allen on 14/09/2020.
//

import SwiftUI

struct WFStockCard: View {
    let color = #colorLiteral(red: 0.9338523746, green: 0.9283010364, blue: 0.9381195903, alpha: 1)
    
    let wine: Wine
    init(wine: Wine) {
        self.wine = wine
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            
            Text("Stock comming for this week")
                .font(Font.system(size: 17))
                .fontWeight(.medium)
                .foregroundColor(.gray)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
            
            HStack(spacing: 12) {
                Spacer()
                
                VStack(spacing: 5) {
                    Text("Sun")
                    Image(systemName: "0.square")
                        .resizable()
                        .foregroundColor(Color.gray)
                        .frame(width: 25, height: 25)
                }
                
                VStack(spacing: 5) {
                    Text("Mon")
                    Image(systemName: wine.isRanged ? "2.square.fill" : "0.square")
                        .resizable()
                        .foregroundColor(wine.isRanged ? Color.orange : Color.gray)
                        .frame(width: 25, height: 25)
                }
                
                VStack(spacing: 5) {
                    Text("Tue")
                    Image(systemName: wine.isRanged ? "4.square.fill" : "0.square")
                        .resizable()
                        .foregroundColor(wine.isRanged ? Color.orange : Color.gray)
                        .frame(width: 25, height: 25)
                }
                
                VStack(spacing: 5) {
                    Text("Wed")
                    Image(systemName: wine.isRanged ? "7.square.fill" : "0.square")
                        .resizable()
                        .foregroundColor(wine.isRanged ? Color.orange : Color.gray)
                        .frame(width: 25, height: 25)
                }
                
                VStack(spacing: 5) {
                    Text("Thu")
                    Image(systemName: "0.square")
                        .resizable()
                        .foregroundColor(Color.gray)
                        .frame(width: 25, height: 25)
                }
                
                VStack(spacing: 5) {
                    Text("Fri")
                    Image(systemName: wine.isRanged ? "1.square.fill" : "0.square")
                        .resizable()
                        .foregroundColor(wine.isRanged ? Color.orange : Color.gray)
                        .frame(width: 25, height: 25)
                }
                
                VStack(spacing: 5) {
                    Text("Sat")
                    Image(systemName: wine.isRanged ? "12.square.fill" : "0.square")
                        .resizable()
                        .foregroundColor(wine.isRanged ? Color.orange : Color.gray)
                        .frame(width: 25, height: 25)
                }
                Spacer()
                
            }
            .foregroundColor(.gray)
            .padding(.bottom,10)
            NavigationLink(
                destination: WFProductStoreDetail(wine: Wine(wineName: wine.wineName, wineDescription: wine.wineDescription, wineCountry: wine.wineCountry, wineFood: wine.wineFood, wineImg: wine.wineImg, wineAlcohol: wine.wineAlcohol, alcoholContent: wine.alcoholContent, grapeVariety: wine.grapeVariety, wineColor: wine.wineColor, typeOfClosure: wine.typeOfClosure, tasteCategory: "2", isRanged: wine.isRanged))) {
                Spacer()
                Image(systemName: "info.circle")
                    
                    .font(.callout)
                    .foregroundColor(.gray)
                    .padding(.trailing, 10)
                    .padding(.bottom, 10)
            }
        }
        .background(Color.white)
        .cornerRadius(14)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
}

struct WFStockCard_Previews: PreviewProvider {
    static var previews: some View {
        WFStockCard(wine: Wine(wineName: "Brancott Estate Sauvignon Blanc 75cl", wineDescription: "Award Winning Premium white wine from Marlborough, New Zealand has sweet ripe fruit characters with a delightful mix of citrus, floral, pear and tropical fruit and a crisp nettle highlight, making it perfect for dinner parties and BBQ's. Our story began over 40 years ago with a bold idea to plant vines in Marlborough, New Zealand..", wineCountry: "New Zealand", wineFood: "", wineImg:"BrancottEstateSauvignonBlanc", wineAlcohol: "Alcohol by volume: 12.5%", alcoholContent: "", grapeVariety: "", wineColor:"",typeOfClosure: "", tasteCategory: "2", isRanged: true))
    }
}

