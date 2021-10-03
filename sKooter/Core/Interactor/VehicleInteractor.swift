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
    private let bag = DisposeBag()

    var selectedVehicle: Observable<Vehicle?> { selectedVehicleRelay.asObservable() }
    var vehicles: Observable<[Vehicle]> { vehiclesRelay.asObservable() }

    private let vehiclesRelay = BehaviorRelay<[Vehicle]>(value: [])
    private let selectedVehicleRelay = BehaviorRelay<Vehicle?>(value: nil)

    init(networkManager: NetworkManagerInterface) {
        self.networkManager = networkManager
    }

    func fetchVehicles() {
        return networkManager.getVehicles()
            .map(VehiclesResponseModel.map(from:))
            .do(onSuccess: { [weak self] vehicles in
                self?.vehiclesRelay.accept(vehicles)
            })
            .subscribe()
            .disposed(by: bag)
    }

    func selectVehicle(by id: String?) {
        let selectedVehicle = vehiclesRelay.value
            .first(where: { $0.id == id })

        selectedVehicleRelay.accept(selectedVehicle)
    }
}
