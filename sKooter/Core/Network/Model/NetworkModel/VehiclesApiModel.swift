//
//  VehiclesApiModel.swift
//  sKooter
//
//  Created by Vajda Kristóf on 2021. 10. 02..
//

import Foundation

struct VehiclesApiModel: Codable {
    let current: [VehicleApiModel]
    let stats: VehicleStatsApiModel
}
