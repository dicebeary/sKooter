//
//  VehicleStatsApiModel.swift
//  sKooter
//
//  Created by Vajda Kristóf on 2021. 10. 02..
//

import Foundation

struct VehicleStatsApiModel: Codable {
    let open: Int
    let assigned: Int
    let resolved: Int
}
