//
//  NetworkManagerInterface.swift
//  sKooter
//
//  Created by Vajda Kristóf on 2021. 10. 02..
//

import RxSwift

// sourcery: AutoMockable
protocol NetworkManagerInterface {
    func getVehicles() -> Single<VehiclesResponseModel>
}
