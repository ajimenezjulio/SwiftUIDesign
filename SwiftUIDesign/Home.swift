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
    @State var showProfile = false
    
    var body: some View {
        ZStack {
            
            ContentView()
                .background(Color.white)
                .cornerRadius(30)
                .shadow(radius: 20)
                .animation(.spring())
                // One screen off vertically
                .offset(y: showProfile ? 40 : UIScreen.main.bounds.height)
            
            MenuButton(show: $show)
                .offset(x: -30, y: showProfile ? 0 : 80)
                .animation(.spring())
            
            MenuRight(show: $showProfile)
                .offset(x: -16, y: showProfile ? 0 : 88)
                .animation(.spring())
            
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
        .animation(.default)
        // This will place the VStack one screen off on the left
        .offset(x: show ? 0 : -UIScreen.main.bounds.width)
        .onTapGesture {
            self.show.toggle()
        }
    }
}

struct CircleButton : View {
    var icon = "person.crop.circle"
    
    var body : some View {
        return HStack {
            Image(systemName: icon)
                .foregroundColor(.black)
        }
        .frame(width: 44, height: 44)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
    }
}

struct MenuButton : View {
    @Binding var show : Bool
    
    var body : some View {
        return
            // Floating button
            VStack {
                HStack {
                    Button(action: {
                        self.show.toggle()
                    }, label: {
                        HStack {
                            Spacer()
                            Image(systemName: "list.dash")
                                .foregroundColor(.black)
                        }
                        .padding(.trailing, 20)
                        .frame(width: 90, height: 60)
                        .background(Color.white)
                        .cornerRadius(30)
                        .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
                    })
                    Spacer()
                }
                Spacer()
        }
    }
}

struct MenuRight : View {
    @Binding var show : Bool
    
    var body : some View {
        return
            // Floating button
            VStack {
                HStack(spacing: 12) {
                    Spacer()
                    Button(action: {
                        self.show.toggle()
                    }, label: {
                        CircleButton(icon: "person.crop.circle")
                    })
                    
                    Button(action: {
                        self.show.toggle()
                    }, label: {
                        CircleButton(icon: "bell")
                    })
                }
                // Spacer inside a ZStack allows you to take the entire screen
                Spacer()
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
    Menu(title: "Team", icon: "person.2"),
    Menu(title: "Sign out", icon: "arrow.uturn.down")
]
