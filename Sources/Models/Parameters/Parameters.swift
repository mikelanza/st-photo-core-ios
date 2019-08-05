//
//  Parameters.swift
//  STPhotoCore
//
//  Created by Dimitri Strauneanu on 15/04/2019.
//  Copyright © 2019 mikelanza. All rights reserved.
//

import Foundation

public typealias KeyValue = (key: String, value: String)

public class Parameters {
    public struct Keys {
        static let
        basemap = "basemap",
        shadow = "shadow",
        sort = "sort",
        tileSize = "tileSize",
        pinOptimize = "pinoptimize",
        sessionId = "sessionID",
        bbox = "bbox",
        userId = "userId",
        collectionId = "collectionId",
        client = "client"
    }
}
