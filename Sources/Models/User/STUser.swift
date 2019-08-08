//
//  STUser.swift
//  STPhotoCore
//
//  Created by Dimitri Strauneanu on 20/05/2019.
//  Copyright © 2019 mikelanza. All rights reserved.
//

import Foundation

public class STUser: Codable {
    public var id: String
    public var createdAt: Date
    
    public var firstName: String { return self._firstName ?? "" }
    public var _firstName: String?
    
    public var lastName: String { return self._lastName ?? "" }
    public var _lastName: String?
    
    public var name: String { return String(format: "%@ %@", self.firstName, self.lastName) }
    public var fhUsername: String?
    
    public var photo: STPhoto?
    
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
        case _firstName = "firstName"
        case _lastName = "lastName"
        case fhUsername = "fiveHundredUsername"
        case photo = "profilePicture"
    }
}
