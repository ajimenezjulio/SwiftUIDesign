//
//  CardBottom.swift
//  SwiftUIDesign
//
//  Created by Aguilar, Julio on 11/4/19.
//  Copyright © 2019 Julio Cesar. All rights reserved.
//

import SwiftUI

struct CardBottom : View {
    var text = "5 years ago, I couldn’t write a single line of Swift. I learned it and moved to React, Flutter while using increasingly complex design tools. I don’t regret learning them because SwiftUI takes all of their best concepts. It is hands-down the best way for designers to take a first step into code."
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 60, height: 6)
                .cornerRadius(3.0)
                .opacity(0.1)
                .padding(.top, 16)
            VStack {
                Text(text)
                    .lineLimit(100)
                    .padding(20)
                    .frame(minWidth: 0, maxWidth: .infinity)
                Spacer()
            }
        }
        .background(BlurView(style: .systemMaterial))
        .cornerRadius(30)
        .shadow(color: Color("buttonShadow"), radius: 20, x: 0, y: 0)
    }
}

struct CardBottom_Previews: PreviewProvider {
    static var previews: some View {
        CardBottom()
    }
}
