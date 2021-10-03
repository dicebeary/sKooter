//
//  UserInteractorTests.swift
//  sKooterTests
//
//  Created by Vajda Kristóf on 2021. 10. 03..
//

import CoreLocation
import Nimble
import RxSwift
import RxBlocking
import SwiftyMocky
import XCTest
@testable import sKooter

class UserInteractorTests: XCTestCase {
    var locationManager: LocationManagerInterfaceMock!
    var sut: UserInteractor!

    override func setUp() {
        locationManager = LocationManagerInterfaceMock()
        sut = UserInteractor(locationManager: locationManager)
        super.setUp()
    }

    override func tearDown() {
        locationManager = nil
        sut = nil
        super.tearDown()
    }
}

extension UserInteractorTests {
    func testUserLocation() throws {
        // Arrange
        let givenUserLocation = CLLocation(latitude: 0, longitude: 0)
        Given(locationManager, .currentLocation(getter: .just(givenUserLocation)))

        // Act
        let location = try sut.userLocation.toBlocking(timeout: 1.0).first()

        // Assert
        expect(location).to(equal(givenUserLocation))
    }
}
