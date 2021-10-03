//
//  VehiclesResponseModel.swift
//  sKooter
//
//  Created by Vajda Kristóf on 2021. 10. 02..
//

import CoreLocation

struct VehiclesResponseModel: Codable {
    let data: VehiclesApiModel
}

extension VehiclesResponseModel {
    static func map(from apiModel: Self) -> [Vehicle] {
        return apiModel.data.current.map { vehicle -> Vehicle in

            return Vehicle(id: vehicle.id,
                           vehicleId: vehicle.vehicleId,
                           hardwareId: vehicle.hardwareId,
                           zoneId: vehicle.zoneId,
                           fleetbirdId: vehicle.fleetbirdId,
                           resolution: mapResolution(resolution: vehicle.resolution, resolver: vehicle.resolvedBy, date: vehicle.resolvedAt),
                           battery: vehicle.battery,
                           state: mapState(from: vehicle.state),
                           model: mapModel(from: vehicle.model),
                           location: mapLocation(latitude: vehicle.latitude, longitude: vehicle.longitude))
        }
    }

    static func mapResolution(resolution: VehicleApiModel.ResolutionType?, resolver: String?, date: String?) -> Vehicle.Resolution? {
        guard let resolution = mapResolutionType(from: resolution),
              let id = resolver,
              let date = mapDate(from: date ?? "") else { return nil }

        return Vehicle.Resolution(type: resolution, id: id, date: date)
    }

    static func mapResolutionType(from resolution: VehicleApiModel.ResolutionType?) -> Vehicle.ResolutionType? {
        switch resolution {
        case .none:
            return nil
        case .claimed:
            return .claimed
        case .notFound:
            return .notFound
        case .other:
            return .other
        }
    }

    static func mapDate(from string: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return formatter.date(from: string)
    }

    static func mapState(from apiModel: VehicleApiModel.State) -> Vehicle.State {
        switch apiModel {
        case .active, .lastSearch, .lowBattery:
            return .active
        case .damaged, .maintenance, .outOfOrder, .lost, .gpsIssue, .missing:
            return .inactive
        }
    }

    static func mapModel(from apiModel: VehicleApiModel.Model) -> Vehicle.Model {
        switch apiModel {
        case .aa:
            return .aa
        case .ab:
            return .ab
        case .unknown:
            return .unknown
        }
    }

    static func mapLocation(latitude: Double, longitude: Double) -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
