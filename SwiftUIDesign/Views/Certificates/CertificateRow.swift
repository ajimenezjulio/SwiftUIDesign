//
//  CertificateRow.swift
//  SwiftUIDesign
//
//  Created by Aguilar, Julio on 11/3/19.
//  Copyright © 2019 Julio Cesar. All rights reserved.
//

import SwiftUI

struct CertificateRow: View {
    var certificates = certificateData
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Certificates")
                .font(.system(size: 20))
                .fontWeight(.heavy)
                .padding(.leading, 50)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(certificates) { item in
                        
                        CertificateItem(title: item.title, image: item.image)
                            .frame(width: 230.0, height: 150)
                            .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
                            .contextMenu {
                                VStack {
                                    Button(action: {}) {
                                        HStack {
                                            Text("Make First")
                                            Image(systemName: "star")
                                        }
                                    }
                                    Button(action: {}) {
                                        HStack {
                                            Text("Remove")
                                            Image(systemName: "trash")
                                        }
                                    }
                                }
                        }
                    }
                }
                .padding(.leading, 30)
                .padding(.top, 10)
                
                Spacer()
            }
            .frame(height: 200)
        }
    }
}

struct CertificateRow_Previews: PreviewProvider {
    static var previews: some View {
        CertificateRow()
    }
}

struct Certificate: Identifiable {
    var id = UUID()
    var title: String
    var image: String
}

let certificateData = [
    Certificate(title: "UI Design", image: "Certificate1"),
    Certificate(title: "SwiftUI", image: "Certificate2"),
    Certificate(title: "Sketch", image: "Certificate3"),
    Certificate(title: "Framer", image: "Certificate4")
]
