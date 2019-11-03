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
            // We need tags to select content
            .tag(1)
            ContentView().tabItem({
                Image("IconCards")
                Text("Certificates")
            })
            .tag(2)
            UpdateList().tabItem({
                Image("IconSettings")
                Text("Updates")
            })
            .tag(3)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
