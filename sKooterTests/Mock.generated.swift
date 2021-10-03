// Generated using Sourcery 1.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



// Generated with SwiftyMocky 4.0.4

import SwiftyMocky
import XCTest
import Foundation
import RxCocoa
import RxSwift
import CoreLocation
import MapKit
@testable import sKooter


// MARK: - LocationManagerInterface

open class LocationManagerInterfaceMock: LocationManagerInterface, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var permissionState: Observable<CLAuthorizationStatus> {
		get {	invocations.append(.p_permissionState_get); return __p_permissionState ?? givenGetterValue(.p_permissionState_get, "LocationManagerInterfaceMock - stub value for permissionState was not defined") }
	}
	private var __p_permissionState: (Observable<CLAuthorizationStatus>)?

    public var currentLocation: Observable<CLLocation?> {
		get {	invocations.append(.p_currentLocation_get); return __p_currentLocation ?? givenGetterValue(.p_currentLocation_get, "LocationManagerInterfaceMock - stub value for currentLocation was not defined") }
	}
	private var __p_currentLocation: (Observable<CLLocation?>)?





    open func requestPermission() {
        addInvocation(.m_requestPermission)
		let perform = methodPerformValue(.m_requestPermission) as? () -> Void
		perform?()
    }

    open func startLocation() {
        addInvocation(.m_startLocation)
		let perform = methodPerformValue(.m_startLocation) as? () -> Void
		perform?()
    }

    open func stopLocation() {
        addInvocation(.m_stopLocation)
		let perform = methodPerformValue(.m_stopLocation) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_requestPermission
        case m_startLocation
        case m_stopLocation
        case p_permissionState_get
        case p_currentLocation_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_requestPermission, .m_requestPermission): return .match

            case (.m_startLocation, .m_startLocation): return .match

            case (.m_stopLocation, .m_stopLocation): return .match
            case (.p_permissionState_get,.p_permissionState_get): return Matcher.ComparisonResult.match
            case (.p_currentLocation_get,.p_currentLocation_get): return Matcher.ComparisonResult.match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_requestPermission: return 0
            case .m_startLocation: return 0
            case .m_stopLocation: return 0
            case .p_permissionState_get: return 0
            case .p_currentLocation_get: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_requestPermission: return ".requestPermission()"
            case .m_startLocation: return ".startLocation()"
            case .m_stopLocation: return ".stopLocation()"
            case .p_permissionState_get: return "[get] .permissionState"
            case .p_currentLocation_get: return "[get] .currentLocation"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func permissionState(getter defaultValue: Observable<CLAuthorizationStatus>...) -> PropertyStub {
            return Given(method: .p_permissionState_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func currentLocation(getter defaultValue: Observable<CLLocation?>...) -> PropertyStub {
            return Given(method: .p_currentLocation_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func requestPermission() -> Verify { return Verify(method: .m_requestPermission)}
        public static func startLocation() -> Verify { return Verify(method: .m_startLocation)}
        public static func stopLocation() -> Verify { return Verify(method: .m_stopLocation)}
        public static var permissionState: Verify { return Verify(method: .p_permissionState_get) }
        public static var currentLocation: Verify { return Verify(method: .p_currentLocation_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func requestPermission(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_requestPermission, performs: perform)
        }
        public static func startLocation(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_startLocation, performs: perform)
        }
        public static func stopLocation(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_stopLocation, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - NetworkManagerInterface

open class NetworkManagerInterfaceMock: NetworkManagerInterface, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func getVehicles() -> Single<VehiclesResponseModel> {
        addInvocation(.m_getVehicles)
		let perform = methodPerformValue(.m_getVehicles) as? () -> Void
		perform?()
		var __value: Single<VehiclesResponseModel>
		do {
		    __value = try methodReturnValue(.m_getVehicles).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getVehicles(). Use given")
			Failure("Stub return value not specified for getVehicles(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_getVehicles

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_getVehicles, .m_getVehicles): return .match
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_getVehicles: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_getVehicles: return ".getVehicles()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getVehicles(willReturn: Single<VehiclesResponseModel>...) -> MethodStub {
            return Given(method: .m_getVehicles, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getVehicles(willProduce: (Stubber<Single<VehiclesResponseModel>>) -> Void) -> MethodStub {
            let willReturn: [Single<VehiclesResponseModel>] = []
			let given: Given = { return Given(method: .m_getVehicles, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<VehiclesResponseModel>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getVehicles() -> Verify { return Verify(method: .m_getVehicles)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getVehicles(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_getVehicles, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - UserInteractorInterface

open class UserInteractorInterfaceMock: UserInteractorInterface, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var userLocation: Observable<CLLocation?> {
		get {	invocations.append(.p_userLocation_get); return __p_userLocation ?? givenGetterValue(.p_userLocation_get, "UserInteractorInterfaceMock - stub value for userLocation was not defined") }
	}
	private var __p_userLocation: (Observable<CLLocation?>)?






    fileprivate enum MethodType {
        case p_userLocation_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {            case (.p_userLocation_get,.p_userLocation_get): return Matcher.ComparisonResult.match
            }
        }

        func intValue() -> Int {
            switch self {
            case .p_userLocation_get: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .p_userLocation_get: return "[get] .userLocation"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func userLocation(getter defaultValue: Observable<CLLocation?>...) -> PropertyStub {
            return Given(method: .p_userLocation_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static var userLocation: Verify { return Verify(method: .p_userLocation_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - VehicleInteractorInterface

open class VehicleInteractorInterfaceMock: VehicleInteractorInterface, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var selectedVehicle: Observable<Vehicle?> {
		get {	invocations.append(.p_selectedVehicle_get); return __p_selectedVehicle ?? givenGetterValue(.p_selectedVehicle_get, "VehicleInteractorInterfaceMock - stub value for selectedVehicle was not defined") }
	}
	private var __p_selectedVehicle: (Observable<Vehicle?>)?

    public var vehicles: Observable<[Vehicle]> {
		get {	invocations.append(.p_vehicles_get); return __p_vehicles ?? givenGetterValue(.p_vehicles_get, "VehicleInteractorInterfaceMock - stub value for vehicles was not defined") }
	}
	private var __p_vehicles: (Observable<[Vehicle]>)?





    open func fetchVehicles() -> Completable {
        addInvocation(.m_fetchVehicles)
		let perform = methodPerformValue(.m_fetchVehicles) as? () -> Void
		perform?()
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_fetchVehicles).casted()
		} catch {
			onFatalFailure("Stub return value not specified for fetchVehicles(). Use given")
			Failure("Stub return value not specified for fetchVehicles(). Use given")
		}
		return __value
    }

    open func selectVehicle(by id: String?) -> Completable {
        addInvocation(.m_selectVehicle__by_id(Parameter<String?>.value(`id`)))
		let perform = methodPerformValue(.m_selectVehicle__by_id(Parameter<String?>.value(`id`))) as? (String?) -> Void
		perform?(`id`)
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_selectVehicle__by_id(Parameter<String?>.value(`id`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for selectVehicle(by id: String?). Use given")
			Failure("Stub return value not specified for selectVehicle(by id: String?). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_fetchVehicles
        case m_selectVehicle__by_id(Parameter<String?>)
        case p_selectedVehicle_get
        case p_vehicles_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_fetchVehicles, .m_fetchVehicles): return .match

            case (.m_selectVehicle__by_id(let lhsId), .m_selectVehicle__by_id(let rhsId)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsId, rhs: rhsId, with: matcher), lhsId, rhsId, "by id"))
				return Matcher.ComparisonResult(results)
            case (.p_selectedVehicle_get,.p_selectedVehicle_get): return Matcher.ComparisonResult.match
            case (.p_vehicles_get,.p_vehicles_get): return Matcher.ComparisonResult.match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_fetchVehicles: return 0
            case let .m_selectVehicle__by_id(p0): return p0.intValue
            case .p_selectedVehicle_get: return 0
            case .p_vehicles_get: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_fetchVehicles: return ".fetchVehicles()"
            case .m_selectVehicle__by_id: return ".selectVehicle(by:)"
            case .p_selectedVehicle_get: return "[get] .selectedVehicle"
            case .p_vehicles_get: return "[get] .vehicles"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func selectedVehicle(getter defaultValue: Observable<Vehicle?>...) -> PropertyStub {
            return Given(method: .p_selectedVehicle_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func vehicles(getter defaultValue: Observable<[Vehicle]>...) -> PropertyStub {
            return Given(method: .p_vehicles_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

        public static func fetchVehicles(willReturn: Completable...) -> MethodStub {
            return Given(method: .m_fetchVehicles, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func selectVehicle(by id: Parameter<String?>, willReturn: Completable...) -> MethodStub {
            return Given(method: .m_selectVehicle__by_id(`id`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func fetchVehicles(willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_fetchVehicles, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
        public static func selectVehicle(by id: Parameter<String?>, willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_selectVehicle__by_id(`id`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func fetchVehicles() -> Verify { return Verify(method: .m_fetchVehicles)}
        public static func selectVehicle(by id: Parameter<String?>) -> Verify { return Verify(method: .m_selectVehicle__by_id(`id`))}
        public static var selectedVehicle: Verify { return Verify(method: .p_selectedVehicle_get) }
        public static var vehicles: Verify { return Verify(method: .p_vehicles_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func fetchVehicles(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_fetchVehicles, performs: perform)
        }
        public static func selectVehicle(by id: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_selectVehicle__by_id(`id`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

