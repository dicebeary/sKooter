//
//  VehicleAPI.swift
//  sKooter
//
//  Created by Vajda Kristóf on 2021. 10. 02..
//

import Moya

enum VehicleAPI {
    case getVehicles
}

extension VehicleAPI: TargetType {
    /// The target's base `URL`.
    var baseURL: URL {
        return URL(string: "https://api.jsonbin.io/b")!
    }

    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String {
        switch self {
        case .getVehicles:
            return "/5fa8ff8dbd01877eecdb898f"
        }
    }

    /// The HTTP method used in the request.
    var method: Moya.Method {
        switch self {
        case .getVehicles:
            return .get
        }
    }
    /// Provides stub data for use in testing.
    var sampleData: Data {
        switch self {
        case .getVehicles:
            return StubbedResponse.getResponse(from: "vehicle.json")
        }
    }
    /// The type of HTTP task to be performed.
    var task: Task {
        switch self {
        case .getVehicles:
            return .requestPlain
        }
    }

    /// The headers to be used in the request.
    var headers: [String: String]? {
        switch self {
        case .getVehicles:
            return ["secret-key": CoreConstants.secretKey]
        }
    }

}
