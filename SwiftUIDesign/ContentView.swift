//
//  ContentView.swift
//  SwiftUIDesign
//
//  Created by Aguilar, Julio on 10/31/19.
//  Copyright © 2019 Julio Cesar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            
            // Custom blur view as UIView, SwiftUI still doesn't have a way to do it
            // SystemMaterial, adjust automatically between light and dark
            BlurView(style: .systemMaterial)
            
            TitleView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
            CardBottomView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
            CardView()
                .background(show ? Color.red : Color("background9"))
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .scaleEffect(0.85)
                .rotationEffect(Angle(degrees: show ? 15 : 0))
                //.rotation3DEffect(Angle(degrees: show ? 50 : 0), axis: (x: 10, y: 10, z: 10))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.6))
                .offset(x: viewState.width, y: viewState.height)
            
            CardView()
                .background(show ? Color("background5") : Color("background8"))
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
                //.rotation3DEffect(Angle(degrees: show ? 40 : 0), axis: (x: 10, y: 10, z: 10))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.4))
                .offset(x: viewState.width, y: viewState.height)
            
            CertificateView()
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 5 : 0))
                //.rotation3DEffect(Angle(degrees: show ? 30 : 0), axis: (x: 10, y: 10, z: 10))
                .animation( .interpolatingSpring(mass: 1, stiffness: 100, damping: 10, initialVelocity: 0) )
                .onTapGesture {
                    self.show.toggle()
            }
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.viewState = value.translation
                        self.show = true
                }
                .onEnded { value in
                    self.viewState = CGSize.zero
                    self.show = false
                }
            )
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// MARK: - View Components

struct CardView : View {
    var body: some View {
        return VStack {
            Text("Card Back")
        }
        .frame(width: 340, height: 220)
    }
}

struct CertificateView : View {
    var item = Certificate(title: "UI Design", image: "Background", width: 340, height: 220)
    
    var body: some View {
        return VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color("accent"))
                        .padding(.top)
                    Text("Certificate")
                        .foregroundColor(.white)
                }
                Spacer()
                Image("Logo")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
            }
            .padding(.horizontal)
            Spacer()
            Image(item.image)
                // These is to adjust the image when row created in CertificateRow
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .offset(y: 50)
        }
        .frame(width: CGFloat(item.width), height: CGFloat(item.height))
        .background(Color.black)
        .cornerRadius(10)
        .shadow(radius: 20)
    }
}

struct TitleView : View {
    var body: some View {
        return VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Spacer()
            }
            Image("Illustration5")
            Spacer()
        }
        .padding()
    }
}

struct CardBottomView : View {
    var body: some View {
        return
            // Spacing between each element of the stack of 20
            VStack(spacing: 20) {
                Rectangle()
                    .frame(width: 60, height: 6)
                    .cornerRadius(3)
                    .opacity(0.1)
                Text("This certificate is proof that Julio has succesfully achieved the Swift UI Design course. Please refer below for information regarding the authority.")
                    .lineLimit(10)
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .padding(.horizontal)
            // Instead of a constant color we can use a view that supports dark mode
            .background(BlurView(style: .systemMaterial))
            .cornerRadius(30)
            // The shadows need always a background color in order to be displayed
            .shadow(radius: 20)
            .offset(y: UIScreen.main.bounds.height - 170)
    }
}
