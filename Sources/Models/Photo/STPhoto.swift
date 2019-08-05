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
    
    public var _location: [Double] = []
    public var location: STLocation? {
        if self._location.count > 1 {
            return STLocation(latitude: self._location[1], longitude: self._location[0])
        }
        return nil
    }
    
    public var collectionId: String?
    
    public var blockId: Int = -1
    public var neighborhoodId: Int = -1
    public var cityId: Int = -1
    public var countyId: Int = -1
    public var stateId: Int = -1
    public var countryId: Int = -1
    
    public var likeCount: Int = 0
    public var commentCount: Int = 0
    
    public var dominantColor: String = "FFFFFF"
    
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
        case user = "owner"
        case _text = "descriptionText"
        case _fhUsername = "fhOwnerUsername"
        case imageUrl = "imageOriginalURL"
        case image1200Url = "imageWidth1200URL"
        case image750Url = "imageWidth750URL"
        case image650Url = "imageWidth650URL"
        case _location = "location"
        case collectionId = "collectionID"
        case blockId = "blockID"
        case neighborhoodId = "neighborhoodID"
        case cityId = "cityID"
        case countyId = "countyID"
        case stateId = "stateID"
        case countryId = "countryID"
        case likeCount = "likes"
        case commentCount = "comments"
        case dominantColor = "dominantColor"
    }
}
