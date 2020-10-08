//
//  SwiftUIView.swift
//  WineFinder
//
//  Created by iain Allen on 16/09/2020.
//

import SwiftUI

struct WFProductStoreDetail: View {
   
    let color = #colorLiteral(red: 0.9338523746, green: 0.9283010364, blue: 0.9381195903, alpha: 1)
    let wine: Wine
    
    init(wine: Wine) {
        self.wine = wine
    }
    
    var body: some View {
        ZStack {
            Color(color)
                .edgesIgnoringSafeArea(.bottom)
            VStack(spacing: 20) {
                LocationInfo(wine: Wine(wineName: wine.wineName, wineDescription: wine.wineDescription, wineCountry: wine.wineCountry, wineFood: wine.wineFood, wineImg: wine.wineImg, wineAlcohol: wine.wineAlcohol, alcoholConetent: wine.alcoholConetent, grapeVariety: wine.grapeVariety, wineColor: wine.wineColor, typeOfClosure: wine.typeOfClosure, Tastecategory: "2", isRanged: wine.isRanged))
                RSSFeed()
                Spacer()
            }
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        WFProductStoreDetail(wine: Wine(wineName: "Brancott Estate Sauvignon Blanc 75cl", wineDescription: "Award Winning Premium white wine from Marlborough, New Zealand has sweet ripe fruit characters with a delightful mix of citrus, floral, pear and tropical fruit and a crisp nettle highlight, making it perfect for dinner parties and BBQ's. Our story began over 40 years ago with a bold idea to plant vines in Marlborough, New Zealand..", wineCountry: "New Zealand", wineFood: "", wineImg:"BrancottEstateSauvignonBlanc", wineAlcohol: "12.5%", alcoholConetent: "", grapeVariety: "Syrah, Grenache, Cinsault", wineColor:"White",typeOfClosure: "", Tastecategory: "2", isRanged: true))
    }
}

struct RSSFeed: View {
    var body: some View {
        VStack {
            HStack(spacing: 30) {
                Spacer()
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("   ")
                    Text("Sun")
                    Text("Mon")
                        .foregroundColor(Color.gray.opacity(0.5))
                    Text("Tue")
                    Text("Wed")
                    Text("Thu")
                        .foregroundColor(Color.gray.opacity(0.5))
                    Text("Fri")
                    Text("Sat")
                        .foregroundColor(Color.gray.opacity(0.5))
                }
                
                
                VStack(alignment: .center,spacing: 15) {
                    Text("Rec")
                    Text("1")
                    Text("0")
                        .foregroundColor(Color.gray.opacity(0.5))
                    Text("0")
                        .foregroundColor(Color.gray.opacity(0.5))
                    Text("5")
                    Text("0")
                        .foregroundColor(Color.gray.opacity(0.5))
                    Text("2")
                    Text("0")
                        .foregroundColor(Color.gray.opacity(0.5))
                }
                
                VStack(alignment: .center,spacing: 15) {
                    Text("Sales")
                    Text("3.6")
                    Text("0")
                        .foregroundColor(Color.gray.opacity(0.5))
                    Text("0.2")
                    Text("0.7")
                    Text("0")
                        .foregroundColor(Color.gray.opacity(0.5))
                    Text("5.0")
                    Text("0")
                        .foregroundColor(Color.gray.opacity(0.5))
                }
                
                VStack(alignment: .center,spacing: 15) {
                    Text("Fcast")
                    Text("1.6")
                    Text("0")
                        .foregroundColor(Color.gray.opacity(0.5))
                    Text("2.0")
                    Text("1.0")
                    Text("0")
                        .foregroundColor(Color.gray.opacity(0.5))
                    Text("4.0")
                    Text("0")
                        .foregroundColor(Color.gray.opacity(0.5))
                }
                VStack(alignment: .center,spacing: 15) {
                    Text("Var")
                    Text("-1.4")
                    Text("0")
                        .foregroundColor(Color.gray.opacity(0.5))
                    Text("-1.8")
                    Text("-0.4")
                    Text("0")
                        .foregroundColor(Color.gray.opacity(0.5))
                    Text("-3.0")
                    Text("0")
                        .foregroundColor(Color.gray.opacity(0.5))
                }
                
                Spacer()
                
            }
            .font(Font.system(size: 16, weight: .semibold))
            .foregroundColor(.gray)
            .padding(.top, 30)
            .padding(.bottom)
            
            HStack {
                
                Button("Previous", action: {})
                Spacer()
                Button("Next", action: {})
                
            }
            .font(Font.system(size: 16, weight: .semibold))
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
        }
        .background(Color.white)
        .cornerRadius(14)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
}

struct LocationInfo: View {
    
    let color = #colorLiteral(red: 0.9338523746, green: 0.9283010364, blue: 0.9381195903, alpha: 1)
    let wine: Wine
    
    init(wine: Wine) {
        self.wine = wine
    }
    
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .leading, spacing: 10) {
                Text(wine.wineName)
                    .font(Font.system(size: 17, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                Divider()
                HStack {
                    Text("SKU:")
                    Text("123567")
                }
                HStack {
                    Text("Pack Size:")
                    Text("6")
                }
                HStack {
                    Text("Sub Category:")
                    Text("New World")
                }
                HStack {
                    Text("Status:")
                    wine.isRanged ? Text("FS") : Text("NR")
                    
                }
            }
            .font(Font.system(size: 15, weight: .semibold))
            .foregroundColor(.gray)
            Image(uiImage: UIImage(named: wine.wineImg)!)
                .resizable()
                .frame(width: 110, height: 120, alignment: .center)
                .aspectRatio(contentMode: .fill)
            
            
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
        .background(Color.white)
        .cornerRadius(14)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
}
