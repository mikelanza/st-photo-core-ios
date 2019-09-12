//
//  PhotosTaskModel.swift
//  STPhotoCore-iOS
//
//  Created by Crasneanu Cristian on 12/09/2019.
//  Copyright © 2019 mikelanza. All rights reserved.
//

import UIKit

public enum PhotosTaskModel {
    public struct Fetch {
        public var photoIds: [String]?
        public var entityFilter: EntityFilter?
        
        public init() {
        }
    }
    
    public struct EntityFilter {
        let limit: Int
        let skip: Int
        let entity: Entity
        let filter: Filter
        
        public init(limit: Int, skip: Int, entity: Entity, filter: Filter) {
            self.limit = limit
            self.skip = skip
            self.entity = entity
            self.filter = filter
        }
    }
    
    public struct Entity {
        let entityId: Int
        let entityType: String
        
        public init(entityId: Int, entityType: String) {
            self.entityId = entityId
            self.entityType = entityType
        }
    }
    
    public struct Filter {
        let userId: String?
        let collectionId: String?
        
        public init(userId: String?, collectionId: String?) {
            self.userId = userId
            self.collectionId = collectionId
        }
    }
}