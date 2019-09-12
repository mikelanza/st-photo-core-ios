//
//  PhotoNetworkTask.swift
//  STPhotoCore-iOS
//
//  Created by Dimitri Strauneanu on 04/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

open class PhotoNetworkTask: PhotoTaskProtocol {
    let operationQueue = OperationQueue()
    
    public init() {
    }
    
    open func fetchPhoto(photoId: String, completionHandler: @escaping (Result<STPhoto, OperationError>) -> Void) {
        let operation = GetPhotoOperation(model: GetPhotoOperationModel.Request(photoId: photoId)) { result in
            switch result {
                case .success(let value): completionHandler(Result.success(value.photo)); break
                case .failure(let error): completionHandler(Result.failure(error)); break
            }
        }
        self.operationQueue.addOperation(operation)
    }
}
