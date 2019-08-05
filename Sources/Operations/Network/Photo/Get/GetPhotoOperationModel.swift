//
//  GetPhotoOperationModel.swift
//  STPhotoCore
//
//  Created by Dimitri Strauneanu on 20/05/2019.
//  Copyright © 2019 mikelanza. All rights reserved.
//

import Foundation

public enum GetPhotoOperationModel {
    public struct Request {
        public let photoId: String
        public let includeUser: Bool
        
        public init(photoId: String, includeUser: Bool = true) {
            self.photoId = photoId
            self.includeUser = includeUser
        }
    }
    
    public struct Response: Codable {
        public let photo: STPhoto
        
        public init(photo: STPhoto) {
            self.photo = photo
        }
    }
}
