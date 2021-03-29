//
//  WFAlertPopup.swift
//  WineFinderApp
//
//  Created by iain Allen on 25/03/2021.
//

import SwiftUI

struct WFAlertPopup: View {
    @Binding var isAlertShowing: Bool
    var body: some View {
        
        VStack {
            Spacer()
            Image(systemName: "checkmark")
                .font(Font.headline)
                .foregroundColor(.green)
            Spacer()
            Text("Added to Checklist")
                .fontWeight(.bold)
                .bold()
                .foregroundColor(Color.gray)
            Spacer()
        }
        .frame(width: 100, height: 100)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 4)
    }
}

struct WFAlertPopup_Previews: PreviewProvider {
    static private var isAlertShowing = Binding.constant(false)
    static var previews: some View {
        WFAlertPopup(isAlertShowing: isAlertShowing)
    }
}
