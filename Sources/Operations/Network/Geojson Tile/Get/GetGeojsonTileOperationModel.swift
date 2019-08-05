//
//  GetGeojsonTileOperationModel.swift
//  STPhotoCore
//
//  Created by Dimitri Strauneanu on 11/07/2018.
//  Copyright © 2018 mikelanza. All rights reserved.
//

import Foundation

public enum GetGeojsonTileOperationModel {
    public struct Request {
        public let tileCoordinate: TileCoordinate
        public let url: String
    }
    
    public struct Response {
        public let geoJSONObject: GeoJSONObject
    }
}
