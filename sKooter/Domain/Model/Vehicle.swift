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
    let resolution: Resolution?
    let battery: Int
    let state: State
    let model: Model
    let location: CLLocationCoordinate2D

    struct Resolution: Equatable {
        let type: ResolutionType
        let id: String
        let date: Date
    }

    enum ResolutionType: Equatable {
        case claimed
        case notFound
        case other
    }

    enum State: Equatable {
        case active
        case inactive
    }

    enum Model: String, Equatable {
        case unknown
        case aa
        case ab
    }
}
