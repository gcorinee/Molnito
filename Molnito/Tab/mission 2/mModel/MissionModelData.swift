//
//  MissionModelData.swift
//  Molnito
//
//  Created by 예은 on 2022/07/19.
//

import Foundation
import Combine

final class MissionModelData: ObservableObject{
    @Published var missions: [Mission] = load("missionTmp.json")
}
