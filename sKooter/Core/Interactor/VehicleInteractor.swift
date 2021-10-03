//
//  VehicleInteractor.swift
//  sKooter
//
//  Created by Vajda Kristóf on 2021. 10. 03..
//

import RxSwift
import RxCocoa

final class VehicleInteractor: VehicleInteractorInterface {

    private let networkManager: NetworkManagerInterface

    var selectedVehicle: Observable<Vehicle?> { selectedVehicleRelay.asObservable() }
    var vehicles: Observable<[Vehicle]> { vehiclesRelay.asObservable() }

    private let vehiclesRelay = BehaviorRelay<[Vehicle]>(value: [])
    private let selectedVehicleRelay = BehaviorRelay<Vehicle?>(value: nil)

    init(networkManager: NetworkManagerInterface) {
        self.networkManager = networkManager
    }

    func fetchVehicles() -> Completable {
        return networkManager.getVehicles()
            .map(VehiclesResponseModel.map(from:))
            .do(onSuccess: { [weak self] vehicles in
                self?.vehiclesRelay.accept(vehicles)
            })
            .asCompletable()
    }

    func selectVehicle(by id: String?) -> Completable {
        vehiclesRelay
            .map { $0.first(where: { $0.id == id }) }
            .take(1)
            .asSingle()
            .do(onSuccess: { [weak self] vehicle in
                self?.selectedVehicleRelay.accept(vehicle)
            })
            .asCompletable()
    }
}
