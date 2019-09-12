//
//  GeoJSONGeometry+ContainsLocation.swift
//  STPhotoCore
//
//  Created by Crasneanu Cristian on 27/05/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

extension GeoJSONGeometry {
    public func contains(location: STLocation) -> Bool {
        switch self {
            case let polygon as GeoJSONPolygon: return polygon.isLocationInsidePolygon(location: location)
            case let multiPolygon as GeoJSONMultiPolygon: return multiPolygon.polygons.filter({ $0.isLocationInsidePolygon(location: location)}).first != nil
            default: return false
        }
    }
}
