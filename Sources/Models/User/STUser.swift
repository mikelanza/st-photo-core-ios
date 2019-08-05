//
//  STUser.swift
//  STPhotoCore
//
//  Created by Dimitri Strauneanu on 20/05/2019.
//  Copyright © 2019 mikelanza. All rights reserved.
//

import Foundation

public struct STUser: Codable {
    public var id: String
    
    public var firstName: String { return self._firstName ?? "" }
    public var _firstName: String?
    
    public var lastName: String { return self._lastName ?? "" }
    public var _lastName: String?
    
    public var name: String { return String(format: "%@ %@", self.firstName, self.lastName) }
    
    public init(id: String) {
        self.id = id
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "objectId"
        case _firstName = "firstName"
        case _lastName = "lastName"
    }
}
