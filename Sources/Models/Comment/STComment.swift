//
//  STComment.swift
//  STPhotoCore-iOS
//
//  Created by Dimitri Strauneanu on 31/07/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

public struct STComment: Codable {
    public var id: String
    public var createdAt: Date
    
    public var user: STUser?
    public var photoId: String?
    public var text: String = ""
    
    public init(id: String) {
        self.init(id: id, createdAt: Date())
    }
    
    public init(id: String, createdAt: Date) {
        self.id = id
        self.createdAt = createdAt
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "objectId"
        case createdAt = "createdAt"
        case user = "user"
        case photoId = "photoId"
        case text = "text"
    }
}
