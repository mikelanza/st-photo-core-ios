//
//  CLLocationCoordinate2D+Distance.swift
//  STPhotoCore
//
//  Created by Crasneanu Cristian on 04/06/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation
import MapKit

extension CLLocationCoordinate2D {
    public func distance(from coordinate: CLLocationCoordinate2D) -> CLLocationDistance {
        let destination = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        return CLLocation(latitude: latitude, longitude: longitude).distance(from: destination)
    }
}
