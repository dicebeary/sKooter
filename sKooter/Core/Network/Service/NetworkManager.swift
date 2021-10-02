//
//  NetworkManager.swift
//  sKooter
//
//  Created by Vajda Kristóf on 2021. 10. 02..
//

import RxSwift
import Moya

final class NetworkManager: NetworkManagerInterface {
    private let provider: MoyaProvider<VehicleAPI>

    init(provider: MoyaProvider<VehicleAPI>) {
        self.provider = provider
    }

    func getVehicles() -> Single<VehiclesResponseModel> {
        provider.rx.request(.getVehicles)
            .filterSuccessfulStatusCodes()
            .map(VehiclesResponseModel.self)
    }
}
