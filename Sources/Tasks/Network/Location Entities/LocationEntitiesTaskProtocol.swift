//
//  LocationEntitiesTaskProtocol.swift
//  STPhotoCore-iOS
//
//  Created by Dimitri Strauneanu on 05/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

public protocol LocationEntitiesTaskProtocol {
    func fetchPhotoEntities(location: STLocation, completionHandler: @escaping (Result<[EntityLevel: GeoEntity], OperationError>) -> Void)
}
