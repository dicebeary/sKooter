//
//  VehicleResponseModelToDomainTests.swift
//  sKooterTests
//
//  Created by Vajda Kristóf on 2021. 10. 03..
//

import Nimble
import XCTest
@testable import sKooter

class VehicleResponseModelToDomainTests: XCTestCase {
    func testMapResolution() {
        // Arrange
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let givenDate = dateFormatter.date(from: "2020-11-20T12:20:20.000Z")!
        let expectedDefaultResolution = Vehicle.Resolution(type: .claimed, id: "1234", date: givenDate)

        // Act
        let actualDefaultResolution = VehiclesResponseModel.mapResolution(resolution: .claimed, resolver: "1234", date: "2020-11-20T12:20:20.000Z")
        let actualResolutionMissingDate = VehiclesResponseModel.mapResolution(resolution: .notFound, resolver: "1234", date: "")
        let actualResolutionMissingResolver = VehiclesResponseModel.mapResolution(resolution: .notFound, resolver: nil, date: "2020-11-20T12:20:20.000Z")
        let actualResolutionMissingResolution = VehiclesResponseModel.mapResolution(resolution: nil, resolver: "1234", date: nil)

        // Assert
        expect(actualDefaultResolution).to(equal(expectedDefaultResolution))
        expect(actualResolutionMissingDate).to(beNil())
        expect(actualResolutionMissingResolver).to(beNil())
        expect(actualResolutionMissingResolution).to(beNil())
    }

    func testMapResolutionType() {
        // Act
        let actualClaimedResolution = VehiclesResponseModel.mapResolutionType(from: .claimed)
        let actualNotFoundResolution = VehiclesResponseModel.mapResolutionType(from: .notFound)
        let actualOtherResolution = VehiclesResponseModel.mapResolutionType(from: .other)
        let actualEmptyResolution = VehiclesResponseModel.mapResolutionType(from: nil)

        // Assert
        expect(actualClaimedResolution).to(equal(.claimed))
        expect(actualNotFoundResolution).to(equal(.notFound))
        expect(actualOtherResolution).to(equal(.other))
        expect(actualEmptyResolution).to(beNil())
    }

    func testMapDate() {
        // Arrange
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let givenDate = dateFormatter.date(from: "2020-11-20T12:20:20.000Z")!
        let expectedDefaultResolution = Vehicle.Resolution(type: .claimed, id: "1234", date: givenDate)

        // Act
        let actualDate = VehiclesResponseModel.mapDate(from: "2020-11-20T12:20:20.000Z")
        let actualWrongDate = VehiclesResponseModel.mapDate(from: "2020-11")

        // Assert
        expect(actualDate).to(equal(givenDate))
        expect(actualWrongDate).to(beNil())
    }

    func testMapState() {
        // Arrange
        let givenActiveState = Vehicle.State.active
        let givenInactiveState = Vehicle.State.inactive

        // Act
        let actualActiveState = VehiclesResponseModel.mapState(from: .active)
        let actualDamagedState = VehiclesResponseModel.mapState(from: .damaged)
        let actualGPSIssueState = VehiclesResponseModel.mapState(from: .gpsIssue)
        let actualLastSearchState = VehiclesResponseModel.mapState(from: .lastSearch)
        let actualLostState = VehiclesResponseModel.mapState(from: .lost)
        let actualLowBatteryState = VehiclesResponseModel.mapState(from: .lowBattery)
        let actualMaintenaceState = VehiclesResponseModel.mapState(from: .maintenance)
        let actualMissingState = VehiclesResponseModel.mapState(from: .missing)
        let actualOutOfOrderState = VehiclesResponseModel.mapState(from: .outOfOrder)

        // Assert
        expect(actualActiveState).to(equal(givenActiveState))
        expect(actualDamagedState).to(equal(givenInactiveState))
        expect(actualGPSIssueState).to(equal(givenInactiveState))
        expect(actualLastSearchState).to(equal(givenActiveState))
        expect(actualLostState).to(equal(givenInactiveState))
        expect(actualLowBatteryState).to(equal(givenActiveState))
        expect(actualMaintenaceState).to(equal(givenInactiveState))
        expect(actualMissingState).to(equal(givenInactiveState))
        expect(actualOutOfOrderState).to(equal(givenInactiveState))
    }

    func testMapModel() {
        // Act
        let actualAAModel = VehiclesResponseModel.mapModel(from: .aa)
        let actualABModel = VehiclesResponseModel.mapModel(from: .ab)
        let actualUnknownModel = VehiclesResponseModel.mapModel(from: .unknown)

        // Assert
        expect(actualAAModel).to(equal(.aa))
        expect(actualABModel).to(equal(.ab))
        expect(actualUnknownModel).to(equal(.unknown))
    }

    func testMapLocation() {
        // Act
        let actualLocation = VehiclesResponseModel.mapLocation(latitude: 10, longitude: 20)

        expect(actualLocation.latitude).to(equal(10))
        expect(actualLocation.longitude).to(equal(20))
    }

}
