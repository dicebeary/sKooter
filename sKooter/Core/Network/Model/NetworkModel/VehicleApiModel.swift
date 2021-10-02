//
//  VehicleApiModel.swift
//  sKooter
//
//  Created by Vajda Kristóf on 2021. 10. 02..
//

import Foundation

struct VehicleApiModel: Codable {
    let id: String // "6348dfa0 -1b20-40ed-98e9-fe9e232b6105",
    let vehicleId: String // "8ece0495-bef0-4eac-a58e-dede2bf975a3",
    let hardwareId: String // "868446031763952",
    let zoneId: String // "BERLIN",
    let resolution: String? // "CLAIMED",
    let resolvedBy: String? // "5VRiXTOvRWbWfAlIKDv10HrE8LJ2",
    let resolvedAt: Date? // "2019-10-10T06:35:21.153Z",
    let battery: Int // 91,
    let state: State // "ACTIVE",
    let model: String // "AB",
    let fleetbirdId: Int // 118160,
    let latitude: Double // 52.506731,
    let longitude: Double // 13.289618

    enum State: String, Codable {
        case active = "ACTIVE"
        case damaged = "DAMAGED"
        case maintenance = "MAINTENANCE"
        case lastSearch = "LAST_SEARCH"
        case outOfOrder = "OUT_OF_ORDER"
        case lost = "LOST"
        case gpsIssue = "GPS_ISSUE"
        case lowBattery = "LOW_BATTERY"
    }

    enum Model: String, Codable {
        case aa = "AA"
        case ab = "AB"
        case unknown = "UNKNOWN"
    }
}
