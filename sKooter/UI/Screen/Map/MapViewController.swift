//
//  MapViewController.swift
//  sKooter
//
//  Created by Vajda Kristóf on 2021. 10. 02..
//

import UIKit
import MapKit
import Resolver
import RxSwift
import RxCocoa
import RxMKMapView

class MapViewController: UIViewController {

    @LazyInjected var viewModel: MapViewModelInterface

    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var detailsView: MarkerDetailsView!

    private let selectedVehicleId = PublishRelay<String?>()
    private let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()

        mapView.delegate = self
    }
}

// MARK: - Setup
extension MapViewController {
    func setupBindings() {
        let output = viewModel.transform(input: .init(selectedMarker: selectedVehicleId.asObservable()))

        output.markerDetails
            .drive { [weak self] data in
                self?.detailsView.isHidden = data == nil

                guard let data = data else { return }
                self?.detailsView.bind(to: data)
            }
            .disposed(by: bag)

        output.initialRegion
            .subscribe(onSuccess: { [weak self] region in
                self?.mapView.setRegion(region, animated: true)
            })
            .disposed(by: bag)

        output.annotations
            .drive(mapView.rx.annotations)
            .disposed(by: bag)
    }
}

// MARK: - MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let customAnnotation = annotation as? MapScooterAnnotation else {
            return nil
        }

        var annotation: MKAnnotationView
        if customAnnotation.isUser {
            let markerAnnotation = MKMarkerAnnotationView(annotation: customAnnotation, reuseIdentifier: "user")
            markerAnnotation.markerTintColor = .systemGray
            markerAnnotation.displayPriority = .required
            annotation = markerAnnotation
        } else {
            let markerAnnotation = MKMarkerAnnotationView(annotation: customAnnotation, reuseIdentifier: "vehicle")
            markerAnnotation.markerTintColor = .systemGreen
            annotation = markerAnnotation
        }

        return annotation
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation as? MapScooterAnnotation else {
            selectedVehicleId.accept(nil)
            return
        }

        selectedVehicleId.accept(annotation.id)
    }

    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        selectedVehicleId.accept(nil)
    }
}
