//
//  PhotoCollectionTaskModel.swift
//  STPhotoCore-iOS
//
//  Created by Crasneanu Cristian on 12/09/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import UIKit

public enum PhotoCommentsTaskModel {
    public struct Fetch {
        public var photoId: String
        public var page: Int
        public var limit: Int
        
        public init(photoId: String, page: Int, limit: Int) {
            self.photoId = photoId
            self.page = page
            self.limit = limit
        }
    }
}
