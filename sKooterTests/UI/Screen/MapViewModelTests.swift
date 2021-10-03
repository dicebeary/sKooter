//
//  MapViewModelTests.swift
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

class MapViewModelTests: XCTestCase {
    var userInteractor: UserInteractorInterfaceMock!
    var vehicleInteractor: VehicleInteractorInterfaceMock!
    var sut: MapViewModel!

    override func setUp() {
        userInteractor = UserInteractorInterfaceMock()
        vehicleInteractor = VehicleInteractorInterfaceMock()
        sut = MapViewModel(userInteractor: userInteractor,
                           vehicleInteractor: vehicleInteractor)
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
        userInteractor = nil
        vehicleInteractor = nil
        sut = nil
    }
}

// MARK: - Test cases
extension MapViewModelTests {
    func testIdleState() throws {
        // Arrange
        let givenUserLocation = CLLocation(latitude: 0, longitude: 0)
        let givenVehicle = VehicleFactory.defaultVehicle
        let givenVehicles = VehicleFactory.defaultVehicles

        Given(userInteractor, .userLocation(getter: .just(givenUserLocation)))
        Given(vehicleInteractor, .selectedVehicle(getter: .just(givenVehicle)))
        Given(vehicleInteractor, .vehicles(getter: .just(givenVehicles)))

        let selectedMarkerEvents = Observable<String?>.empty()

        // Act
        let output = sut.transform(input: .init(selectedMarker: selectedMarkerEvents))

        // Assert
        Verify(vehicleInteractor, 1, .fetchVehicles())
        Verify(vehicleInteractor, 1, .selectVehicle(by: .value("id1")))
        Verify(userInteractor, .userLocation)
        Verify(vehicleInteractor, 1, .selectedVehicle)
        Verify(vehicleInteractor, .vehicles)

        let markerDetails = try output.markerDetails.toBlocking(timeout: 1.0).first()

        expect(markerDetails).notTo(beNil())
        expect(markerDetails??.battery).to(equal("69 %"))
        expect(markerDetails??.isActive).to(beTrue())
        expect(markerDetails??.isOccupied).to(beFalse())
        expect(markerDetails??.modelName).to(equal("AA"))

        let annotations = try output.annotations.toBlocking(timeout: 1.0).first()

        expect(annotations?.count).to(equal(6))

        let region = try output.initialRegion.toBlocking(timeout: 1.0).first()
        expect(region).notTo(beNil())
    }

    func testMissingVehiclesWithUserLocation() throws {
        // Arrange
        let givenUserLocation = CLLocation(latitude: 0, longitude: 0)

        Given(userInteractor, .userLocation(getter: .just(givenUserLocation)))
        Given(vehicleInteractor, .selectedVehicle(getter: .just(nil)))
        Given(vehicleInteractor, .vehicles(getter: .just([])))

        let selectedMarkerEvents = Observable<String?>.empty()

        // Act
        let output = sut.transform(input: .init(selectedMarker: selectedMarkerEvents))

        // Assert
        Verify(vehicleInteractor, 1, .fetchVehicles())
        Verify(vehicleInteractor, .never, .selectVehicle(by: .value("id1")))
        Verify(userInteractor, .userLocation)
        Verify(vehicleInteractor, 1, .selectedVehicle)
        Verify(vehicleInteractor, .vehicles)

        let markerDetails = try output.markerDetails.toBlocking(timeout: 1.0).first()

        expect(markerDetails?.isNotNil).notTo(beTrue())

        let annotations = try output.annotations.toBlocking(timeout: 1.0).first()

        expect(annotations?.count).to(equal(1))
    }

    func testMissingVehiclesWithoutUserLocation() throws {
        // Arrange
        Given(userInteractor, .userLocation(getter: .just(nil)))
        Given(vehicleInteractor, .selectedVehicle(getter: .just(nil)))
        Given(vehicleInteractor, .vehicles(getter: .just([])))

        let selectedMarkerEvents = Observable<String?>.empty()

        // Act
        let output = sut.transform(input: .init(selectedMarker: selectedMarkerEvents))

        // Assert
        Verify(vehicleInteractor, 1, .fetchVehicles())
        Verify(vehicleInteractor, .never, .selectVehicle(by: .any))
        Verify(userInteractor, .userLocation)
        Verify(vehicleInteractor, 1, .selectedVehicle)
        Verify(vehicleInteractor, .vehicles)

        let annotations = try output.annotations.toBlocking(timeout: 1.0).first()

        expect(annotations?.count).to(equal(0))

        if let _ = try? output.initialRegion.toBlocking(timeout: 1.0).first() {
            fail("Region has emitted during empty user location")
        }
    }

    func testSelectedMarker() throws {
        // Arrange
        let givenUserLocation = CLLocation(latitude: 0, longitude: 0)
        let givenVehicle = VehicleFactory.defaultVehicle
        let givenVehicles = VehicleFactory.defaultVehicles

        Given(userInteractor, .userLocation(getter: .just(givenUserLocation)))
        Given(vehicleInteractor, .selectedVehicle(getter: .just(givenVehicle)))
        Given(vehicleInteractor, .vehicles(getter: .just(givenVehicles)))

        let selectedMarkerEvents = Observable<String?>.just("id2")

        // Act
        let _ = sut.transform(input: .init(selectedMarker: selectedMarkerEvents))

        // Assert
        Verify(vehicleInteractor, .selectVehicle(by: .value("id2")))
    }
}
