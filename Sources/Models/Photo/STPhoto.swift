//
//  STPhoto.swift
//  STPhotoCore
//
//  Created by Dimitri Strauneanu on 20/05/2019.
//  Copyright © 2019 mikelanza. All rights reserved.
//

import Foundation

public class STPhoto: Codable {
    public var id: String
    public var createdAt: Date
    public var user: STUser?
    
    public var imageUrl: String?
    
    public var image1200Url: String?
    public var image750Url: String?
    public var image650Url: String?
    
    public var image350Url: String?
    public var image250Url: String?
    public var image120Url: String?
    public var image60Url: String?
    public var image40Url: String?
    public var image20Url: String?
    
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
    
    public convenience init(id: String) {
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
        case image350Url = "image350URL"
        case image250Url = "image250URL"
        case image120Url = "image120URL"
        case image60Url = "image60URL"
        case image40Url = "image40URL"
        case image20Url = "image20URL"
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
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decodeWrapper(key: .createdAt, defaultValue: Date())
        self.user = try container.decodeIfPresent(STUser.self, forKey: .user)
        
        self.imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
        
        self.image1200Url = try container.decodeIfPresent(String.self, forKey: .image1200Url)
        self.image750Url = try container.decodeIfPresent(String.self, forKey: .image750Url)
        self.image650Url = try container.decodeIfPresent(String.self, forKey: .image650Url)
        
        self.image350Url = try container.decodeIfPresent(String.self, forKey: .image350Url)
        self.image250Url = try container.decodeIfPresent(String.self, forKey: .image250Url)
        self.image120Url = try container.decodeIfPresent(String.self, forKey: .image120Url)
        self.image60Url = try container.decodeIfPresent(String.self, forKey: .image60Url)
        self.image40Url = try container.decodeIfPresent(String.self, forKey: .image40Url)
        self.image20Url = try container.decodeIfPresent(String.self, forKey: .image20Url)
        
        self._text = try container.decodeIfPresent(String.self, forKey: ._text)
        self._fhUsername = try container.decodeIfPresent(String.self, forKey: ._fhUsername)
        self.collectionId = try container.decodeIfPresent(String.self, forKey: .collectionId)
        
        self.blockId = try container.decodeWrapper(key: .blockId, defaultValue: -1)
        self.neighborhoodId = try container.decodeWrapper(key: .neighborhoodId, defaultValue: -1)
        self.cityId = try container.decodeWrapper(key: .cityId, defaultValue: -1)
        self.countyId = try container.decodeWrapper(key: .countyId, defaultValue: -1)
        self.stateId = try container.decodeWrapper(key: .stateId, defaultValue: -1)
        self.countryId = try container.decodeWrapper(key: .countryId, defaultValue: -1)
        
        self.likeCount = try container.decodeWrapper(key: .likeCount, defaultValue: 0)
        self.commentCount = try container.decodeWrapper(key: .commentCount, defaultValue: 0)
        
        self.dominantColor = try container.decodeWrapper(key: .dominantColor, defaultValue: "FFFFFF")
        
        self.decodeLocation(container: container)
    }
    
    private func decodeLocation(container: KeyedDecodingContainer<STPhoto.CodingKeys>) {
        if let array = try? container.decodeIfPresent([Double].self, forKey: ._location) {
            self._location = array
        } else if let location = try? container.decodeIfPresent(Location.self, forKey: ._location) {
            self._location = [location.latitude, location.longitude]
        } else {
            self._location = []
        }
    }
    
    private struct Location: Codable {
        var type: String
        var latitude: Double
        var longitude: Double
        
        enum CodingKeys: String, CodingKey {
            case type = "__type"
            case latitude = "latitude"
            case longitude = "longitude"
        }
    }
}
