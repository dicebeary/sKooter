//
//  Resolver.swift
//  sKooter
//
//  Created by Vajda Kristóf on 2021. 10. 03..
//

import Resolver
import Moya

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerManager()
        registerInteractor()
        registerUI()
    }
}

// MARK: - Core registrations
extension Resolver {
    static func registerManager() {
        register { _ -> NetworkManagerInterface in
            // MOCK
            //let stubClosure: MoyaProvider<VehicleAPI>.StubClosure = { _ in return StubBehavior.delayed(seconds: 1.0) }
            //return MoyaProvider<VehicleAPI>(stubClosure: stubClosure,
            //                                plugins: [NetworkLoggerPlugin()])
            let provider = MoyaProvider<VehicleAPI>(plugins: [NetworkLoggerPlugin()])

            return NetworkManager(provider: provider)
        }
        .scope(.application)

        register { _ -> LocationManagerInterface in
            return LocationManager()
        }
        .scope(.application)
    }

    static func registerInteractor() {
        register { resolver in
            VehicleInteractor(networkManager: resolver.resolve(NetworkManagerInterface.self))
        }.implements(VehicleInteractorInterface.self)
        .scope(.application)

        register { resolver in
            UserInteractor(locationManager: resolver.resolve(LocationManagerInterface.self))
        }.implements(UserInteractorInterface.self)
        .scope(.application)
    }
}

// MARK: - UI registrations
extension Resolver {
    static func registerUI() {
        register { resolver in
            MapViewModel(userInteractor: resolver.resolve(UserInteractorInterface.self),
                         vehicleInteractor: resolver.resolve(VehicleInteractorInterface.self))
        }.implements(MapViewModelInterface.self)
    }
}
