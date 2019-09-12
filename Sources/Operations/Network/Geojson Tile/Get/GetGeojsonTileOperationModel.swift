//
//  GetGeojsonTileOperationModel.swift
//  STPhotoCore
//
//  Created by Dimitri Strauneanu on 11/07/2018.
//  Copyright © 2018 Streetography. All rights reserved.
//

import Foundation

public enum GetGeojsonTileOperationModel {
    public struct Request {
        public let tileCoordinate: TileCoordinate
        public let url: String
        
        public init(tileCoordinate: TileCoordinate, url: String) {
            self.tileCoordinate = tileCoordinate
            self.url = url
        }
    }
    
    public struct Response {
        public let geoJSONObject: GeoJSONObject
    }
}
