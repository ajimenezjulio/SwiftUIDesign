//
//  Home.swift
//  SwiftUIDesign
//
//  Created by Aguilar, Julio on 10/31/19.
//  Copyright © 2019 Julio Cesar. All rights reserved.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            MenuRow(image: "person.crop.circle", text: "My Account")
            MenuRow(image: "creditcard", text: "Billing")
            MenuRow(image: "person.and.person", text: "Team")
            MenuRow(image: "arrow.uturn.down", text: "Sign out")
            Spacer()
        }
        .padding(.top, 20)
        .padding(30)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        // Padding in trailing so the view will shring from the right
        .padding(.trailing, 60)
        .shadow(radius: 20)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


// MARK: - View Components
struct MenuRow : View {
    var image = "creditcard"
    var text = "My Account"
    
    var body : some View {
        return HStack {
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(Color("icons"))
                // Its good practice to give a frame to the icons, because each of them have different sizes. So when given a frame they will be always centered
                .frame(width: 32, height: 32)
            Text(text)
                .font(.headline)
            Spacer()
        }
    }
}
