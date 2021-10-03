//
//  UserInteractor.swift
//  sKooter
//
//  Created by Vajda Kristóf on 2021. 10. 03..
//

import CoreLocation
import RxSwift

final class UserInteractor: UserInteractorInterface {

    private let locationManager: LocationManagerInterface

    var userLocation: Observable<CLLocation?> {
        locationManager.currentLocation
    }

    init(locationManager: LocationManagerInterface) {
        self.locationManager = locationManager
    }
}
