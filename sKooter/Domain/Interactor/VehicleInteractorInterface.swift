//
//  VehicleInteractorInterface.swift
//  sKooter
//
//  Created by Vajda Kristóf on 2021. 10. 02..
//

import RxSwift

/// Interactor for fetching and setting user data
// sourcery: AutoMockable
protocol VehicleInteractorInterface {
    var selectedVehicle: Observable<Vehicle?> { get }
    var vehicles: Observable<[Vehicle]> { get }

    func fetchVehicles()

    func selectVehicle(by id: String?)
}
