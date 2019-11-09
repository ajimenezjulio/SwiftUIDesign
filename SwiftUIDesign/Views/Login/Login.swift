//
//  Login.swift
//  SwiftUIDesign
//
//  Created by Aguilar, Julio on 11/4/19.
//  Copyright © 2019 Julio Cesar. All rights reserved.
//

import SwiftUI

struct Login: View {
    @State var email: String = ""
    @State var password: String = ""
    @Binding var show: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            
            VStack(spacing: 20) {
                Image("Illustration6")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: isScreenTall ? 206 : 100)
                    .opacity(show ? 1 : 0)
                    .offset(y: show ? 0 : 20)
                    .animation(Animation.easeOut(duration: 0.6).delay(0.1))
                Text("Learn design & code. From scratch.")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .lineLimit(2)
                    .frame(height: 90)
                    .multilineTextAlignment(.center)
                    .opacity(show ? 1 : 0)
                    .offset(y: show ? 0 : 20)
                    .animation(Animation.easeOut(duration: 0.6).delay(0.3))
                Text("70 hours of video courses teaching SwiftUI, React and Design Tools. Login to access.")
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .lineSpacing(10)
                    .frame(height: 60)
                    .opacity(show ? 1 : 0)
                    .offset(y: show ? 0 : 20)
                    .animation(Animation.easeOut(duration: 0.6).delay(0.5))
                Button(action: { self.show.toggle() }) {
                    Text("Skip").foregroundColor(.white)
                        .opacity(show ? 1 : 0)
                        .offset(y: show ? 0 : 20)
                        .animation(Animation.easeOut(duration: 0.6).delay(0.6))
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.horizontal, 20)
            .padding(.vertical, isScreenTall ? 60 : 28)
            .background(Color("background6"))
            .animation(Animation.spring())
            .clipShape(
                RoundedRectangle(
                    cornerRadius: show && isScreenTall ? 30 : 0,
                    style: .continuous
                )
                    .size(CGSize(
                        width: screen.width,
                        height: show ? 600 : 0)
                )
            )
            
            VStack(spacing: 0) {
                HStack {
                    Image(systemName: "person.crop.circle.fill")
                        .frame(width: 16, height: 16)
                        .foregroundColor(Color("loginicon"))
                        .padding(.all)
                        .background(Color("background"))
                        .cornerRadius(16)
                        .padding(12)
                    TextField("Your email", text: $email)
                        .frame(height: 72)
                }
                Divider()
                HStack {
                    Image(systemName: "lock.fill")
                        .frame(width: 16, height: 16)
                        .foregroundColor(Color("loginicon"))
                        .padding(.all)
                        .background(Color("background"))
                        .cornerRadius(16)
                        .padding(12)
                    TextField("Password", text: $password)
                        .frame(height: 72)
                }
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: Color("buttonShadow2"), radius: 30, x: 0, y: 30)
            .padding(.horizontal, 16)
            .padding(.top, 30)
            .opacity(show ? 1 : 0)
            .offset(y: show ? 0 : 20)
            .animation(Animation.easeOut(duration: 0.6))
            
            HStack {
                Text("Forgot password?")
                    .font(.subheadline)
                    .underline()
                    .padding(.leading, 12)
                
                Spacer()
                
                Button(action: {}) {
                    Text("Log in").foregroundColor(.white)
                }
                .padding(.horizontal, 36)
                .padding(.vertical, 12)
                .background(Color("background3"))
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            }
            .padding(16)
            .opacity(show ? 1 : 0)
            .offset(y: show ? 0 : 20)
            .animation(Animation.easeOut(duration: 0.6))
            
            Spacer()
        }
        .background(BlurView(style: .systemMaterial))
        //        .edgesIgnoringSafeArea(.all)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login(show: .constant(true))
    }
}
