//
//  GeoJSONType.swift
//  STPhotoCore
//
//  Created by Dimitri Strauneanu on 11/07/2018.
//  Copyright © 2018 Streetography. All rights reserved.
//

import Foundation

public enum GeoJSONType: String {
    case point = "Point"
    case lineString = "LineString"
    case polygon = "Polygon"
    case multiPoint = "MultiPoint"
    case multiLineString = "MultiLineString"
    case multiPolygon = "MultiPolygon"
    case geometryCollection = "GeometryCollection"
    case feature = "Feature"
    case featureCollection = "FeatureCollection"
}
