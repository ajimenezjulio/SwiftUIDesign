//
//  Home.swift
//  SwiftUIDesign
//
//  Created by Aguilar, Julio on 10/31/19.
//  Copyright © 2019 Julio Cesar. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var show = false
    
    var body: some View {
        ZStack {
            Button(action: {
                self.show.toggle()
            }, label: {
                Text("Open Menu")
            })
            
            // Passing the show state and bind it
            MenuView(show: $show)
        }
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

struct MenuView : View {
    var menu = menuData
    // Binding because we need that this view comunicates with the parent view to control the @State show
    @Binding var show : Bool
    
    var body : some View {
        return VStack(alignment: .leading, spacing: 20) {
            ForEach(menu) { item in
                MenuRow(image: item.icon, text: item.title)
            }
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
            // The order matters, the transform should be after shadow but before animation for this case
            .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10, z: 0))
            .animation(.linear)
            // This will place the VStack one screen off on the left
            .offset(x: show ? 0 : -UIScreen.main.bounds.width)
            .onTapGesture {
                self.show.toggle()
        }
    }
}

// MARK: - Data Model

struct Menu : Identifiable {
    var id = UUID()
    var title : String
    var icon : String
}

let menuData = [
    Menu(title: "My Account", icon: "person.crop.circle"),
    Menu(title: "Billing", icon: "creditcard"),
    Menu(title: "Team", icon: "person.and.person"),
    Menu(title: "Sign out", icon: "arrow.uturn.down")
]
