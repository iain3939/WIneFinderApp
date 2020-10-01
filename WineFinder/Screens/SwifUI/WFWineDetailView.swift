//
//  WFWineDetailView.swift
//  WineFinder
//
//  Created by iain Allen on 16/09/2020.
//

import SwiftUI
@available(iOS 13.0, *)
struct WFWineDetailView: View {
    
    let wine: Wine
    
    init(wine: Wine) {
        self.wine = wine
    }
    
    let color = #colorLiteral(red: 0.9338523746, green: 0.9283010364, blue: 0.9381195903, alpha: 1)
    var body: some View {
        
        ZStack {
            Color(color)
                .edgesIgnoringSafeArea(.bottom)
            
            ScrollView {
                
                VStack(spacing: 20) {
                    
                    WFWineImageCard(wine: Wine(wineName: wine.wineName, wineDescription: wine.wineDescription, wineCountry: wine.wineCountry , wineFood: wine.wineFood, wineImg: wine.wineImg, wineAlcohol: wine.wineAlcohol,alcoholConetent: "", grapeVariety: "", wineColor:"",typeOfClosure: "", Tastecategory: "2"))
                    
                    WFPriceCard()
                    
                    WFStockCard(wine: Wine(wineName: wine.wineName, wineDescription: wine.wineDescription, wineCountry: wine.wineCountry , wineFood: wine.wineFood, wineImg: wine.wineImg, wineAlcohol: wine.wineAlcohol,alcoholConetent: "", grapeVariety: "", wineColor:"",typeOfClosure: "", Tastecategory: "2"))
                    
                    WFDescriptionCard(wine: Wine(wineName: wine.wineName, wineDescription: wine.wineDescription, wineCountry: wine.wineCountry , wineFood: wine.wineFood, wineImg: wine.wineImg, wineAlcohol: wine.wineAlcohol, alcoholConetent: "", grapeVariety: "", wineColor:"",typeOfClosure: "", Tastecategory: "2"))
                    
                    WFCountry(wine: Wine(wineName: wine.wineName, wineDescription: wine.wineDescription, wineCountry: wine.wineCountry , wineFood: wine.wineFood, wineImg: wine.wineImg, wineAlcohol: wine.wineAlcohol, alcoholConetent: "", grapeVariety: "", wineColor:"",typeOfClosure: "", Tastecategory: "2"))
                    
                    WFAlcoholCard(wine: Wine(wineName: wine.wineName, wineDescription: wine.wineDescription, wineCountry: wine.wineCountry , wineFood: wine.wineFood, wineImg: wine.wineImg, wineAlcohol: wine.wineAlcohol, alcoholConetent: wine.alcoholConetent, grapeVariety: wine.grapeVariety  , wineColor:wine.wineColor,typeOfClosure: wine.typeOfClosure, Tastecategory: "2"))
                }
            }
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        WFWineDetailView(wine:  Wine(wineName: "Brancott Estate Sauvignon Blanc 75cl", wineDescription: "Award Winning Premium white wine from Marlborough, New Zealand has sweet ripe fruit characters with a delightful mix of citrus, floral, pear and tropical fruit and a crisp nettle highlight, making it perfect for dinner parties and BBQ's. Our story began over 40 years ago with a bold idea to plant vines in Marlborough, New Zealand..", wineCountry: "New Zealand", wineFood: "", wineImg:"BrancottEstateSauvignonBlanc", wineAlcohol: "12.5%", alcoholConetent: "", grapeVariety: "Syrah, Grenache, Cinsault", wineColor:"White",typeOfClosure: "", Tastecategory: "2"))
    }
}


