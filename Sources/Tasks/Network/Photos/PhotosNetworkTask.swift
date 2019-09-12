//
//  PhotoCommentsNetworkTask.swift
//  STPhotoCore-iOS
//
//  Created by Dimitri Strauneanu on 04/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

open class PhotosNetworkTask: PhotosTaskProtocol {
    let operationQueue = OperationQueue()
    
    public init() {
    }
    
    open func fetchPhotos(model: PhotosTaskModel.Fetch, completionHandler: @escaping (Result<[STPhoto], OperationError>) -> Void) {
        var entityFilter: GetPhotosOperationModel.EntityFilter?
        if let modelEntity = model.entityFilter {
            let entity = GetPhotosOperationModel.Entity(entityId: modelEntity.entity.entityId, entityType: modelEntity.entity.entityType)
            let filter = GetPhotosOperationModel.Filter(userId: modelEntity.filter.userId, collectionId: modelEntity.filter.collectionId)
            
            entityFilter = GetPhotosOperationModel.EntityFilter(limit: modelEntity.limit, skip: modelEntity.skip, entity: entity, filter: filter)
        }
        let operationModel = GetPhotosOperationModel.Request(photoIds: model.photoIds, entityFilter: entityFilter)
        let operation = GetPhotosOperation(model: operationModel) { (result) in
            switch result {
            case .success(let value): completionHandler(Result.success(value.photos)); break
            case .failure(let error): completionHandler(Result.failure(error)); break
            }
        }
        
        self.operationQueue.addOperation(operation)
    }
}
