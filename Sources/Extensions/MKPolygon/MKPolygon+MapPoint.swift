//
//  MKPolygon+MapPoint.swift
//  STPhotoCore
//
//  Created by Dimitri Strauneanu on 02/07/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import MapKit

extension MKPolygon {
    public func containsMapPoint(_ mapPoint: MKMapPoint) -> Bool {
        let renderer = MKPolygonRenderer(polygon: self)
        let point = renderer.point(for: mapPoint)
        return renderer.path?.contains(point) ?? false
    }
}
