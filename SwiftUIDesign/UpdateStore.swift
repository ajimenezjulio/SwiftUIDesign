//
//  UpdateStore.swift
//  SwiftUIDesign
//
//  Created by Aguilar, Julio on 11/3/19.
//  Copyright © 2019 Julio Cesar. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore : ObservableObject {
   @Published var updates: [Update] = updateData
}
