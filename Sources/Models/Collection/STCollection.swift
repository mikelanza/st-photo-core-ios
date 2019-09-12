//
//  STCollection.swift
//  STPhotoCore-iOS
//
//  Created by Dimitri Strauneanu on 29/07/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

public struct STCollection: Codable {
    public var id: String
    
    public var name: String = ""
    
    public init(id: String, name: String = "") {
        self.id = id
        self.name = name
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decodeWrapper(key: .name, defaultValue: "")
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "objectId"
        case name = "name"
    }
}
