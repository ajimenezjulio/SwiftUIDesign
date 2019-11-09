//
//  CertificatesView.swift
//  SwiftUIDesign
//
//  Created by Aguilar, Julio on 10/31/19.
//  Copyright © 2019 Julio Cesar. All rights reserved.
//

import SwiftUI

struct CertificatesView: View {
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
            
            CardBottom(text: "This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
                .blur(radius: show ? 50 : 0)
                .animation(.easeInOut(duration: 0.3))
                .offset(y: screen.height-170)
            
            CertificateItem(title: "Sketch", image: "Certificate3", background: Color("background9"))
                .frame(width: 340.0, height: 220)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .scaleEffect(0.85)
                .rotationEffect(Angle(degrees: show ? 15 : 0))
                .blendMode(.hardLight)
                .offset( x: viewState.width, y: viewState.height )
                .animation(.easeInOut(duration: 0.6))
            
            CertificateItem(title: "SwiftUI", image: "Certificate2", background: Color("background8"))
                .frame(width: 340.0, height: 220)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .scaleEffect(0.90)
                .blendMode(.hardLight)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
                .offset( x: viewState.width, y: viewState.height )
                .animation(.easeInOut(duration: 0.4))
            
            CertificateItem(title: "UI Design", image: "Certificate1")
                .frame(width: 340.0, height: 220)
                .shadow(radius: 20)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 5 : 0))
                .offset( x: viewState.width, y: viewState.height )
                .animation(.spring())
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
        .frame(minWidth: 0, maxWidth: 712, minHeight: 0, maxHeight: screen.height)
    }
}

struct CertificatesView_Previews: PreviewProvider {
    static var previews: some View {
        CertificatesView()
    }
}

struct TitleView : View {
    var body: some View {
        return VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.all)
                    .padding(.top, 40)
                Spacer()
            }
            Image("Illustration5")
            Spacer()
        }
        .padding()
    }
}
