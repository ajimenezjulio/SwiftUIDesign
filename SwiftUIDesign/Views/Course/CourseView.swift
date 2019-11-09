//
//  CourseView.swift
//  SwiftUIDesign
//
//  Created by Aguilar, Julio on 11/4/19.
//  Copyright © 2019 Julio Cesar. All rights reserved.
//

import SwiftUI

struct CourseView: View {
    var title = "Build an app with SwiftUI"
        var image = "Illustration1"
        var body: some View {
            GeometryReader { geometry in
                ZStack {
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color("gradient1"), Color("gradient2")]), startPoint: .top, endPoint: .bottom))
                    
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text(self.title)
                                .foregroundColor(Color("primary"))
                                .font(.title)
                                .fontWeight(.heavy)
                                .lineLimit(nil)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .frame(height: 70)
                            Text("10 sections")
                                .foregroundColor(Color("secondary"))
                                .padding(.top, 0)
                        }
                        .frame(width: 180)
                        
                        Image(self.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width-60, height: 200)
                            .padding()
                        Spacer()
                    }
                    .padding(.top, 40)
                    .padding(.leading, 10)
                    
                    ZStack(alignment: .topTrailing) {
                        HStack {
                            Image(systemName: "play.fill")
                                .font(.largeTitle)
                        }
                        .frame(width: 100, height: 80)
                            .background(Color("accent"))
                            .cornerRadius(30)
                            .shadow(color: Color("accentShadow"), radius: 10, x: 0, y: 10)
                        Spacer()
                    }
                    .padding(.top, 20)
                    .padding(.all, 20)
                    
                    ScrollView {
                        CardBottom()
                            .background(Color.white)
                            .cornerRadius(30)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .padding(.top, 400)
                    }
                    .frame(width: geometry.size.width)
                }
            }
        }
    }
struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
