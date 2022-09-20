//
//  ResultModelData.swift
//  Molnito
//
//  Created by 예은 on 2022/07/19.
//

import Foundation
import Combine

final class ResultModelData: ObservableObject{
    @Published var results: [Result] = load("matchTmp.json")
}
