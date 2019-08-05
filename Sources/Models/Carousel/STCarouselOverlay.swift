//
//  STCarouselOverlay.swift
//  STPhotoCore-iOS
//
//  Created by Dimitri Strauneanu on 05/08/2019.
//  Copyright © 2019 mikelanza. All rights reserved.
//

import MapKit

public class STCarouselOverlay: NSObject, MKOverlay {
    public var polygon: MKPolygon?
    public var polyline: MKPolyline?
    
    public var model: STCarouselOverlayModel
    
    public var coordinate: CLLocationCoordinate2D {
        get {
            if let polygon = self.polygon {
                return polygon.coordinate
            } else if let polyline = self.polyline {
                return polyline.coordinate
            }
            return CLLocationCoordinate2D()
        }
    }
    
    public var boundingMapRect: MKMapRect {
        get {
            if let polygon = self.polygon {
                return polygon.boundingMapRect
            } else if let polyline = self.polyline {
                return polyline.boundingMapRect
            }
            return MKMapRect()
        }
    }
    
    public init(polygon: MKPolygon?, polyline: MKPolyline?, model: STCarouselOverlayModel) {
        self.polygon = polygon
        self.polyline = polyline
        self.model = model
    }
    
    public func containsMapPoint(_ mapPoint: MKMapPoint) -> Bool {
        if let polygon = self.polygon {
            return polygon.containsMapPoint(mapPoint)
        } else if let polyline = self.polyline {
            return polyline.containsMapPoint(mapPoint)
        }
        return false
    }
    
    public func containsCoordinate(coordinate: CLLocationCoordinate2D) -> Bool {
        return self.containsMapPoint(MKMapPoint(coordinate))
    }
    
    public func entityLevel() -> EntityLevel {
        return EntityLevel.from(value: self.model.type)
    }
}
