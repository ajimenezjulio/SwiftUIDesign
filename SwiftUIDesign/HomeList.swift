//
//  HomeList.swift
//  SwiftUIDesign
//
//  Created by Aguilar, Julio on 11/1/19.
//  Copyright © 2019 Julio Cesar. All rights reserved.
//

import SwiftUI

struct HomeList: View {
    var courses = coursesData
    @State var showContent = false
    
    var body: some View {
        ScrollView(Axis.Set.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(courses) { item in
                    
                    Button(action: {
                        self.showContent.toggle()
                    }, label: {
                        CourseView(title: item.title,
                                   image: item.image,
                                   color: item.color,
                                   shadowColor: item.shadowColor)
                        .sheet(isPresented: self.$showContent) { ContentView() }
                    })
                }
            }
            .padding(.leading, 30)
            Spacer()
        }
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}


// MARK: - View Components

struct CourseView : View {
    var title = "Build an app with SwiftUI"
    var image = "Illustration1"
    var color = Color("background3")
    var shadowColor = Color("backgroundShadow3")
    
    var body: some View {
        return VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(20)
                .lineLimit(4)
                // Make consistent the size of the text element for all texts
                .padding(.trailing, 50)
            Spacer()
            Image(image)
                .resizable()
                // Avoid the issue that the image has the color of the tint
                .renderingMode(.original)
                // Adjustin images to the size
                .aspectRatio(contentMode: .fit)
                .frame(width: 246, height: 150)
                // Make consistent the sizes of the images by adding a padding
                .padding(.bottom, 30)
        }
        .background(color)
        .cornerRadius(30)
        .frame(width: 246, height: 360)
        .shadow(color: shadowColor, radius: 20, x: 0, y: 20)
    }
}


// MARK: - Data Model

struct Course : Identifiable {
    var id = UUID()
    var title : String
    var image : String
    var color : Color
    var shadowColor : Color
}

let coursesData = [
    Course(title: "Build an app with SwiftUI",
           image: "Illustration1",
           color: Color("background3"),
           shadowColor: Color("backgroundShadow3")),
    
    Course(title: "Design Course",
           image: "Illustration2",
           color: Color("background4"),
           shadowColor: Color("backgroundShadow4"))
]
