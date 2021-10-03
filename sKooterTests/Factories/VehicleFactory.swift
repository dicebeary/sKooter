//
//  VehicleFactory.swift
//  sKooterTests
//
//  Created by Vajda Kristóf on 2021. 10. 03..
//

import CoreLocation
@testable import sKooter

enum VehicleFactory {
    static var defaultVehicle: Vehicle {
        return Vehicle(id: "id1",
                       vehicleId: "vehicleId1",
                       hardwareId: "hardwareId1",
                       zoneId: "zoneId1",
                       fleetbirdId: 23451,
                       resolution: nil,
                       battery: 69,
                       state: .active,
                       model: .aa,
                       location: CLLocationCoordinate2D(latitude: 10, longitude: 0))
    }

    static var defaultVehicles: [Vehicle] {
        return [
            Vehicle(id: "id1",
                    vehicleId: "vehicleId1",
                    hardwareId: "hardwareId1",
                    zoneId: "zoneId1",
                    fleetbirdId: 23451,
                    resolution: nil,
                    battery: 69,
                    state: .active,
                    model: .aa,
                    location: CLLocationCoordinate2D(latitude: 10, longitude: 0)),
            Vehicle(id: "id2",
                    vehicleId: "vehicleId2",
                    hardwareId: "hardwareId2",
                    zoneId: "zoneId2",
                    fleetbirdId: 34512,
                    resolution: Vehicle.Resolution(type: .claimed,
                                                   id: "111",
                                                   date: Date()),
                    battery: 13,
                    state: .active,
                    model: .ab,
                    location: CLLocationCoordinate2D(latitude: 20, longitude: 0)),
            Vehicle(id: "id3",
                    vehicleId: "vehicleId3",
                    hardwareId: "hardwareId3",
                    zoneId: "zoneId3",
                    fleetbirdId: 45123,
                    resolution: nil,
                    battery: 33,
                    state: .active,
                    model: .aa,
                    location: CLLocationCoordinate2D(latitude: 30, longitude: 0)),
            Vehicle(id: "id4",
                    vehicleId: "vehicleId4",
                    hardwareId: "hardwareId4",
                    zoneId: "zoneId4",
                    fleetbirdId: 51234,
                    resolution: Vehicle.Resolution(type: .notFound,
                                                   id: "111",
                                                   date: Date()),
                    battery: 99,
                    state: .active,
                    model: .aa,
                    location: CLLocationCoordinate2D(latitude: 40, longitude: 0)),
            Vehicle(id: "id5",
                    vehicleId: "vehicleId5",
                    hardwareId: "hardwareId5",
                    zoneId: "zoneId5",
                    fleetbirdId: 12345,
                    resolution: nil,
                    battery: 1,
                    state: .active,
                    model: .ab,
                    location: CLLocationCoordinate2D(latitude: 50, longitude: 0))
        ]
    }

    static var vehiclesApiModel: VehiclesResponseModel {
        let current = [
            VehicleApiModel(id: "1",
                            vehicleId: "2",
                            hardwareId: "3",
                            zoneId: "4",
                            resolution: nil,
                            resolvedBy: nil,
                            resolvedAt: nil,
                            battery: 80,
                            state: .active,
                            model: .aa,
                            fleetbirdId: 1234,
                            latitude: 10,
                            longitude: 20),
            VehicleApiModel(id: "2",
                            vehicleId: "3",
                            hardwareId: "4",
                            zoneId: "5",
                            resolution: .notFound,
                            resolvedBy: "123456",
                            resolvedAt: "2020-10-10T10:10:10.000Z",
                            battery: 80,
                            state: .damaged,
                            model: .ab,
                            fleetbirdId: 1234,
                            latitude: 30,
                            longitude: 40),
            VehicleApiModel(id: "3",
                            vehicleId: "4",
                            hardwareId: "5",
                            zoneId: "6",
                            resolution: nil,
                            resolvedBy: nil,
                            resolvedAt: nil,
                            battery: 69,
                            state: .lowBattery,
                            model: .unknown,
                            fleetbirdId: 1234,
                            latitude: 50,
                            longitude: 60),
        ]
        let stats = VehicleStatsApiModel(open: 10, assigned: 20, resolved: 30)
        let data = VehiclesApiModel(current: current, stats: stats)
        return VehiclesResponseModel(data: data)
    }
}
