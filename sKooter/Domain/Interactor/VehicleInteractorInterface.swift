//
//  VehicleInteractorInterface.swift
//  sKooter
//
//  Created by Vajda Kristóf on 2021. 10. 02..
//

import RxSwift

/// Interactor for fetching and setting user data
protocol VehicleInteractorInterface {
    var vehicles: Observable<Vehicle> { get }

    func fetchVehicles() -> Single<Vehicle>
}
