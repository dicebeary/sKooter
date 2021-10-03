//
//  MapScooterAnnotation.swift
//  sKooter
//
//  Created by Vajda Kristóf on 2021. 10. 03..
//

import MapKit

final class MapScooterAnnotation: NSObject, MKAnnotation {
    var id: String?
    var isUser: Bool
    var coordinate: CLLocationCoordinate2D

    init(id: String?, isUser: Bool, coordinate: CLLocationCoordinate2D) {
        self.id = id
        self.isUser = isUser
        self.coordinate = coordinate
    }
}
