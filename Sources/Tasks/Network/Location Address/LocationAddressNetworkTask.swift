//
//  LocationAddressNetworkTask.swift
//  STPhotoCore-iOS
//
//  Created by Dimitri Strauneanu on 04/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

open class LocationAddressNetworkTask: LocationAddressTaskProtocol {
    let operationQueue = OperationQueue()
    
    public init() {
    }
    
    open func fetchLocationAddress(location: STLocation, completionHandler: @escaping (Result<STAddress, OperationError>) -> Void) {
        let operation = GetLocationAddressOperation(model: GetLocationAddressOperationModel.Request(location: location)) { result in
            switch result {
                case .success(let value): completionHandler(Result.success(value.address)); break
                case .failure(let error): completionHandler(Result.failure(error)); break
            }
        }
        self.operationQueue.addOperation(operation)
    }
}
