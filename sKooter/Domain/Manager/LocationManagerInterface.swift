//
//  LocationManagerInterface.swift
//  sKooter
//
//  Created by Vajda Kristóf on 2021. 10. 03..
//

import RxSwift
import CoreLocation

// sourcery: AutoMockable
protocol LocationManagerInterface {
    var permissionState: Observable<CLAuthorizationStatus> { get }
    var currentLocation: Observable<CLLocation?> { get }
    func requestPermission()
    func startLocation()
    func stopLocation()
}
