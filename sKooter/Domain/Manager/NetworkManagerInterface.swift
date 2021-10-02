//
//  NetworkManagerInterface.swift
//  sKooter
//
//  Created by Vajda Kristóf on 2021. 10. 02..
//

import RxSwift

protocol NetworkManagerInterface {
    func getVehicles() -> Single<VehiclesResponseModel>
}
