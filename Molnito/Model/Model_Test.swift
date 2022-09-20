//
//  Model_Test.swift
//  Molnito
//
//  Created by 허회준 on 2022/07/14.
//

import Foundation
import SwiftUI

struct DataModel: Decodable{
    let error: String
    let message: String
    let data: [PostModel]
    
}

struct PostModel: Decodable{
    let id: Int
    let title: String
    let post: String
}
