//
//  Vehicle.swift
//  sKooter
//
//  Created by Vajda Kristóf on 2021. 10. 02..
//

import CoreLocation

struct Vehicle {
    let id: String
    let vehicleId: String
    let hardwareId: String
    let zoneId: String
    let fleetbirdId: Int
    let resolution: Resolution
    let battery: Int
    let state: State
    let model: String
    let location: CLLocationCoordinate2D

    struct Resolution {
        let type: ResolutionType
        let id: String
        let date: Date
    }

    enum ResolutionType {
        case claimed
        case notFound
        case other
    }

    enum State {
        case active
        case inactive
    }
}
