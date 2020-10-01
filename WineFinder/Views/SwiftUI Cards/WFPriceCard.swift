//
//  WFPriceCard.swift
//  WineFinderDetail
//
//  Created by iain Allen on 14/09/2020.
//

import SwiftUI

struct WFPriceCard: View {
    let color = #colorLiteral(red: 0.9338523746, green: 0.9283010364, blue: 0.9381195903, alpha: 1)
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
                Text("12 (36)")
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
        WFPriceCard()
    }
}
