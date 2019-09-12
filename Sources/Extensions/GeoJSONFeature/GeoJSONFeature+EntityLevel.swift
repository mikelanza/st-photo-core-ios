//
//  GeoJSONFeature+EntityLevel.swift
//  STPhotoCore
//
//  Created by Dimitri Strauneanu on 15/05/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

extension GeoJSONFeature {
    public var entityLevel: EntityLevel {
        guard let type = self.photoProperties?.type else { return EntityLevel.unknown }
        return EntityLevel(rawValue: type) ?? .unknown
    }
}
