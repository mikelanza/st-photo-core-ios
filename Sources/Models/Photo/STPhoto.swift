//
//  STPhoto.swift
//  STPhotoCore
//
//  Created by Dimitri Strauneanu on 20/05/2019.
//  Copyright © 2019 mikelanza. All rights reserved.
//

import Foundation

public struct STPhoto: Codable {
    public var id: String
    public var createdAt: Date
    public var user: STUser?
    
    public var imageUrl: String?
    public var image1200Url: String?
    public var image750Url: String?
    public var image650Url: String?
    
    public var text: String { return self._text ?? "" }
    public var _text: String?
    
    public var fhUsername: String { return self._fhUsername ?? "" }
    public var _fhUsername: String?
    
    public init(id: String, createdAt: Date) {
        self.id = id
        self.createdAt = createdAt
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "objectId"
        case createdAt = "createdAt"
        case user = "owner"
        case _text = "descriptionText"
        case _fhUsername = "fhOwnerUsername"
        case imageUrl = "imageOriginalURL"
        case image1200Url = "imageWidth1200URL"
        case image750Url = "imageWidth750URL"
        case image650Url = "imageWidth650URL"
    }
}
