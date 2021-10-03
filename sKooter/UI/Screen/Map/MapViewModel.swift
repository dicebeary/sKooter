//
//  MapViewModel.swift
//  sKooter
//
//  Created by Vajda Kristóf on 2021. 10. 03..
//

import RxSwift
import RxCocoa
import CoreLocation
import MapKit

protocol MapViewModelInterface {
    func transform(input: MapViewModel.Events) -> MapViewModel.Data
}

final class MapViewModel: MapViewModelInterface {
    private let userInteractor: UserInteractorInterface
    private let vehicleInteractor: VehicleInteractorInterface

    private let bag = DisposeBag()

    init(userInteractor: UserInteractorInterface,
         vehicleInteractor: VehicleInteractorInterface) {
        self.userInteractor = userInteractor
        self.vehicleInteractor = vehicleInteractor
    }
}

// MARK: - Defining input/output
extension MapViewModel {
    struct Data {
        let annotations: Driver<[MKAnnotation]>
        let initialRegion: Single<MKCoordinateRegion>
        let markerDetails: Driver<MarkerDetailsView.Data?>
    }

    struct Events {
        var selectedMarker: Observable<String?>
    }
}

// MARK: - Transforming data
extension MapViewModel {
    func transform(input: Events) -> Data {
        vehicleInteractor.fetchVehicles()

        let location = userInteractor.userLocation
            .filter { $0 != nil }
            .map { $0! }
            .take(1)

        selectClosestVehicle(by: location)
        selectVehicle(by: input.selectedMarker)

        return Data(annotations: getAnnotations(),
                    initialRegion: getRegion(),
                    markerDetails: getMarkerDetails())
    }
}

// MARK: - Handling event
private extension MapViewModel {
    func selectClosestVehicle(by userLocation: Observable<CLLocation>) {
        Observable.combineLatest(userLocation, vehicleInteractor.vehicles)
            .subscribe { [weak self] location, vehicles in
                let closestVehicleId = vehicles.map { vehicle -> (Vehicle, CLLocationDistance) in
                    let vehicleLocation = CLLocation(latitude: vehicle.location.latitude, longitude: vehicle.location.longitude)
                    return (vehicle, location.distance(from: vehicleLocation))
                }
                .min(by: { $0.1 < $1.1 })
                .map { $0.0.id }
                guard let id = closestVehicleId else { return }

                self?.vehicleInteractor.selectVehicle(by: id)
            }
            .disposed(by: bag)
    }

    func selectVehicle(by events: Observable<String?>) {
        events
            .bind { [weak self] id in
                self?.vehicleInteractor.selectVehicle(by: id)
            }
            .disposed(by: bag)
    }
}

// MARK: - Fetching data
private extension MapViewModel {
    func getAnnotations() -> Driver<[MKAnnotation]> {
        let userAnnotation = userInteractor.userLocation
            .distinctUntilChanged()

        return Observable.combineLatest(userAnnotation, vehicleInteractor.vehicles)
            .map { userLocation, vehicles -> [MapScooterAnnotation] in
                var annotations = vehicles.map { vehicle in
                    return MapScooterAnnotation(id: vehicle.id,
                                                isUser: false,
                                                coordinate: vehicle.location)
                }

                guard let userLocation = userLocation else { return annotations }
                let userAnnotation = MapScooterAnnotation(id: nil,
                                                          isUser: true,
                                                          coordinate: userLocation.coordinate)

                annotations.append(userAnnotation)

                return annotations
            }
            .asDriver(onErrorJustReturn: [])
    }

    func getRegion() -> Single<MKCoordinateRegion> {
        userInteractor.userLocation
            .filter { $0 != nil }
            .map { $0! }
            .map { userLocation in
                return MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: Constants.regionLatitudinalDistance, longitudinalMeters: Constants.regionLongitudinalDistance)
            }
            .take(1)
            .asSingle()
    }

    func getMarkerDetails() -> Driver<MarkerDetailsView.Data?> {
        vehicleInteractor.selectedVehicle
            .map { vehicle in
                guard let vehicle = vehicle else { return nil }
                return MarkerDetailsView.Data(modelName: vehicle.model.rawValue.uppercased(),
                                              isActive: vehicle.state == .active ,
                                              isOccupied: vehicle.resolution != nil,
                                              battery: Localization.MapDetails.batteryPercentage(vehicle.battery))
            }
            .asDriver(onErrorJustReturn: nil)
    }
}

// MARK: - Extension
private extension MapViewModel {
    enum Constants {
        static let regionLatitudinalDistance: CLLocationDistance = 2000
        static let regionLongitudinalDistance: CLLocationDistance = 2000
    }
}
