//
//  VehicleInteractorInterface.swift
//  sKooter
//
//  Created by Vajda Kristóf on 2021. 10. 02..
//

import RxSwift

// sourcery: AutoMockable
/// Interactor for fetching and setting user data
protocol VehicleInteractorInterface {
    var selectedVehicle: Observable<Vehicle?> { get }
    var vehicles: Observable<[Vehicle]> { get }

    func fetchVehicles() -> Completable

    func selectVehicle(by id: String?) -> Completable
}
