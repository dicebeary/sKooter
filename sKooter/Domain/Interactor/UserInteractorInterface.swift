//
//  UserInteractorInterface.swift
//  sKooter
//
//  Created by Vajda Kristóf on 2021. 10. 02..
//

import RxSwift
import CoreLocation

// sourcery: AutoMockable
/// Interactor for fetching and setting user data
protocol UserInteractorInterface {
    var userLocation: Observable<CLLocation?> { get }
}
