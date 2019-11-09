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
    @State var showCertificates = false
    @State var viewState = CGSize.zero
    @State var showLogin = false
    
    var menu: [Menu] = menuData
    
    var body: some View {
        ZStack {
            
            HomeList(courses: coursesData)
                .blur(radius: show ? 50 : 0)
                .scaleEffect(showLogin ? 0.95 : 1)
                .animation(.default)
                .blur(radius: showCertificates ? 20-viewState.height/10 : 0)
            
            ZStack {
                Spacer()
            }
            .background(Color.black)
            .opacity(showCertificates ? Double(35-viewState.height/5)/100 : 0)
            .animation(.default)
            
            MenuButton(show: $show)
                .blur(radius: showCertificates ? 5-viewState.height/30 : 0)
                .offset(y: -viewState.height/10)
                .animation(.default)
            
            MenuRight(showCertificates: $showCertificates, showLogin: $showLogin)
                .blur(radius: showCertificates ? 6-viewState.height/30 : 0)
                .offset(y: -viewState.height/20)
                .animation(.default)
            
            // Passing the show state and bind it
            MenuView(menu: menu)
                .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10.0, z: 0))
                .animation(.easeInOut(duration: 0.3))
                .offset(x: show ? 0 : -UIScreen.main.bounds.width)
                // This will place the VStack one screen off on the left
                //.offset(x: show ? 0 : -UIScreen.main.bounds.width)
                .onTapGesture {
                    self.show.toggle()
                }
            
            CertificatesView()
                .cornerRadius(showCertificates ? viewState.height/5 : 30)
                .shadow(color: Color("buttonShadow"), radius: 30, x: 0, y: 0)
                .offset(y: showCertificates ? 0 : screen.height + 200)
                .offset(y: viewState.height)
                .rotationEffect(Angle(degrees: showCertificates ? 0 : -30))
                .animation(.default)
                .scaleEffect(1-viewState.height/1000)
                .onTapGesture {
                    self.showCertificates.toggle()
            }
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.viewState = value.translation
                }
                .onEnded { value in
                    if self.viewState.height > 100 {
                        self.showCertificates = false
                    }
                    self.viewState = .zero
                }
            )
            
            Login(show: $showLogin)
                .onTapGesture { self.showLogin.toggle() }
                .opacity(showLogin ? 1 : 0)
                .offset(y: showLogin ? 0 : 20)
                .animation(Animation.easeInOut)
        }
        .background(Color("background"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


// MARK: - View Components

struct MenuButton : View {
    @Binding var show : Bool
    
    var body : some View {
        return
            // Floating button
            VStack {
                HStack {
                    Button(action: {
                        self.show.toggle()
                    }) {
                        HStack {
                            Spacer()
                            Image(systemName: "list.dash")
                                .foregroundColor(.primary)
                        }
                        .padding(17)
                    }
                    .frame(width: 90, height: 56)
                    .background(Color("button"))
                    .cornerRadius(30)
                    .shadow(color: Color("buttonShadow"), radius: 10, y: 10)
                    .offset(x: -42, y:82)
                    Spacer()
                }
                
                Spacer()
        }
    }
}

struct MenuRight : View {
    @Binding var showCertificates: Bool
    @State var showUpdateList = false
    @Binding var showLogin: Bool
    
    var body: some View {
        return VStack {
            HStack(spacing: 12) {
                Spacer()
                
                VStack { Image(systemName: "rectangle.stack") }
                    .frame(width: 44, height: 44)
                    .background(Color("button"))
                    .foregroundColor(.primary)
                    .cornerRadius(22)
                    .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
                    .onTapGesture { self.showCertificates.toggle() }
                
                VStack { Image(systemName: "person.crop.circle") }
                    .frame(width: 44, height: 44)
                    .background(Color("button"))
                    .foregroundColor(.primary)
                    .cornerRadius(22)
                    .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
                    .onTapGesture { self.showLogin.toggle() }
                
                Button(action: { self.showUpdateList.toggle() }) {
                    VStack { Image(systemName: "bell") }
                        .foregroundColor(.primary)
                        .frame(width: 44, height: 44)
                        .background(Color("button"))
                        .cornerRadius(22)
                        .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
                        .sheet(isPresented: $showUpdateList) {
                            UpdateList()
                    }
                }
            }
            .padding().offset(y: 70)
            
            Spacer()
        }
    }
}
