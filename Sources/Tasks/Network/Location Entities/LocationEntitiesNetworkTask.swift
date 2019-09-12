//
//  LocationEntitiesNetworkTask.swift
//  STPhotoCore-iOS
//
//  Created by Dimitri Strauneanu on 05/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

open class LocationEntitiesNetworkTask: LocationEntitiesTaskProtocol {
    public let operationQueue = OperationQueue()
    
    public init() {
    }
    
    open func fetchPhotoEntities(location: STLocation, completionHandler: @escaping (Result<[EntityLevel : GeoEntity], OperationError>) -> Void) {
        let operation = GetLocationEntitiesOperation(model: GetLocationEntitiesOperationModel.Request(location: location)) { result in
            switch result {
                case .success(let value): completionHandler(Result.success(value.entities)); break
                case .failure(let error): completionHandler(Result.failure(error)); break
            }
        }
        self.operationQueue.addOperation(operation)
    }
}
