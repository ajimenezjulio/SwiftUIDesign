//
//  TabBar.swift
//  SwiftUIDesign
//
//  Created by Aguilar, Julio on 11/3/19.
//  Copyright © 2019 Julio Cesar. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Home().tabItem({
                Image("IconHome")
                Text("Home")
            })

            CertificatesView().tabItem({
                Image("IconCards")
                Text("Certificates")
            })

            Settings().tabItem({
                Image("IconSettings")
                Text("Settings")
            })
        }
        // Ignore the edges in the parent container
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar()
            // For now, environment only works in tab bars
            TabBar()
                .environment(\.colorScheme, .dark)
                .environment(\.sizeCategory, .extraLarge)
        }
    }
}
