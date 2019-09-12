//
//  PhotoCollectionNetworkTask.swift
//  STPhotoCore-iOS
//
//  Created by Dimitri Strauneanu on 04/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

open class PhotoCollectionNetworkTask: PhotoCollectionTaskProtocol {
    public let operationQueue = OperationQueue()
    
    public init() {
    }
    
    open func fetchPhotoCollection(collectionId: String, completionHandler: @escaping (Result<STCollection, OperationError>) -> Void) {
        let operation = GetCollectionOperation(model: GetCollectionOperationModel.Request(collectionId: collectionId)) { result in
            switch result {
                case .success(let value): completionHandler(Result.success(value.collection)); break
                case .failure(let error): completionHandler(Result.failure(error)); break
            }
        }
        self.operationQueue.addOperation(operation)
    }
}
