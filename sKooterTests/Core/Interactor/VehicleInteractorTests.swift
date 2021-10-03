//
//  VehicleInteractorTests.swift
//  sKooterTests
//
//  Created by Vajda Kristóf on 2021. 10. 03..
//

import Nimble
import RxSwift
import RxBlocking
import SwiftyMocky
import XCTest
@testable import sKooter

class VehicleInteractorTests: XCTestCase {
    var networkManager: NetworkManagerInterfaceMock!

    var sut: VehicleInteractor!

    override func setUp() {
        networkManager = NetworkManagerInterfaceMock()
        sut = VehicleInteractor(networkManager: networkManager)
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
        networkManager = nil
        sut = nil
    }
}

extension VehicleInteractorTests {
    func testFetchVehicles() throws {
        // Arrange
        Given(networkManager, .getVehicles(willReturn: .just(VehicleFactory.vehiclesApiModel)))

        // Act
        sut.fetchVehicles()
        let vehicles = try sut.vehicles.toBlocking(timeout: 1.0).first()

        // Assert
        expect(vehicles?.count).to(equal(3))
        Verify(networkManager, 1, .getVehicles())
    }

    func testSelectVehicle() throws {
        // Arrange
        Given(networkManager, .getVehicles(willReturn: .just(VehicleFactory.vehiclesApiModel)))

        // Act
        sut.fetchVehicles()
        sut.selectVehicle(by: "1")

        let selectedVehicle = try sut.selectedVehicle.toBlocking(timeout: 1.0).first()

        // Assert
        expect(selectedVehicle??.id).to(equal("1"))
    }
}
