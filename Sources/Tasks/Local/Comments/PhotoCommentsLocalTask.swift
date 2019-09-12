//
//  PhotoCommentsLocalTask.swift
//  STPhotoCore-iOS
//
//  Created by Dimitri Strauneanu on 04/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

open class PhotoCommentsLocalTask: PhotoCommentsTaskProtocol {
    public let operationQueue = OperationQueue()
    
    public init() {
    }
    
    open func fetchPhotoComments(model: PhotoCommentsTaskModel.Fetch, completionHandler: @escaping (Result<[STComment], OperationError>) -> Void) {
        let operationModel = GetCommentsOperationModel.Request(photoId: model.photoId, limit: model.limit, page: model.page)
        let operation = GetCommentsLocalOperation(model: operationModel) { result in
            switch result {
                case .success(let value): completionHandler(Result.success(value.comments)); break
                case .failure(let error): completionHandler(Result.failure(error)); break
            }
        }
        self.operationQueue.addOperation(operation)
    }
}
