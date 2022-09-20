//
//  Mission.swift
//  Molnito
//
//  Created by 예은 on 2022/07/19.
//

import Foundation
import SwiftUI

struct Mission: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var check: Bool
    
    var imageName: String
    var image: Image {
            Image(imageName)
    }
}
