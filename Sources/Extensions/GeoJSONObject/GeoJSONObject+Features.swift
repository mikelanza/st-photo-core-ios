//
//  GeoJSONObject+Features.swift
//  STPhotoCore
//
//  Created by Crasneanu Cristian on 17/05/2019.
//  Copyright © 2019 mikelanza. All rights reserved.
//

import Foundation

extension GeoJSONObject {
    public func features() -> [GeoJSONFeature] {
        switch self {
            case let featureCollection as GeoJSONFeatureCollection: return featureCollection.features
            case let feature as GeoJSONFeature: return [feature]
            default: return []
        }
    }
}
