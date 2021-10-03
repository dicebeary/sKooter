//
//  LocationManager.swift
//  sKooter
//
//  Created by Vajda Kristóf on 2021. 10. 03..
//

import RxCocoa
import RxSwift
import CoreLocation

final class LocationManager: NSObject, LocationManagerInterface {
    private let manager: CLLocationManager

    var permissionState: Observable<CLAuthorizationStatus> { permissionStateRelay.asObservable() }
    var currentLocation: Observable<CLLocation?> { currentLocationRelay.asObservable() }

    private let currentLocationRelay: BehaviorRelay<CLLocation?>
    private let permissionStateRelay: BehaviorRelay<CLAuthorizationStatus>

    init(clLocationManager: CLLocationManager = CLLocationManager()) {
        self.manager = clLocationManager

        self.currentLocationRelay = BehaviorRelay<CLLocation?>(value: manager.location)
        self.permissionStateRelay = BehaviorRelay<CLAuthorizationStatus>(value: manager.authorizationStatus)
        super.init()
    }

    func requestPermission() {
        manager.requestAlwaysAuthorization()
    }

    func startLocation() {
        if CLLocationManager.locationServicesEnabled() {
            manager.delegate = self
            manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.startUpdatingLocation()
        }
    }

    func stopLocation() {
        manager.stopUpdatingLocation()
    }

}

// MARK: - CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocationRelay.accept(manager.location)
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        permissionStateRelay.accept(status)
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        permissionStateRelay.accept(manager.authorizationStatus)
    }
}
