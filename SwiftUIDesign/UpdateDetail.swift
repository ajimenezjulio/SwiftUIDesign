//
//  UpdateDetail.swift
//  SwiftUIDesign
//
//  Created by Aguilar, Julio on 11/3/19.
//  Copyright © 2019 Julio Cesar. All rights reserved.
//

import SwiftUI

struct UpdateDetail: View {
    var title = "SwiftUI"
    var text = "Loading..."
    var image = "Illustration1"
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.heavy)
                
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                // Make the height consistent
                .frame(height: 200)
            
            Text(text)
                // Unlimited number of lines
                .lineLimit(nil)
                // Make consistent the width size of the text to take the entire space. Don't forget to align it :)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
        .padding(30)
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
